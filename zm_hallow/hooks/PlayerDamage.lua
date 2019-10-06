function PlayerDamage:_raw_max_health()
	local base_max_health = self._HEALTH_INIT + managers.player:health_skill_addend()
	local mul = managers.player:health_skill_multiplier()
	
    local juggernog_mul = managers.player:has_special_equipment("perk_juggernog") and 2 or 1

	return (base_max_health * mul) * juggernog_mul
end

function PlayerDamage:_chk_cheat_death(is_tazed)
    if Application:digest_value(self._revives, false) > 1 and not self._check_berserker_done and managers.player:has_special_equipment("perk_quickrevive") then
        if managers.wdu:_is_solo() then
            local player_name = managers.network.account:username()
            local text_concat = "Reviving " .. player_name .. " ..."
            managers.hud:present_mid_text( { text = text_concat, title = "Quick Revive", time = 6 } )
            self._auto_revive_timer = 6.5

            DelayedCalls:Add( "ZmRemoveQuickReviveIn", 6.5, function()
                managers.player:remove_special("perk_quickrevive")
			end)
			
            return
        end
	end

	if not is_tazed and Application:digest_value(self._revives, false) > 1 and not self._check_berserker_done and managers.player:has_category_upgrade("player", "cheat_death_chance") then
		local r = math.rand(1)

		if r <= managers.player:upgrade_value("player", "cheat_death_chance", 0) then
			self._auto_revive_timer = 1
		end
	end
end

Hooks:PreHook(PlayerDamage, "on_downed", "zm_remove_perks_on_down", function(self)
    if managers.player:has_special_equipment("perk_juggernog") then
        managers.player:remove_special("perk_juggernog")
    end
    if managers.player:has_special_equipment("perk_speedcola") then
        managers.player:remove_special("perk_speedcola")
    end
    if managers.player:has_special_equipment("perk_doubletap") then
        managers.player:remove_special("perk_doubletap")
	end
	if managers.player:has_special_equipment("perk_deadshot") then
        managers.player:remove_special("perk_deadshot")
	end
	if managers.player:has_special_equipment("perk_staminup") then
        managers.player:remove_special("perk_staminup")
    end
    if not managers.wdu:_is_solo() and managers.player:has_special_equipment("perk_quickrevive") then
        managers.player:remove_special("perk_quickrevive")
	end
	
	local points_to_remove = managers.wdu:points_round(0 - managers.wdu:_get_own_money() / 4)
	managers.wdu:_add_money_to(managers.wdu:_peer_id(), math.floor(points_to_remove))
end)

function PlayerDamage:damage_fall(data)
	local damage_info = {result = {
		variant = "fall",
		type = "hurt"
	}}

	if self._god_mode or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self:incapacitated() then
		return
	elseif self._unit:movement():current_state().immortal then
		return
	elseif self._mission_damage_blockers.damage_fall_disabled then
		return
	end

	local height_limit = 300
	local death_limit = 631

	if data.height < height_limit then
		return
	end

	local die = death_limit < data.height

	self._unit:sound():play("player_hit")
	managers.environment_controller:hit_feedback_down()
	managers.hud:on_hit_direction(Vector3(0, 0, 0), die and HUDHitDirection.DAMAGE_TYPES.HEALTH or HUDHitDirection.DAMAGE_TYPES.ARMOUR, 0)

	if self._bleed_out and self._unit:movement():current_state_name() ~= "jerry1" then
		return
	end

	local health_damage_multiplier = 0

	if die then
		self._check_berserker_done = false

		self:set_health(0)

		if self._unit:movement():current_state_name() == "jerry1" then
			self._revives = Application:digest_value(1, true)
        end
        
        if managers.wdu:_is_solo() and managers.player:has_special_equipment("perk_quickrevive") then
            self:_chk_cheat_death()
        end
	else
		health_damage_multiplier = managers.player:upgrade_value("player", "fall_damage_multiplier", 1) * managers.player:upgrade_value("player", "fall_health_damage_multiplier", 1)

		self:change_health(-(tweak_data.player.fall_health_damage * health_damage_multiplier))
	end

	if die or health_damage_multiplier > 0 then
		local alert_rad = tweak_data.player.fall_damage_alert_size or 500
		local new_alert = {
			"vo_cbt",
			self._unit:movement():m_head_pos(),
			alert_rad,
			self._unit:movement():SO_access(),
			self._unit
		}

		managers.groupai:state():propagate_alert(new_alert)
	end

	local max_armor = self:_max_armor()

	if die then
		self:set_armor(0)
	else
		self:change_armor(-max_armor * managers.player:upgrade_value("player", "fall_damage_multiplier", 1))
	end

	SoundDevice:set_rtpc("shield_status", 0)
	self:_send_set_armor()

	self._bleed_out_blocked_by_movement_state = nil

	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	self:_damage_screen()
	self:_check_bleed_out(nil, true)
	self:_call_listeners(damage_info)

	return true
end