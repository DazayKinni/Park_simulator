function ResLibGetMaxWidth()
{
    if ((os_type == os_windows) || (os_type == os_macosx) || (os_type == os_linux))
    {
        return display_get_width() - RES_LIB_DISPLAY_MARGIN_WIDTH;
    }
    else
    {
        return display_get_width();
    }
}