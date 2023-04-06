function FileIoAsyncEvent() {
	with(obj_fileio)
	{
	    if (is_array(current_operation))
	    {
	        var _error  = async_load[? "error" ];
	        var _id     = async_load[? "id"    ];
	        var _status = async_load[? "status"];
        
	        var _type     = current_operation[FILE_IO.TYPE         ];
	        var _buffer   = current_operation[FILE_IO.BUFFER       ];
	        var _callback = current_operation[FILE_IO.CALLBACK     ];
	        var _data     = current_operation[FILE_IO.CALLBACK_DATA];
	        var _filename = current_operation[FILE_IO.FILENAME     ];
        
	        if (_id == current_async_id)
	        {
	            //This async event is for us!
            
	            switch(_type)
	            {
	                case "save":
            	        if ((_error != 0) || !_status)
            	        {
            	            Trace("FileIO: Error! OS failed to save \"", _filename, "\"");
                            
                            if (is_method(_callback))
                            {
                                _callback(FILE_IO_RESULT.ERROR, _data);
                            }
                            else if (is_numeric(_callback))
                            {
            	                script_execute(_callback, FILE_IO_RESULT.ERROR, _data);
                            }
            	        }
                        else
                        {
    	                    if (os_type == os_switch) switch_save_data_commit();
    	                    Trace("FileIO: Save of \"", _filename, "\" completed successfully");
                            
                            if (is_method(_callback))
                            {
                                _callback(FILE_IO_RESULT.SUCCESS, _data);
                            }
                            else if (is_numeric(_callback))
                            {
            	                script_execute(_callback, FILE_IO_RESULT.SUCCESS, _data);
                            }
                        }
	                break;
                    
	                case "load":
            	        if ((_error != 0) || !_status)
            	        {
            	            Trace("FileIO: Error! OS failed to load \"", _filename, "\" (perhaps the file doesn't exist?)");
                            
                            if (is_method(_callback))
                            {
                                _callback(FILE_IO_RESULT.ERROR, _data, _buffer);
                            }
                            else if (is_numeric(_callback))
                            {
            	                script_execute(_callback, FILE_IO_RESULT.ERROR, _data, _buffer);
                            }
            	        }
                        else
                        {
    	                    var _any_data = false;
    	                    var _i = 0;
    	                    repeat(min(buffer_get_size(_buffer), 100))
    	                    {
    	                        if (buffer_peek(_buffer, _i, buffer_u8) > 0)
    	                        {
    	                            _any_data = true;
    	                            break;
    	                        }
                                
    	                        ++_i;
    	                    }
                        
    	                    if (_any_data)
    	                    {
    	                        Trace("FileIO: Load of \"", _filename, "\" completed successfully");
                                
                                if (is_method(_callback))
                                {
                                    _callback(FILE_IO_RESULT.SUCCESS, _data, _buffer);
                                }
                                else if (is_numeric(_callback))
                                {
                	                script_execute(_callback, FILE_IO_RESULT.SUCCESS, _data, _buffer);
                                }
    	                    }
    	                    else
    	                    {
    	                        Trace("FileIO: Load of \"", _filename, "\" completed, but the buffer is empty!");
                                
                                if (is_method(_callback))
                                {
                                    _callback(FILE_IO_RESULT.EMPTY, _data, _buffer);
                                }
                                else if (is_numeric(_callback))
                                {
                	                script_execute(_callback, FILE_IO_RESULT.EMPTY, _data, _buffer);
                                }
    	                    }
                        }
	                break;
	            }
                
	            current_operation = undefined;
	            buffer_delete(_buffer);
	        }
	    }
	}


}
