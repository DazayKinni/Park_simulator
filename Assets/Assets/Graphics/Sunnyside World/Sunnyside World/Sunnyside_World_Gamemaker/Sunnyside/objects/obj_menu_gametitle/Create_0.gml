transform = new MenuTransform();
locKey = "game title";
scribbleElement = undefined;

x = DISPLAY.GetGuiMidX();
y = DISPLAY.GetGuiMidY();

UI_SetSidePanels(false);

var _inst = UICreate_PillButton( "splash begin", x, DISPLAY.GetGuiHeight()-203 )
with ( _inst )
{
	SetSound(sfx_ui_click);
	SetDelay(10)
	SetScript( Button_Begin )
	Apply();
}