Hooks:PostHook(PlayerTweakData, "init", "zm_no_penalty_timer", function(self)
	self.damage.respawn_time_penalty = 0
	self.damage.base_respawn_time_penalty = 1
end)

Hooks:PostHook(PlayerTweakData, "_init_new_stances", "zm_init_new_stances", function(self)
    self.stances.nothing2_primary = deep_clone(self.stances.default)
    self.stances.nothing2_primary.standard.shoulders.translation = Vector3(1, 999999999, 0.2)
    self.stances.nothing2_primary.steelsight.shoulders.translation = Vector3(1, 999999999, 0.2)
    self.stances.nothing2_primary.crouched.shoulders.translation = Vector3(1, 999999999, -0.2)

	self.stances.wunderwaffe_primary = deep_clone(self.stances.default)
	local pivot_shoulder_translation = Vector3(10.5287, 10.4677, 0.247723)
	local pivot_shoulder_rotation = Rotation(0.000398715, -0.000868289, -0.000330621)
	local pivot_head_translation = Vector3(10, 14, 1)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.wunderwaffe_primary.standard.shoulders.translation = Vector3(-0.777, 5.503, 4.127)
	self.stances.wunderwaffe_primary.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.wunderwaffe_primary.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -86, 0)
	local pivot_head_translation = Vector3(0, 20, 0)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.wunderwaffe_primary.steelsight.shoulders.translation = Vector3(-10.529, 9.532, 2)
	self.stances.wunderwaffe_primary.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.wunderwaffe_primary.steelsight.zoom_fov = false
	self.stances.wunderwaffe_primary.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -50, 0)
	self.stances.wunderwaffe_primary.steelsight.vel_overshot.yaw_neg = 0
	self.stances.wunderwaffe_primary.steelsight.vel_overshot.yaw_pos = -0
	self.stances.wunderwaffe_primary.steelsight.vel_overshot.pitch_neg = -0
	self.stances.wunderwaffe_primary.steelsight.vel_overshot.pitch_pos = 0
	local pivot_head_translation = Vector3(9, 13, -1)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.wunderwaffe_primary.crouched.shoulders.translation = Vector3(-0.777, 5.503, 4.127)
	self.stances.wunderwaffe_primary.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.wunderwaffe_primary.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -36, 0)

	self.stances.wunderwaffe_secondary = deep_clone(self.stances.wunderwaffe_primary)
	self.stances.wunderwaffe_dg3_primary = deep_clone(self.stances.wunderwaffe_primary)
	self.stances.wunderwaffe_dg3_secondary = deep_clone(self.stances.wunderwaffe_primary)
	
	self.stances.colt_1911_primary = deep_clone(self.stances.colt_1911)
	self.stances.colt_1911_secondary = deep_clone(self.stances.colt_1911)
	
	self.stances.new_m14_primary = deep_clone(self.stances.new_m14)
	self.stances.new_m14_secondary = deep_clone(self.stances.new_m14)
	self.stances.new_m14_upg_primary = deep_clone(self.stances.new_m14)
	self.stances.new_m14_upg_secondary = deep_clone(self.stances.new_m14)
	
	self.stances.b682_primary = deep_clone(self.stances.b682)
	self.stances.b682_secondary = deep_clone(self.stances.b682)
	
	self.stances.mp9_primary = deep_clone(self.stances.mp9)
	self.stances.mp9_secondary = deep_clone(self.stances.mp9)
	
	self.stances.m95_primary = deep_clone(self.stances.m95)
	self.stances.m95_secondary = deep_clone(self.stances.m95)
	self.stances.m95_upg_primary = deep_clone(self.stances.m95)
	self.stances.m95_upg_secondary = deep_clone(self.stances.m95)
	
	self.stances.colt_1911_upg_primary = deep_clone(self.stances.colt_1911)
	self.stances.colt_1911_upg_secondary = deep_clone(self.stances.colt_1911)
	
	self.stances.b682_upg_primary = deep_clone(self.stances.b682)
	self.stances.b682_upg_secondary = deep_clone(self.stances.b682)
	
	self.stances.mp9_upg_primary = deep_clone(self.stances.mp9)
	self.stances.mp9_upg_secondary = deep_clone(self.stances.mp9)
	
	self.stances.roach_primary = deep_clone(self.stances.siltstone)
	self.stances.roach_secondary = deep_clone(self.stances.siltstone)
	self.stances.roach_upg_primary = deep_clone(self.stances.siltstone)
	self.stances.roach_upg_secondary = deep_clone(self.stances.siltstone)

	--shovel approved new stances
	self.stances.amcar_primary = deep_clone(self.stances.amcar)
	self.stances.amcar_secondary = deep_clone(self.stances.amcar)
	self.stances.amcar_upg_primary = deep_clone(self.stances.amcar)
	self.stances.amcar_upg_secondary = deep_clone(self.stances.amcar)

	self.stances.aug_primary = deep_clone(self.stances.aug)
	self.stances.aug_secondary = deep_clone(self.stances.aug)
	self.stances.aug_upg_primary = deep_clone(self.stances.aug)
	self.stances.aug_upg_secondary = deep_clone(self.stances.aug)

	self.stances.fal_primary = deep_clone(self.stances.fal)
	self.stances.fal_secondary = deep_clone(self.stances.fal)
	self.stances.fal_upg_primary = deep_clone(self.stances.fal)
	self.stances.fal_upg_secondary = deep_clone(self.stances.fal)
	
	self.stances.flint_primary = deep_clone(self.stances.flint)
	self.stances.flint_secondary = deep_clone(self.stances.flint)
	self.stances.flint_upg_primary = deep_clone(self.stances.flint)
	self.stances.flint_upg_secondary = deep_clone(self.stances.flint)
	
	self.stances.m16_primary = deep_clone(self.stances.m16)
	self.stances.m16_secondary = deep_clone(self.stances.m16)
	self.stances.m16_upg_primary = deep_clone(self.stances.m16)
	self.stances.m16_upg_secondary = deep_clone(self.stances.m16)
	
	self.stances.scar_primary = deep_clone(self.stances.scar)
	self.stances.scar_secondary = deep_clone(self.stances.scar)
	self.stances.scar_upg_primary = deep_clone(self.stances.scar)
	self.stances.scar_upg_secondary = deep_clone(self.stances.scar)
	
	self.stances.hk21_primary = deep_clone(self.stances.hk21)
	self.stances.hk21_secondary = deep_clone(self.stances.hk21)
	self.stances.hk21_upg_primary = deep_clone(self.stances.hk21)
	self.stances.hk21_upg_secondary = deep_clone(self.stances.hk21)
	
	self.stances.m249_primary = deep_clone(self.stances.m249)
	self.stances.m249_secondary = deep_clone(self.stances.m249)
	self.stances.m249_upg_primary = deep_clone(self.stances.m249)
	self.stances.m249_upg_secondary = deep_clone(self.stances.m249)
	
	self.stances.breech_primary = deep_clone(self.stances.breech)
	self.stances.breech_secondary = deep_clone(self.stances.breech)
	self.stances.breech_upg_primary = deep_clone(self.stances.breech)
	self.stances.breech_upg_secondary = deep_clone(self.stances.breech)
	
	self.stances.deagle_primary = deep_clone(self.stances.deagle)
	self.stances.deagle_secondary = deep_clone(self.stances.deagle)
	self.stances.deagle_upg_primary = deep_clone(self.stances.deagle)
	self.stances.deagle_upg_secondary = deep_clone(self.stances.deagle)
	
	self.stances.judge_primary = deep_clone(self.stances.judge)
	self.stances.judge_secondary = deep_clone(self.stances.judge)
	self.stances.judge_upg_primary = deep_clone(self.stances.judge)
	self.stances.judge_upg_secondary = deep_clone(self.stances.judge)
	
	self.stances.peacemaker_primary = deep_clone(self.stances.peacemaker)
	self.stances.peacemaker_secondary = deep_clone(self.stances.peacemaker)
	self.stances.peacemaker_upg_primary = deep_clone(self.stances.peacemaker)
	self.stances.peacemaker_upg_secondary = deep_clone(self.stances.peacemaker)
	
	self.stances.new_raging_bull_primary = deep_clone(self.stances.new_raging_bull)
	self.stances.new_raging_bull_secondary = deep_clone(self.stances.new_raging_bull)
	self.stances.new_raging_bull_upg_primary = deep_clone(self.stances.new_raging_bull)
	self.stances.new_raging_bull_upg_secondary = deep_clone(self.stances.new_raging_bull)
	
	self.stances.striker_primary = deep_clone(self.stances.striker)
	self.stances.striker_secondary = deep_clone(self.stances.striker)
	self.stances.striker_upg_primary = deep_clone(self.stances.striker)
	self.stances.striker_upg_secondary = deep_clone(self.stances.striker)
	
	self.stances.p90_primary = deep_clone(self.stances.p90)
	self.stances.p90_secondary = deep_clone(self.stances.p90)
	self.stances.p90_upg_primary = deep_clone(self.stances.p90)
	self.stances.p90_upg_secondary = deep_clone(self.stances.p90)
		
	self.stances.m1928_primary = deep_clone(self.stances.m1928)
	self.stances.m1928_secondary = deep_clone(self.stances.m1928)
	self.stances.m1928_upg_primary = deep_clone(self.stances.m1928)
	self.stances.m1928_upg_secondary = deep_clone(self.stances.m1928)
	
	self.stances.rpg7_primary = deep_clone(self.stances.rpg7)
	self.stances.rpg7_secondary = deep_clone(self.stances.rpg7)
	self.stances.rpg7_upg_primary = deep_clone(self.stances.rpg7)
	self.stances.rpg7_upg_secondary = deep_clone(self.stances.rpg7)
	
	self.stances.ray_primary = deep_clone(self.stances.ray)
	self.stances.ray_primary = deep_clone(self.stances.ray)
	self.stances.ray_secondary = deep_clone(self.stances.ray)
	self.stances.ray_secondary = deep_clone(self.stances.ray)
	
	--shovel mkii stances
	self.stances.ak74_primary = deep_clone(self.stances.ak74)
	self.stances.ak74_secondary = deep_clone(self.stances.ak74)
	self.stances.ak74_upg_primary = deep_clone(self.stances.ak74)
	self.stances.ak74_upg_primary.steelsight.shoulders.translation = Vector3(-10.745, -10.371, 4.81)
	self.stances.ak74_upg_secondary = deep_clone(self.stances.ak74)
	self.stances.ak74_upg_secondary.steelsight.shoulders.translation = Vector3(-10.745, -10.371, 4.81)
	
	self.stances.ching_primary = deep_clone(self.stances.ching)
	self.stances.ching_secondary = deep_clone(self.stances.ching)
	self.stances.ching_upg_primary = deep_clone(self.stances.ching)
	self.stances.ching_upg_secondary = deep_clone(self.stances.ching)
	
	self.stances.lemming_primary = deep_clone(self.stances.lemming)
	self.stances.lemming_secondary = deep_clone(self.stances.lemming)
	self.stances.lemming_upg_primary = deep_clone(self.stances.lemming)
	self.stances.lemming_upg_secondary = deep_clone(self.stances.lemming)
	
	self.stances.m37_primary = deep_clone(self.stances.m37)
	self.stances.m37_secondary = deep_clone(self.stances.m37)
	self.stances.m37_upg_primary = deep_clone(self.stances.m37)
	self.stances.m37_upg_secondary = deep_clone(self.stances.m37)
	
	self.stances.r870_primary = deep_clone(self.stances.r870)
	self.stances.r870_secondary = deep_clone(self.stances.r870)
	self.stances.r870_upg_primary = deep_clone(self.stances.r870)
	self.stances.r870_upg_secondary = deep_clone(self.stances.r870)
	
	self.stances.erma_primary = deep_clone(self.stances.erma)
	self.stances.erma_secondary = deep_clone(self.stances.erma)
	self.stances.erma_upg_primary = deep_clone(self.stances.erma)
	self.stances.erma_upg_secondary = deep_clone(self.stances.erma)
	
	self.stances.schakal_primary = deep_clone(self.stances.schakal)
	self.stances.schakal_secondary = deep_clone(self.stances.schakal)
	self.stances.schakal_upg_primary = deep_clone(self.stances.schakal)
	self.stances.schakal_upg_secondary = deep_clone(self.stances.schakal)
	
	self.stances.tec9_primary = deep_clone(self.stances.tec9)
	self.stances.tec9_secondary = deep_clone(self.stances.tec9)
	self.stances.tec9_upg_primary = deep_clone(self.stances.tec9)
	self.stances.tec9_upg_secondary = deep_clone(self.stances.tec9)

	self.stances.mosin_primary = deep_clone(self.stances.mosin)
	self.stances.mosin_secondary = deep_clone(self.stances.mosin)
	self.stances.mosin_upg_primary = deep_clone(self.stances.mosin)
	self.stances.mosin_upg_secondary = deep_clone(self.stances.mosin)

	self.stances.vulcan_upg = deep_clone(self.stances.shuno)

	self.stances.deamon_primary = deep_clone(self.stances.boot)
	self.stances.deamon_secondary = deep_clone(self.stances.boot)
	self.stances.deamon_upg_primary = deep_clone(self.stances.boot)
	self.stances.deamon_upg_primary.steelsight.shoulders.translation = Vector3(-9.335, -5, 3)
	self.stances.deamon_upg_secondary = deep_clone(self.stances.boot)
	self.stances.deamon_upg_secondary.steelsight.shoulders.translation = Vector3(-9.335, -5, 3)

	self.stances.elastic_primary = deep_clone(self.stances.elastic)
	self.stances.elastic_secondary = deep_clone(self.stances.elastic)
	self.stances.elastic_upg_primary = deep_clone(self.stances.elastic)
	self.stances.elastic_upg_primary.standard.shoulders.translation = Vector3(-5.696, -20.377, 10.841)
	self.stances.elastic_upg_primary.standard.shoulders.rotation = Rotation(0.00215024, -0.0345012, 0.00130212, -0.999402)
	self.stances.elastic_upg_primary.steelsight.shoulders.translation = Vector3(-5.603, -5.377, 10.807)
	self.stances.elastic_upg_primary.steelsight.shoulders.rotation = Rotation(0.000160639, 0.0440202, 0.00246083, -0.999028)
	self.stances.elastic_upg_secondary = deep_clone(self.stances.elastic_upg_primary)

	self.stances.g22c_primary = deep_clone(self.stances.glock_18c)
	self.stances.g22c_secondary = deep_clone(self.stances.glock_18c)
	self.stances.stryk_upg_primary = deep_clone(self.stances.glock_18c)
	self.stances.stryk_upg_secondary = deep_clone(self.stances.glock_18c)

	self.stances.g3_primary = deep_clone(self.stances.g3)
	self.stances.g3_secondary = deep_clone(self.stances.g3)
	self.stances.g3_upg_primary = deep_clone(self.stances.g3)
	self.stances.g3_upg_secondary = deep_clone(self.stances.g3)

	self.stances.tar21_primary = deep_clone(self.stances.komodo)
	self.stances.tar21_secondary = deep_clone(self.stances.komodo)
	self.stances.tar21_upg_primary = deep_clone(self.stances.komodo)
	self.stances.tar21_upg_secondary = deep_clone(self.stances.komodo)

	self.stances.akrocket_upg_primary = deep_clone(self.stances.akmsu)
	self.stances.akrocket_upg_secondary = deep_clone(self.stances.akmsu)

	self.stances.par_primary = deep_clone(self.stances.par)
	self.stances.par_secondary = deep_clone(self.stances.par)
	self.stances.par_upg_primary = deep_clone(self.stances.par)
	self.stances.par_upg_secondary = deep_clone(self.stances.par)

	self.stances.packrat_primary = deep_clone(self.stances.packrat)
	self.stances.packrat_secondary = deep_clone(self.stances.packrat)
	self.stances.packrat_upg_primary = deep_clone(self.stances.x_packrat)
	self.stances.packrat_upg_secondary = deep_clone(self.stances.x_packrat)

	self.stances.raygun_primary = deep_clone(self.stances.breech)
	self.stances.raygun_primary.standard.shoulders.translation = Vector3(1.784, -0.432, -4.207)
	self.stances.raygun_primary.steelsight.shoulders.translation = Vector3(-8.000, 0.668, -6.207)
	self.stances.raygun_primary.steelsight.shoulders.rotation = Rotation(-0.018108, -4.61179e-006, 0.00141215, -0.999835)
	self.stances.raygun_primary.crouched.shoulders.translation = Vector3(0.783923, -1.43154, -5.207)
	self.stances.raygun_secondary = deep_clone(self.stances.raygun_primary)
	self.stances.raygun_upg_primary = deep_clone(self.stances.raygun_primary)
	self.stances.raygun_upg_secondary = deep_clone(self.stances.raygun_primary)
end)
