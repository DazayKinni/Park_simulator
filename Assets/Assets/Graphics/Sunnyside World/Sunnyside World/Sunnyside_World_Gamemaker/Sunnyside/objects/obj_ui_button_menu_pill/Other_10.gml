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