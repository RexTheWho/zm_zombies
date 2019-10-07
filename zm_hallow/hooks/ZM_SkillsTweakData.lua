

Hooks:PostHook(SkillTreeTweakData, "init", "init_zm_skills", function(self)
	log("// ZOMBIES MODE SKILLS //")

	self.skills.juggernaut = {
		name_id = "menu_juggernaut_beta",
		desc_id = "menu_juggernaut_beta_desc",
		icon_xy = {
			3,
			1
		}
	}
end)
