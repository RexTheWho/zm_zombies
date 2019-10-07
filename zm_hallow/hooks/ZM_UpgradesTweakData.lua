

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "init_zm_upgrades", function(self)
	log("// ZOMBIES MODE UPGRADE //")
	
	self.values.player.body_armor = {}
	self.values.player.body_armor = {
		armor = {
			10,
			10,
			10,
			10,
			10,
			10,
			10
		},
		movement = {
			1,
			1,
			1,
			1,
			1,
			1,
			1
		},
		concealment = {
			30,
			30,
			30,
			30,
			30,
			30,
			30
		},
		dodge = {
			0,
			0,
			0,
			0,
			0,
			0,
			0
		},
		damage_shake = {
			0.75,
			0.75,
			0.75,
			0.75,
			0.75,
			0.75,
			0.75
		},
		stamina = {
			0.75,
			0.75,
			0.75,
			0.75,
			0.75,
			0.75,
			0.75
		}
	}
	
end)









