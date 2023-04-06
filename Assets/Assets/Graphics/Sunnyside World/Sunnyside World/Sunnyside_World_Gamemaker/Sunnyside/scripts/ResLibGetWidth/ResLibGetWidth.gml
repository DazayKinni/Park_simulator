/// @param device

function ResLibGetWidth(_device)
{
    with(global.__resLib[_device])
    {
        return __width*min(ResLibGetMaxWidth()/__width, ResLibGetMaxHeight()/__height);
    }
}