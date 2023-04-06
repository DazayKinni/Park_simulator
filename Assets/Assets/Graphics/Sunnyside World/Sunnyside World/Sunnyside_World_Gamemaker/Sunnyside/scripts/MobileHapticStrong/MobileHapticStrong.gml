function MobileHapticStrong()
{
	if ( VaultRead(SAVEDATA_INPUTS_HAPTICS, true) == false ) return;
	
    if (os_type == os_ios)
    {
        iOSVibrateStrong();
    }
    else if (os_type == os_android)
    {
        AndroidVibrateStrong();
    }
}