/// @param slotTitle
/// @param slotSubtitle

enum FILE_IO
{
	METADATA,
	TYPE,
	FILENAME,
	BUFFER,
	CALLBACK,
    CALLBACK_DATA,
	GROUP_NAME,
	SLOT_TITLE,
	__SIZE,
}

enum FILE_IO_RESULT
{
	ERROR   = -1,
	EMPTY   =  0,
	SUCCESS =  1,
}

function FileIoInit(_slot_title, _slot_subtitle)
{
	with(obj_fileio)
	{
	    queue             = ds_list_create();
	    current_operation = undefined;
	    current_async_id  = undefined;
    
	    group_name    = "default";
	    slot_title    = _slot_title;
	    slot_subtitle = _slot_subtitle;
    
	    rate_limit        = 9999; //per minute
	    time_between_ops  = 0; //ms
	    operation_history = ds_list_create();
	    disk_access_time  = -1;
    
	    switch(os_type)
	    {
	        case os_switch:
	            group_name = "default";
	            rate_limit = 30; //per minute
	            time_between_ops = 1200; //ms
	        break;
        
	        //FIXME - This presumes Steam
	        case os_windows:
	        case os_macosx:
	            /*var _steam_id      = steam_get_user_steam_id();
	            var _steam_persona = steam_get_persona_name();
	            if (FILE_IO_VERBOSE) Trace("FileIO: Steam ID=", _steam_id, ", persona=", _steam_persona);
            
	            if (_steam_id >= 0)
	            {
	                group_name = string(_steam_id); //Different save folders per user
	                Trace("FileIO: Changing group name to \"", group_name + "\"");
	            }
	            else
	            {
	                group_name = "offline";
	                Trace("FileIO: Using fallback group name \"", group_name + "\"");
	            }*/
	        break;
	    }
	}
}