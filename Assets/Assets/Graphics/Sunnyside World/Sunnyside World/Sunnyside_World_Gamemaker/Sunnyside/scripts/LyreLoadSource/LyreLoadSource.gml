/// @param path

function LyreLoadSource(_path)
{
    __LyreTrace("Loading \"", _path, "\" as the source CSV");
    
    var _buffer = buffer_load(_path);
    LyreLoadSourceFromBuffer(_buffer);
    buffer_delete(_buffer);
}