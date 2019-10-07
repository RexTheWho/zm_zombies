EditorWeaponSwitch = EditorWeaponSwitch or class(MissionScriptEditor)
function EditorWeaponSwitch:create_element()
	self.super.create_element(self)
	self._element.class = "ElementWeaponSwitch"
end

function EditorWeaponSwitch:_build_panel()
	self:_create_panel()
	self:BooleanCtrl("instigator_only")
	
	self:StringCtrl("weapon_id")
	-- self:ComboCtrl("weapon_id", table.list_add({"none"}, tweak_data.weapons:get_weapon_ids()))

	self:BooleanCtrl("is_secondary")
	self:StringCtrl("skin_id")
	self:BooleanCtrl("is_pap_engine")
	self:BooleanCtrl("is_mystery_box")
	self:BooleanCtrl("is_grenade_spot")
	self:BooleanCtrl("force_classic_id")
end
