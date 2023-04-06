/// Processes the file operation queue, one thing at a time...
function FileIoStep() {

	with(obj_fileio)
	{
	    while(true)
	    {
	        var _time = operation_history[| 0];
	        if ((_time != undefined) && (current_time - _time > 60000))
	        {
	            ds_list_delete(operation_history, 0);
	        }
	        else
	        {
	            break;
	        }
	    }
    
	    if (!ds_list_empty(queue) && !is_array(current_operation))
	    {
	        if ((ds_list_size(operation_history) < rate_limit) && (current_time - disk_access_time > time_between_ops))
	        {
	            current_operation = queue[| 0];
	            ds_list_delete(queue, 0);
            
	            var _type       = current_operation[FILE_IO.TYPE      ];
	            var _filename   = current_operation[FILE_IO.FILENAME  ];
	            var _buffer     = current_operation[FILE_IO.BUFFER    ];
	            var _group_name = current_operation[FILE_IO.GROUP_NAME];
	            var _slot_title = current_operation[FILE_IO.SLOT_TITLE];
            
	            switch(_type)
	            {
	                //If this job is a save job...
	                case "save":
	                    buffer_async_group_begin(_group_name);
	                    buffer_async_group_option("slottitle" , _slot_title  );
	                    buffer_async_group_option("subtitle"  , slot_subtitle);
	                    buffer_async_group_option("showdialog", false        );
	                    buffer_save_async(_buffer, _filename, 0, buffer_get_size(_buffer));
	                    current_async_id = buffer_async_group_end();
                    
	                    ds_list_add(operation_history, current_time);
	                break;
                
	                //If this job is a load job...
	                case "load":
	                    buffer_async_group_begin(_group_name);
	                    buffer_async_group_option("slottitle" , _slot_title  );
	                    buffer_async_group_option("subtitle"  , slot_subtitle);
	                    buffer_async_group_option("showdialog", false        );
	                    buffer_load_async(_buffer, _filename, 0, -1);
	                    current_async_id = buffer_async_group_end();
                    
	                    ds_list_add(operation_history, current_time);
	                break;
	            }
	        }
	    }
	}


}
