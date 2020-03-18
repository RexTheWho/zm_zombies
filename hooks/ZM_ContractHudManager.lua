Hooks:PostHook(ContractBrokerHeistItem, "init", "zm_init_contract_eeicon", function(self, parent_panel, job_data, idx)
    local job_tweak = tweak_data.narrative:job_data(self._job_data.job_id)

	--WIP EE GUI
    if job_tweak.contact == "zombies_modeA" then
        if self._image_panel then
		
			local ee_completed = Global.mission_manager.saved_job_values[key] == 1
			
            local xcenter = self._image_panel:w() / 2
			-- log(xcenter)
            local ycenter = self._image_panel:h() / 2
			-- log(ycenter)
			
			--EE Border
			
            local ee_goal_border = self._image_panel:panel({})
			local ee_goal_border = ee_goal_border:bitmap({
				texture = "units/pd2_mod_zombies/guis/crimenet/zm_ee_done",
				blend_mode = "add",
				alpha = 0.5,
				align = "center",
				layer = 1001,
				w = self._image_panel:w(),
				h = self._image_panel:h(),
				-- visible = ee_completed
				visible = true
			})
			self._image_panel:video({
				blend_mode = "add",
				alpha = 0.3,
				loop = true,
				layer = 1000,
				video = "units/pd2_mod_zombies/movies/cn_fog",
				width = self._image_panel:w(),
				height = self._image_panel:h(),
				color = Color(1, 1 ,1 ,1)
			})
        end
    end

end)