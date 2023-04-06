
function GridHighlightCreate(_x,_y,_timer=250)
{
	var _inst = instance_create_depth( _x, _y, DEPTH_SORT_MIN_DEPTH+1,obj_grid_highlight )
	_inst.timer = _timer;
	return _inst;
}

function DrawGridHighlight(_xoff=0,_yoff=0,_colour=c_white,_alpha=.5,_scale=1/3)
{
	if selected
	{
		draw_sprite_ext(spr_cursor_tile_picker_corners,0,bbox_left-_xoff,bbox_top-_yoff,_scale,_scale,0,c_white,_alpha);
		draw_sprite_ext(spr_cursor_tile_picker_corners,1,bbox_left-_xoff,bbox_bottom+_yoff,_scale,_scale,0,c_white,_alpha);
		draw_sprite_ext(spr_cursor_tile_picker_corners,2,bbox_right+_xoff,bbox_top-_yoff,_scale,_scale,0,c_white,_alpha);
		draw_sprite_ext(spr_cursor_tile_picker_corners,3,bbox_right+_xoff,bbox_bottom+_yoff,_scale,_scale,0,c_white,_alpha);
	}
}