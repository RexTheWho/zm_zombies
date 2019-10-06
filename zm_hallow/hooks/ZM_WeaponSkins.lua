Hooks:PostHook(BlackMarketTweakData, "_init_weapon_skins", "zm_init_new_weapon_camos", function(self)
    self.weapon_skins.pap1 = {
        name_id = "none",
		desc_id = "none",
		weapon_id = "none",
		rarity = "common",
		bonus = "spread_p1",
		reserve_quality = true,
		base_gradient =		"units/pd2_mod_zombies/skins/pap_1/base_gradient/base_pack-a-punch",
		pattern_gradient =	"units/pd2_mod_zombies/skins/pap_1/pattern_gradient/patgra_pack-a-punch",
		pattern =			"units/pd2_mod_zombies/skins/pap_1/pattern/pat_pack-a-punch",
		cubemap_pattern_control = Vector3(1, 1, 1)
	}
end)
