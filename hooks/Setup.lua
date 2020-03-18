
--Managers
dofile(ModPath .. "classes/WDUManager.lua")
dofile(ModPath .. "classes/WDUPowerUps.lua")
-- dofile(ModPath .. "classes/ZMMenuManager.lua")

--Elements
-- dofile(ModPath .. "classes/elements/elementannouncergift.lua")
-- dofile(ModPath .. "classes/elements/elementdynamicenvironment.lua")
-- dofile(ModPath .. "classes/elements/elementgunship.lua")
-- dofile(ModPath .. "classes/elements/elementplayend.lua")
-- dofile(ModPath .. "classes/elements/elementplayvideo.lua")
-- dofile(ModPath .. "classes/elements/elementpointchecker.lua")
-- dofile(ModPath .. "classes/elements/elementreviveinstigator.lua")
-- dofile(ModPath .. "classes/elements/elementsoracinematiccamera.lua")
-- dofile(ModPath .. "classes/elements/elementspawnsafeenemydummy.lua")
-- dofile(ModPath .. "classes/elements/elementwave.lua")
-- dofile(ModPath .. "classes/elements/elementweaponswitch.lua")



Hooks:PostHook(GameSetup, "init_managers", "zm_init_wdumanager", function(self, managers)
	managers.wdu = WDUManager:new()
	managers.wdu:preload_weapons()
	-- managers.wdu = ZMMenuManager:init()
end)