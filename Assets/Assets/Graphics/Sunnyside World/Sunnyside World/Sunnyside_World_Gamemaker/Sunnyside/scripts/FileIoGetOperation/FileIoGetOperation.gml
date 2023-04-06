/// @param index
function FileIoGetOperation(argument0) {

	with(obj_fileio)
	{
	    return queue[| argument0];
	}

	return undefined;


}
