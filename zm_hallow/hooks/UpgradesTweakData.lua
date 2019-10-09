Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "zm_explosive_bullet_tweak", function(self)
	self.explosive_bullet.player_dmg_mul = 0.01
	self.explosive_bullet.range = 400
end)