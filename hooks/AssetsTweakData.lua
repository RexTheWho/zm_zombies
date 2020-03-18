Hooks:PostHook(AssetsTweakData, "_init_assets", "zm_init_assets", function(self, tweak_data)
    self.perk_mechanics = {
		name_id = "zm_perk_mechanics",
		texture = "units/pd2_mod_zombies/guis/assets/perk_mechanics",
		no_mystery = true
	}
end)

Hooks:PostHook(AssetsTweakData, "_init_risk_assets", "zm_ignore_risk_asset", function(self, tweak_data)
    table.insert(self.risk_pd.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_swat.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_fbi.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_death_squad.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_easy_wish.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_death_wish.exclude_stages, "zm_cabinflesh")
    table.insert(self.risk_sm_wish.exclude_stages, "zm_cabinflesh")
end)

Hooks:PostHook(AssetsTweakData, "_init_gage_assets", "zm_ignore_gage_asset", function(self, tweak_data)
    table.insert(self.gage_assignment.exclude_stages, "zm_cabinflesh")
end)