EditorSpawnSafeEnemyDummy = EditorSpawnSafeEnemyDummy or class(MissionScriptEditor)
EditorSpawnSafeEnemyDummy.USES_POINT_ORIENTATION = true
EditorSpawnSafeEnemyDummy.INSTANCE_VAR_NAMES = {
	{type = "enemy", value = "enemy"},
	{
		type = "enemy_spawn_action",
		value = "spawn_action"
	}
}
EditorSpawnSafeEnemyDummy._enemies = {}

function EditorSpawnSafeEnemyDummy:create_element()
	self.super.create_element(self)
	self._element.class = "ElementSpawnSafeEnemyDummy"
	self._element.values.enemy = "units/payday2/characters/ene_swat_1/ene_swat_1"
	self._element.values.force_pickup = "none"
	self._element.values.spawn_action = "none"
	self._element.values.participate_to_group_ai = true
	self._element.values.interval = 5
	self._element.values.amount = 0
	self._element.values.accessibility = "any"
	self._element.values.voice = 0
	self._element.values.team = "default"
end

function EditorSpawnSafeEnemyDummy:test_element() 
	if not managers.navigation:is_data_ready() then
		return
	end
	if self._element.values.enemy ~= "none" and managers.groupai:state():is_AI_enabled() then
		local unit = safe_spawn_unit(Idstring(self._element.values.enemy), self._unit:position(), self._unit:rotation())
		if not unit then
			return
		end
		table.insert(self._enemies, unit)
		unit:brain():set_logic("inactive", nil)
		local team_id = self:_resolve_team(unit)
		managers.groupai:state():set_char_team(unit, team_id)
		local action_desc = ElementSpawnEnemyDummy._create_action_data(self:get_spawn_anim())
		unit:movement():action_request(action_desc)
		unit:movement():set_position(unit:position())
	end
end

function EditorSpawnSafeEnemyDummy:get_spawn_anim()
	return self._element.values.spawn_action
end

function EditorSpawnSafeEnemyDummy:stop_test_element()
	for _, enemy in ipairs(self._enemies) do
		enemy:set_slot(0)
	end
	self._enemies = {}
end

function EditorSpawnSafeEnemyDummy:_build_panel()
	self:_create_panel()
	self:PathCtrl("enemy", "unit", 12)
	self:BooleanCtrl("participate_to_group_ai")
	local spawn_action_options = clone(CopActionAct._act_redirects.enemy_spawn)
	table.insert(spawn_action_options, "none")
	self:ComboCtrl("spawn_action", spawn_action_options)
	self:NumberCtrl("interval", {floats = 2, min = 0, help = "Used to specify how often this spawn can be used. 0 means no interval"})
	self:NumberCtrl("voice", {
		floats = 0,
		min = 0,
		max = 5, 
		text = "Voice variant. 1-5. 0 for random."
	})
	self:ComboCtrl("accessibility", ElementSpawnEnemyDummy.ACCESSIBILITIES, {help = "Only units with this movement type will be spawned from this element."})
	local pickups = table.map_keys(tweak_data.pickups)
	table.insert(pickups, "none")
	table.insert(pickups, "no_pickup")
	self:ComboCtrl("force_pickup", pickups)
	self:ComboCtrl("team", table.list_add({"default"}, tweak_data.levels:get_team_names_indexed()), {help = "Select the character's team."})
end


local unit_ids = Idstring("unit")
function EditorSpawnSafeEnemyDummy:set_element_data(item, ...)
	if item.name == "enemy" then
		local assets = self:GetPart("world")._assets_manager
		local unit = item:Value()
		local spawn_ids = unit:id()
		if not DB:has(unit_ids, spawn_ids) then
			return
		end
		if not PackageManager:has(unit_ids, spawn_ids) and assets then
			BeardLibEditor.Utils:QuickDialog({title = "Load unit", message = "This unit is not loaded"}, {{"Search for package", function()
				assets:find_package(unit, true, ClassClbk(self, "set_element_data", item))
			end}})
			return
		end
	end
	EditorSpawnSafeEnemyDummy.super.set_element_data(self, item, ...)
end


function EditorSpawnSafeEnemyDummy:_resolve_team(unit)
	if self._element.values.team == "default" then
		return tweak_data.levels:get_default_team_ID(unit:base():char_tweak().access == "gangster" and "gangster" or "combatant")
	else
		return self._element.values.team
	end
end