/// @param device

function ResLibGetHeight(_device)
{
    with(global.__resLib[_device])
    {
        return __height*min(ResLibGetMaxWidth()/__width, ResLibGetMaxHeight()/__height);
    }
}