/// @return Nested struct/array data that represents the contents of the JSON string
/// 
/// @param buffer  Buffer to read data from
/// @param offset  Offset in the buffer to read data from
/// 
/// @jujuadams 2022-12-11

function __VinylBufferReadLooseJSON(_buffer, _inOffset = undefined)
{
    if (_inOffset != undefined)
    {
        var _oldOffset = buffer_tell(_buffer);
        buffer_seek(_buffer, buffer_seek_start, _inOffset);
    }
    
    var _bufferSize = buffer_get_size(_buffer);
    
    var _result = undefined;
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        
        if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("/")))
        {
            __VinylBufferReadLooseJSONComment(_buffer, _bufferSize);
        }
        else if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
        {
            __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
        }
        else if (_byte == ord("["))
        {
            _result = __VinylBufferReadLooseJSONArray(_buffer, _bufferSize);
        }
        else if (_byte == ord("{"))
        {
            _result = __VinylBufferReadLooseJSONStruct(_buffer, _bufferSize);
        }
        else if (_byte > 0x20)
        {
            show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting either { or [\n ", true);
        }
    }
    
    if (_inOffset != undefined)
    {
        buffer_seek(_buffer, buffer_seek_start, _oldOffset);
    }
    
    return _result;
}

function __VinylBufferReadLooseJSONArray(_buffer, _bufferSize)
{
    var _result = [];
    
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        
        if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("/")))
        {
            __VinylBufferReadLooseJSONComment(_buffer, _bufferSize);
        }
        else if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
        {
            __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
        }
        else if (_byte == ord("]"))
        {
            return _result;
        }
        else if ((_byte == ord(":")) || (_byte == ord(",")))
        {
            show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a value\n ", true);
        }
        else if (_byte > 0x20)
        {
            var _value = __VinylBufferReadLooseJSONValue(_buffer, _bufferSize, _byte);
            array_push(_result, _value);
            
            //Find a comma, newline, or closing bracket
            while(buffer_tell(_buffer) < _bufferSize)
            {
                var _byte = buffer_read(_buffer, buffer_u8);
                if (_byte == ord("]"))
                {
                    return _result;
                }
                else if ((_byte == ord(",")) || (_byte == ord("\n")) || (_byte == ord("\r")))
                {
                    break;
                }
                else if (_byte > 0x20)
                {
                    show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
                }
            }
        }
    }
    
    show_error("Found unterminated array\n ", true);
}

function __VinylBufferReadLooseJSONStruct(_buffer, _bufferSize)
{
    var _result = {};
    
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        
        if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("/")))
        {
            __VinylBufferReadLooseJSONComment(_buffer, _bufferSize);
        }
        else if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
        {
            __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
        }
        else if (_byte == ord("}"))
        {
            return _result;
        }
        else if ((_byte == ord(":")) || (_byte == ord(",")))
        {
            show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a key\n ", true);
        }
        else if (_byte > 0x20)
        {
            var _key = __VinylBufferReadLooseJSONValue(_buffer, _bufferSize, _byte);
            
            if (!is_string(_key)) show_error("Struct keys must be strings (key was " + string(_key) + ", typeof=" + typeof(_key) + ")\n ", true);
            
            //Find a colon
            while(buffer_tell(_buffer) < _bufferSize)
            {
                var _byte = buffer_read(_buffer, buffer_u8);
                
                if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
                {
                    __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
                }
                else if (_byte == ord(":"))
                {
                    break;
                }
                else if (_byte > 0x20)
                {
                    show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a colon\n ", true);
                }
            }
            
            //Find the start of a value
            var _byte = 0x00;
            while(buffer_tell(_buffer) < _bufferSize)
            {
                var _byte = buffer_read(_buffer, buffer_u8);
                
                if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
                {
                    __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
                }
                else if (_byte > 0x20)
                {
                    break;
                }
            }
            if (_byte <= 0x20) show_error("Could not find start of value for key \"" + _key + "\"\n ", true);
            
            //Read a value and store it in the struct
            var _value = __VinylBufferReadLooseJSONValue(_buffer, _bufferSize, _byte);
            _result[$ _key] = _value;
            
            //Find a comma, newline, or closing bracket
            while(buffer_tell(_buffer) < _bufferSize)
            {
                var _byte = buffer_read(_buffer, buffer_u8);
                
                if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
                {
                    __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
                }
                else if (_byte == ord("}"))
                {
                    return _result;
                }
                else if ((_byte == ord(",")) || (_byte == ord("\n")) || (_byte == ord("\r")))
                {
                    break;
                }
                else if (_byte > 0x20)
                {
                    show_error("Found unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
                }
            }
        }
    }
    
    show_error("Found unterminated struct\n ", true);
}

function __VinylBufferReadLooseJSONValue(_buffer, _bufferSize, _firstByte)
{
    if (_firstByte == ord("["))
    {
        return __VinylBufferReadLooseJSONArray(_buffer, _bufferSize);
    }
    else if (_firstByte == ord("{"))
    {
        return __VinylBufferReadLooseJSONStruct(_buffer, _bufferSize);
    }
    else if (_firstByte == ord("\""))
    {
        return __VinylBufferReadLooseJSONDelimitedString(_buffer, _bufferSize);
    }
    else
    {
        return __VinylBufferReadLooseJSONString(_buffer, _bufferSize);
    }
}

function __VinylBufferReadLooseJSONDelimitedString(_buffer, _bufferSize)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    
    var _start = buffer_tell(_buffer);
    var _stringUsesCache = false;
    
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        
        if (_byte == ord("\""))
        {
            if (_stringUsesCache)
            {
                var _size = buffer_tell(_buffer) - _start-1;
                if (_size > 0)
                {
                    buffer_copy(_buffer, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                    buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                }
                
                buffer_write(_cacheBuffer, buffer_u8, 0x00);
                buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                var _result = buffer_read(_cacheBuffer, buffer_string);
            }
            else
            {
                var _end = buffer_tell(_buffer)-1;
                var _oldByte = buffer_peek(_buffer, _end, buffer_u8);
                buffer_poke(_buffer, _end, buffer_u8, 0x00);
                var _result = buffer_peek(_buffer, _start, buffer_string);
                buffer_poke(_buffer, _end, buffer_u8, _oldByte);
            }
            
            return _result;
        }
        else if (_byte == ord("\\"))
        {
            _stringUsesCache = true;
            
            var _size = buffer_tell(_buffer) - _start-1;
            if (_size > 0)
            {
                buffer_copy(_buffer, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
            }
            
            var _byte = buffer_read(_buffer, buffer_u8);
            switch(_byte)
            {
                case ord("n"): buffer_write(_cacheBuffer, buffer_u8, ord("\n")); break;
                case ord("r"): buffer_write(_cacheBuffer, buffer_u8, ord("\r")); break;
                case ord("t"): buffer_write(_cacheBuffer, buffer_u8, ord("\t")); break;
                
                case ord("u"):
                    var _oldByte = buffer_peek(_buffer, buffer_tell(_buffer)+4, buffer_u8);
                    buffer_poke(_buffer, buffer_tell(_buffer)+4, buffer_u8, 0x00);
                    var _hex = buffer_read(_buffer, buffer_string);
                    buffer_seek(_buffer, buffer_seek_relative, -1);
                    buffer_poke(_buffer, buffer_tell(_buffer), buffer_u8, _oldByte);
                    
                    var _value = int64(ptr(_hex));
                    if (_value <= 0x7F) //0xxxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _value);
                    }
                    else if (_value <= 0x07FF) //110xxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ((_value >> 6) & 0x1F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ( _value       & 0x3F));
                    }
                    else if (_value <= 0xFFFF) //1110xxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ( _value        & 0x0F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  4) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >> 10) & 0x3F));
                    }
                    else if (_value <= 0x10000) //11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ( _value        & 0x07));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  3) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  9) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >> 15) & 0x3F));
                    }
                break;
                
                default:
                    if ((_byte & $E0) == $C0) //110xxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 1, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 1);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 1);
                    }
                    else if ((_byte & $F0) == $E0) //1110xxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 2, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 2);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 2);
                    }
                    else if ((_byte & $F8) == $F0) //11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 3, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 3);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 3);
                    }
                    else
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _byte);
                    }
                break;
            }
            
            _start = buffer_tell(_buffer);
        }
    }
    
    show_error("Found unterminated string\n ", true);
}

function __VinylBufferReadLooseJSONString(_buffer, _bufferSize)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    
    var _result = undefined;
    
    var _start = buffer_tell(_buffer)-1;
    var _end   = _start+1;
    
    var _stringUsesCache = false;
    
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        
        if ((_byte == ord(":"))
         || (_byte == ord(","))
         || (_byte == ord("}"))
         || (_byte == ord("]"))
         || (_byte == ord("\n"))
         || (_byte == ord("\r"))
         || ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*"))))
        {
            if (_stringUsesCache)
            {
                var _size = _end - _start;
                if (_size > 0)
                {
                    buffer_copy(_buffer, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                    buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                }
                
                buffer_write(_cacheBuffer, buffer_u8, 0x00);
                buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                var _result = buffer_read(_cacheBuffer, buffer_string);
            }
            else
            {
                var _oldByte = buffer_peek(_buffer, _end, buffer_u8);
                buffer_poke(_buffer, _end, buffer_u8, 0x00);
                var _result = buffer_peek(_buffer, _start, buffer_string);
                buffer_poke(_buffer, _end, buffer_u8, _oldByte);
                
                if (_result == "true")
                {
                    _result = true;
                }
                else if (_result == "false")
                {
                    _result = false;
                }
                else if (_result == "null")
                {
                    _result = undefined;
                }
                else
                {
                    try
                    {
                        _result = real(_result);
                    }
                    catch(_error)
                    {
                        //Not a number apparently
                    }
                }
            }
            
            buffer_seek(_buffer, buffer_seek_relative, -1);
            
            if ((_byte == ord("/")) && (buffer_peek(_buffer, buffer_tell(_buffer), buffer_u8) == ord("*")))
            {
                __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize);
            }
            
            return _result;
        }
        else if (_byte == ord("\\"))
        {
            _stringUsesCache = true;
            
            var _size = buffer_tell(_buffer) - _start-1;
            if (_size > 0)
            {
                buffer_copy(_buffer, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
            }
            
            var _byte = buffer_read(_buffer, buffer_u8);
            switch(_byte)
            {
                case ord("n"): buffer_write(_cacheBuffer, buffer_u8, ord("\n")); break;
                case ord("r"): buffer_write(_cacheBuffer, buffer_u8, ord("\r")); break;
                case ord("t"): buffer_write(_cacheBuffer, buffer_u8, ord("\t")); break;
                
                case ord("u"):
                    var _oldByte = buffer_peek(_buffer, buffer_tell(_buffer)+4, buffer_u8);
                    buffer_poke(_buffer, buffer_tell(_buffer)+4, buffer_u8, 0x00);
                    var _hex = buffer_read(_buffer, buffer_string);
                    buffer_seek(_buffer, buffer_seek_relative, -1);
                    buffer_poke(_buffer, buffer_tell(_buffer), buffer_u8, _oldByte);
                    
                    var _value = int64(ptr(_hex));
                    if (_value <= 0x7F) //0xxxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _value);
                    }
                    else if (_value <= 0x07FF) //110xxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ((_value >> 6) & 0x1F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ( _value       & 0x3F));
                    }
                    else if (_value <= 0xFFFF) //1110xxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ( _value        & 0x0F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  4) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >> 10) & 0x3F));
                    }
                    else if (_value <= 0x10000) //11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 0xC0 | ( _value        & 0x07));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  3) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >>  9) & 0x3F));
                        buffer_write(_cacheBuffer, buffer_u8, 0x80 | ((_value >> 15) & 0x3F));
                    }
                break;
                
                default:
                    if ((_byte & $E0) == $C0) //110xxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 1, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 1);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 1);
                    }
                    else if ((_byte & $F0) == $E0) //1110xxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 2, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 2);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 2);
                    }
                    else if ((_byte & $F8) == $F0) //11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    {
                        buffer_copy(_buffer, buffer_tell(_buffer)+1, 3, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_buffer, buffer_seek_relative, 3);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 3);
                    }
                    else
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _byte);
                    }
                break;
            }
            
            _start = buffer_tell(_buffer);
        }
        else if (_byte > 0x20)
        {
            _end = buffer_tell(_buffer);
        }
    }
    
    show_error("Found unterminated value\n ", true);
}

function __VinylBufferReadLooseJSONComment(_buffer, _bufferSize)
{
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        if ((_byte == ord("\n")) || (_byte == ord("\r")))
        {
            buffer_seek(_buffer, buffer_seek_relative, -1);
            break;
        }
    }
}

function __VinylBufferReadLooseJSONMultilineComment(_buffer, _bufferSize)
{
    while(buffer_tell(_buffer) < _bufferSize)
    {
        var _byte = buffer_read(_buffer, buffer_u8);
        if (_byte == ord("*"))
        {
            _byte = buffer_read(_buffer, buffer_u8);
            if (_byte == ord("/")) break;
        }
    }
}