/// Saves a Vault to disk using its defined destination and format metadata
/// This operation is asynchronous
/// 
/// @param vaultName
/// @param [callback]
/// @param [callbackData]

function SavedataSave(_vaultName, _callback = undefined, _callbackData = undefined)
{
    var _vault    = is_struct(_vaultName)? _vaultName : VaultGetStruct(_vaultName);
    var _metadata = _vault.GetMetadata();
    var _data     = _vault.GetData();
    
    //Don't need to clean up this buffer because the FileIo system handles that for us
    var _buffer = buffer_create(1024, buffer_grow, 1);
    
    switch(_metadata.format)
    {
        case SAVEDATA_FORMAT.BINARY:
            buffer_write(_buffer, buffer_u8, 0x01);
            SnapBufferWriteBinary(_buffer, _data);
        break;
        
        case SAVEDATA_FORMAT.JSON:
            buffer_write(_buffer, buffer_text, json_stringify(_data));
        break;
        
        case SAVEDATA_FORMAT.PRETTY:
            SnapBufferWriteJSON(_buffer, _data, true, true);
        break;
    }
    
    buffer_resize(_buffer, buffer_tell(_buffer));
    FileIoSave(_buffer, _metadata.destination, _callback, _callbackData);
}