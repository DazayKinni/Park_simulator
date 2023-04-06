/// Returns whether the file handler has finished storing data
function FileIoQueueSize() {

	with(obj_fileio)
	{
	    return ds_list_size(queue) + is_array(current_operation);
	}

	return 0;


}
