///@desc METHODS

event_inherited();

SetWidthFixed = function(_width,_padding = 0)
{
	fixedWidth = true;
	boxW = _width + _padding
	SetCoords();
}

ScreenAlign = function(_textAlign,_offset,_padding)
{
	textAlign = _textAlign;
	var _boxOffset = boxW/2;
	
	switch ( textAlign )
	{
		case fa_left :
			textX = -_boxOffset + _padding + _offset;
			x = _boxOffset - _offset;
		break;
		
		case fa_right :
			textX = _boxOffset - _padding - _offset;
			x = DISPLAY.GetGuiWidth() - _boxOffset + _offset;
		break;
		
		default :
			textX = 0;
			x = DISPLAY.GetGuiMidX();
		break;
	}
	SetCoords();
}

Apply = function()
{
	scribbleElement = scribble(Lyre(locKey))
    .blend(textCol)
    .scale(2)
    .align(textAlign,fa_middle)
	.fit_to_box(boxMaxW,boxMaxH);
	
	boxH = scribbleElement.get_bbox().height + padding;
	if !fixedWidth
	{
		boxW = scribbleElement.get_bbox().width + (boxH/2) + padding;
	}
	
	SetCoords();
}

SetBlend = function(_pillcol,_textcol)
{
	pillCol = _pillcol;
	textCol = _textcol;	
}

SetRoomGoto = function(_room)
{
	targetRoom = _room;
	scriptOnPress = Button_ChooseLevel;
	
}

SetState = function(_state,_scriptOnPress = undefined)
{
	myState = _state;
	scriptOnPress = _scriptOnPress
}

SetSlider = function(_factor,_increment=0.1)
{
	myState = SETTINGSBUTTON.SLIDER;
	fillFactor = _factor;
	remainingWidth = boxW-boxH;
	fillWidth = remainingWidth*fillFactor;
	sliderInc = _increment;
	
	var _delay = transform.delayMax;
	
	var _sub = UICreate_SpriteButton(x-274,y,spr_button_directional_arrow);
	with _sub
	{
		image_xscale = -1;
		parent = other;
		SetScript(Button_IncrementSlider)
		SetDelay(_delay)
	}
	
	var _add = UICreate_SpriteButton(x+274,y,spr_button_directional_arrow);
	with _add
	{
		parent = other;
		SetScript(Button_IncrementSlider)
		SetDelay(_delay)
	}
}