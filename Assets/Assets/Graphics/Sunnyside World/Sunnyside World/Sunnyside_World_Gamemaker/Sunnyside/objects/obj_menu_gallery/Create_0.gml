x = DISPLAY.GetGuiMidX();
y = DISPLAY.GetGuiMidY();

UI_SetSidePanels(false);

#macro NAV_TOP_Y 160
#macro NAV_ARROW_X 100

var _close = UICreate_SpriteButton(NAV_ARROW_X,NAV_TOP_Y,spr_icon_close_floating);
with _close
{
	SetSound(sfx_ui_click_back);
	SetScript(Menu_PageBack)
	SetDelay(0)
}

var _left = UICreate_SpriteButton(NAV_ARROW_X,DISPLAY.GetGuiMidY(),spr_icon_navigate_floating);
with _left
{
	SetSound(sfx_ui_click);
	SetScript(Button_GalleryChangeSlide)	
	SetDelay(4)
	image_xscale = -1;
}

var _right = UICreate_SpriteButton(DISPLAY.GetGuiWidth()-NAV_ARROW_X,DISPLAY.GetGuiMidY(),spr_icon_navigate_floating);
with _right
{
	SetSound(sfx_ui_click);
	SetScript(Button_GalleryChangeSlide)
	SetDelay(4)
}

MENUOBJ.showGallerySlide(false);
var _index = MENUOBJ.galleryIndex;

sprite_index = MENUOBJ.gallery[_index].index;
scaleFrom = MENUOBJ.gallery[_index].scale;
scaleTo = scaleFrom*1.05

timer = 0
timerMax = 300;