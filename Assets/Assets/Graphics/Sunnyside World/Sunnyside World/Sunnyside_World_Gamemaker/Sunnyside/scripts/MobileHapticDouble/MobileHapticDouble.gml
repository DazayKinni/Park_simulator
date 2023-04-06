function MobileHapticDouble()
{
	if ( VaultRead(SAVEDATA_INPUTS_HAPTICS, true) == false ) return;
	
    if (os_type == os_ios)
    {
        iOSVibrateDouble();
    }
    else if (os_type == os_android)
    {
        AndroidVibrateDouble();
    }
}