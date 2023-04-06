event_inherited();

locKey = "splash begin";

//typist = TypistDropIn();	//.draw(0, 0, typist);
//.template(TemplateShadow)

HitflashAttachToSelf(c_red);

scribbleElement = undefined;
targetRoom = undefined;
	
pillCol = c_white;
textCol = c_white;
	
padding = 30;
boxH = 99;
boxW = 440;

boxMaxW = 500;
boxMaxH = 200;

fixedWidth = false;

textAlign = fa_center;
textX = 0;
		
x1 = x - (boxW/2);
x2 = x1 + boxH;
y1 = y - (boxH/2);
y2 = y1 + boxH;

SetCoords();

myString = "[spr_ui_crop_wood][c_black] " + string(global.currency.wood) + " [c_white][spr_ui_crop_rocks][c_black] " + string(global.currency.rocks) + " [c_white][spr_ui_crop_berries][c_black] " + string(global.currency.berries) + " " ;

function SetCurrencyPrev()
{
	cropWoodPrev = global.currency.wood;
	cropRocksPrev = global.currency.rocks;
	cropBerriesPrev = global.currency.berries;
}
SetCurrencyPrev();

function BankRefresh()
{
	transform.Repeat();
	myString = "[spr_ui_crop_wood][c_black] " + string(global.currency.wood) + " [c_white][spr_ui_crop_rocks][c_black] " + string(global.currency.rocks) + " [c_white][spr_ui_crop_berries][c_black] " + string(global.currency.berries) + " " ;
	SetCurrencyPrev();
}