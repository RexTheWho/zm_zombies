Hooks:PreHook(IngameWaitingForPlayersState, "sync_start", "zm_stop_intro_music", function(self)
    managers.wdu:_destroy_source("pregame_music")
end)