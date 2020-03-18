Hooks:PostHook(SkillTreeTweakData, "init", "init_zm_skills", function(self)
	log("// ZOMBIES MODE SKILLS //")

	self.skills.iron_man[1].upgrades = {"player_weapon_accuracy_increase_1"}
	self.skills.iron_man[2].upgrades = {"player_weapon_accuracy_increase_1"}
	
end)
