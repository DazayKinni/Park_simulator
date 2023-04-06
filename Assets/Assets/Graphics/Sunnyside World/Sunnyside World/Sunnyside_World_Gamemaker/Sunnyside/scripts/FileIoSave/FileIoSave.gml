/// @param buffer          Buffer to be saved. **N.B. Do not destroy this buffer after calling FileIoSave()! The file handler will manage the memory for you!**
/// @param filename        Name of the file to save. Don't use spaces!
/// @param [callback]      Script to execute once the save operation has finished
/// @param [callbackData]  Data to pass into the callback

function FileIoSave(_buffer, _filename, _callback = undefined, _data = undefined)
{
	with(obj_fileio)
	{
	    disk_access_time = current_time;
        
	    var _array = array_create(FILE_IO.__SIZE, undefined);
	    _array[@ FILE_IO.TYPE         ] = "save";
	    _array[@ FILE_IO.BUFFER       ] = _buffer;
	    _array[@ FILE_IO.FILENAME     ] = _filename;
	    _array[@ FILE_IO.CALLBACK     ] = _callback;
	    _array[@ FILE_IO.CALLBACK_DATA] = _data;
	    _array[@ FILE_IO.GROUP_NAME   ] = group_name;
	    _array[@ FILE_IO.SLOT_TITLE   ] = slot_title;
        
	    ds_list_add(queue, _array);
        
	    return _array;
	}
    
	return undefined;
}