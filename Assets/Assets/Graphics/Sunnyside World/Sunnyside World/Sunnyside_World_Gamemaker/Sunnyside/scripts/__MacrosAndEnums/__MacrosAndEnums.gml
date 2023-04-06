#macro SHIP_CONFIG  false
#macro DEV_CONFIG   true

#macro Ship:SHIP_CONFIG  true
#macro Ship:DEV_CONFIG   false

#macro DEBUG_MODE  (DEV_CONFIG && global.debugState)
#macro GAME_PAUSED ( global.gamePaused == true )