UI_SetSidePanels(false);
Game_SetPaused(false);

enum UI_GAME { PAUSE, BUILD, BANK }

uiButton = [];

var _animDelay = 2;

uiButton[UI_GAME.PAUSE] = UICreate_SpriteButton( NAV_ARROW_X, 135, spr_icon_ui_pause );
with uiButton[UI_GAME.PAUSE]
{
	SetSound(sfx_ui_click_confirm);
	SetScript(Button_Pause)
	SetDelay(_animDelay);
}
_animDelay += 4;

uiButton[UI_GAME.BUILD] = UICreate_SpriteButton( DISPLAY.GetGuiWidth()-98, 135, spr_ui_button_hammer );
with uiButton[UI_GAME.BUILD]
{
	SetSound(sfx_ui_click_confirm);
	SetDelay(_animDelay);
}
_animDelay += 4;

uiButton[UI_GAME.BANK] = instance_create_depth( DISPLAY.GetGuiWidth()-398, 135, 0, obj_ui_bank );
with uiButton[UI_GAME.BUILD]
{
	SetDelay(_animDelay);
}