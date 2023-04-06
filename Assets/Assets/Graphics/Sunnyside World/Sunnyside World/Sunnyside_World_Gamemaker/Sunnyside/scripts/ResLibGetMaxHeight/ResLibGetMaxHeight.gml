function ResLibGetMaxHeight()
{
    if ((os_type == os_windows) || (os_type == os_macosx) || (os_type == os_linux))
    {
        return display_get_height() - RES_LIB_DISPLAY_MARGIN_HEIGHT;
    }
    else
    {
        return display_get_height();
    }
}