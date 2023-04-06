function MobileHapticTriple()
{
	if ( VaultRead(SAVEDATA_INPUTS_HAPTICS, true) == false ) return;
	
    if (os_type == os_ios)
    {
        iOSVibrateTriple();
    }
    else if (os_type == os_android)
    {
        AndroidVibrateTriple();
    }
}