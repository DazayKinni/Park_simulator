/// Loads a Vault from disk using its defined destination
/// This operation is asynchronous
/// 
/// @param vaultName
/// @param [callback]
/// @param [callbackData]

function SavedataLoad(_vaultName, _callback = undefined, _callbackData = undefined)
{
    var _vault = is_struct(_vaultName)? _vaultName : VaultGetStruct(_vaultName);
    
    FileIoLoad(_vault.GetMetadata().destination, function(_result, _callbackData, _buffer)
    {
        var _vault = _callbackData.__vault;
        
        if (_result == FILE_IO_RESULT.SUCCESS)
        {
            //If the lead byte is a 0x01 byte then treat this as a binary buffer
            if (buffer_read(_buffer, buffer_u8) == 0x01)
            {
                try
                {
                    var _data = SnapBufferReadBinary(_buffer, buffer_tell(_buffer));
                    _vault.SetData(_data).SetChanged(false);
                }
                catch(_error)
                {
                    Trace("Encountered error during parsing: ", _error);
                    _result = FILE_IO_RESULT.ERROR;
                }
            }
            else
            {
                buffer_seek(_buffer, buffer_seek_relative, -1);
                
                try
                {
                    var _string = buffer_read(_buffer, buffer_text);
                    var _data = json_parse(_string);
                    _vault.SetData(_data).SetChanged(false);
                }
                catch(_error)
                {
                    Trace("Encountered error during parsing: ", _error);
                    _result = FILE_IO_RESULT.ERROR;
                }
            }
        }
        
        with(_callbackData)
        {
            if (is_method(__callback))
            {
                __callback(_result, __data);
            }
            else if (is_numeric(__callback))
            {
                script_execute(__callback, _result, __data);
            }
        }
    },
    {
        __vault:    _vault,
        __callback: _callback,
        __data:     _callbackData,
    });
}