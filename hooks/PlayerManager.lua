Hooks:PreHook(PlayerManager, "init", "zm_init_perk", function(self)
    self._has_perk_juggernog = false
    self._wunderwaffe_unlocked = false
	self.totalCopAlive = 0
	self._show_point_list = false
	self._god = false
end)

Hooks:PostHook(PlayerManager, "update", "zm_upd_perk", function(self, t, dt)
	if not self._show_point_list then
		DelayedCalls:Add( "ZmShowPointsDelay", 2, function()
			managers.wdu:_update_hud_element()
		end)
		
		self._show_point_list = true
	end

    local player = self:player_unit()

    if self:has_special_equipment("perk_juggernog") then
		if not self._has_perk_juggernog then
			if player then
				player:character_damage():replenish()
				local new_health = tonumber(player:character_damage():_max_health()) * 2
				player:character_damage():change_health(new_health)
				self._has_perk_juggernog = true
			end
        end
    end

	local GCS = PlayerManager.get_current_state
	
	if not self._wunderwaffe_unlocked then
		if GCS and type(GCS) == "function" then
			local current_state = self:get_current_state()
			if current_state then
				local current_weapon = current_state:get_equipped_weapon()
				if current_weapon then
					if current_weapon.name_id == "wunderwaffe_primary" or current_weapon.name_id == "wunderwaffe_secondary" then
						local lip = SoundDevice:create_source("lip")
						lip:post_event("zm_announcer_wunder")
						LuaNetworking:SendToPeers( "ZMWunderwaffeUnlocked", "1" )
						self._wunderwaffe_unlocked = true
					end
				end
			end
		end
    end
	
	if GCS and type(GCS) == "function" then
		local current_state = self:get_current_state()
		if current_state then
			local current_weapon = current_state:get_equipped_weapon()

			if current_weapon then
				local weapon = current_weapon.name_id
				local weapon_name_id = managers.localization:text(tweak_data.weapon[weapon].name_id)

				if weapon == "nothing2_primary" then
					weapon_name_id = ""
				end

				managers.hud._hud_zm_waves.weapon_name_bottom_right:set_text(tostring(weapon_name_id))
				
				current_weapon:_update_rof_on_perk()
			end
		end
	end

	self:_count_nb_perks()
end)

function PlayerManager:_count_nb_perks()
	local count_perks = 0

	if self:has_special_equipment("perk_quickrevive") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_juggernog") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_speedcola") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_doubletap") then count_perks = count_perks + 1 end
	if self:has_special_equipment("perk_deadshot") then count_perks = count_perks + 1 end
	if self:has_special_equipment("perk_staminup") then count_perks = count_perks + 1 end
	
	return count_perks
end

function PlayerManager:_update_cops_alive(change)
    self.totalCopAlive = self.totalCopAlive + change
end

Hooks:PostHook(PlayerManager, "check_skills", "pm_post_check_skills", function(self)    
    self:register_message(Message.OnWeaponFired, "wunderwaffe_shot", callback(SniperGrazeDamage, SniperGrazeDamage, "on_wunderwaffe_fired"))
end)

Hooks:PostHook(PlayerManager, "_internal_load", "pm_post_internal_load", function(self)
	local player = self:player_unit()

	if not player then
		return
	end

	-- player:inventory():set_melee_weapon("zdann")
end)

function PlayerManager:add_grenade_amount(amount, sync)
	local peer_id = managers.network:session():local_peer():id()
	local grenade = self._global.synced_grenades[peer_id].grenade
	local tweak = tweak_data.blackmarket.projectiles[grenade]
	local max_amount = self:get_max_grenades_by_peer_id(peer_id)
	local icon = tweak.icon
	local previous_amount = self._global.synced_grenades[peer_id].amount

	if amount > 0 and tweak.base_cooldown then
		managers.hud:animate_grenade_flash(HUDManager.PLAYER_PANEL)
	end

	amount = math.min(Application:digest_value(previous_amount, false) + amount, max_amount)

	if amount < max_amount and tweak.base_cooldown then
		self:replenish_grenades(tweak.base_cooldown)
	elseif amount > max_amount then
		amount = max_amount
	end

	managers.hud:set_teammate_grenades_amount(HUDManager.PLAYER_PANEL, {
		icon = icon,
		amount = amount
	})
	self:update_grenades_amount_to_peers(grenade, amount, sync and peer_id)
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_Wunderwaffe_unlock", function(sender, id, data)
    if id == "ZMWunderwaffeUnlocked" then
        local lip = SoundDevice:create_source("lip")
        lip:post_event("zm_announcer_wunder")
        managers.player._wunderwaffe_unlocked = true
    end

    if id == "ZMRoachUnlocked" then
        local lip = SoundDevice:create_source("lip")
        lip:post_event("zm_announcer_roach")
        managers.player._roach_unlocked = true
    end
end)