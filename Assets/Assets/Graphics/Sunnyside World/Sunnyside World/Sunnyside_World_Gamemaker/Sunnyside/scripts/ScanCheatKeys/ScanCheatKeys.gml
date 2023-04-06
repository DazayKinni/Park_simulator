function ScanCheatKeys()
{
    if (!DEV_CONFIG) return;
    
	var _check = keyboard_check(vk_control); //TODO - assign command key for Mac
	
    if (_check)
    {
        if (keyboard_check_pressed(ord("D"))) global.debugState = !global.debugState;
        
        if (keyboard_check_pressed(ord("0"))) DISPLAY.SetWindowParams(ResLibGetMaxWidth(), ResLibGetMaxHeight()).Apply();
        if (keyboard_check_pressed(ord("1"))) DISPLAY.SetWindowParams(ResLibGetWidth(RES_LIB.IPAD_PRO_6TH_GEN_12_INCH), ResLibGetHeight(RES_LIB.IPAD_PRO_6TH_GEN_12_INCH)).Apply();
        if (keyboard_check_pressed(ord("2"))) DISPLAY.SetWindowParams(ResLibGetWidth(RES_LIB.SAMSUNG_S22_ULTRA), ResLibGetHeight(RES_LIB.SAMSUNG_S22_ULTRA)).Apply();
        
        if (keyboard_check_pressed(vk_up  )) VAULT.Settings.Write(clamp(VAULT.Settings.Read(1, "music") + 0.1, 0, 1), "music");
        if (keyboard_check_pressed(vk_down)) VAULT.Settings.Write(clamp(VAULT.Settings.Read(1, "music") - 0.1, 0, 1), "music");
    }
	
	 if (keyboard_check_pressed(ord("R"))) room_goto(room);
	 if (keyboard_check_pressed(vk_escape)) if ( os_type == os_macosx or os_type == os_windows ) 
	 {
		 if ( room == rm_menu ) game_end();
		 else 
		 {
			 global.nextRoom = rm_menu;
			 Menu_SetPage( MENUPAGE.GOTO );
		 }
	 }
}