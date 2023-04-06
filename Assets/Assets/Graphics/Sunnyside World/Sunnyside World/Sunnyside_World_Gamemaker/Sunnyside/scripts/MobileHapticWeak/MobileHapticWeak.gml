function MobileHapticWeak()
{
	if ( VaultRead(SAVEDATA_INPUTS_HAPTICS, true) == false ) return;
	
    if (os_type == os_ios)
    {
        iOSVibrateWeak();
    }
    else if (os_type == os_android)
    {
        AndroidVibrateWeak();
    }
}