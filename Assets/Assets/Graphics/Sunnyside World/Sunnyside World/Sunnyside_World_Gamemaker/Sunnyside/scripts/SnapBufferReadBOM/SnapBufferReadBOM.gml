/// Attempts to read a UTF-8 byte order mark from a buffer, and returns <true> if a BOM is found
/// This function checks for two kinds of byte-order mark:
/// - 0xEFBBBF
/// - 0xFEFF
/// 
/// @param buffer  Buffer to try to read the byte order mark from
/// 
/// @jujuadams 2023-01-20

function SnapBufferReadBOM(_buffer)
{
    var _tell = buffer_tell(_buffer);
    
	if ((buffer_get_size(_buffer) >= 3)
    &&  (buffer_peek(_buffer, _tell,   buffer_u8) == 0xEF)
    &&  (buffer_peek(_buffer, _tell+1, buffer_u8) == 0xBB)
    &&  (buffer_peek(_buffer, _tell+2, buffer_u8) == 0xBF))
    {
		buffer_seek(_buffer, buffer_seek_relative, 3);
        return true;
	}
    
    return false;
}