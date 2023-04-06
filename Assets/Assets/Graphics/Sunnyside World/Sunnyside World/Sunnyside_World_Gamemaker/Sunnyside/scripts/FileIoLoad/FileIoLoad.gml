/// @param filename        Name of the file to save. Don't use spaces!
/// @param [callback]      Script to execute once the load operation has finished
/// @param [callbackData]  Data to pass into the callback

function FileIoLoad(_filename, _callback = undefined, _data = undefined)
{
	with(obj_fileio)
	{
	    var _array = array_create(FILE_IO.__SIZE, undefined);
	    _array[@ FILE_IO.TYPE         ] = "load";
	    _array[@ FILE_IO.BUFFER       ] = buffer_create(1024*1024, buffer_grow, 1);
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