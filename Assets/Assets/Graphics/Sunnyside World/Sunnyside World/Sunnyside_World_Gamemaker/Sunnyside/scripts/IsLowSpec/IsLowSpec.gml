show_debug_message("IsLowSpec(): Returned " + (IsLowSpec()? "<true>" : "<false>") + " on boot");

function IsLowSpec()
{
    static _result = undefined;
    
    if (_result == undefined)
    {
        if (os_type == os_android)
        {
            var _osInfo = os_get_info();
            if (_osInfo[? "SDK_INT"] < LOW_SPEC_ANDROID_TARGET_SDK)
            {
                show_debug_message("IsLowSpec(): Running Android API level " + string(_osInfo[? "SDK_INT"]) + " which is lower than target " + string(LOW_SPEC_ANDROID_TARGET_SDK) + ", returning low spec mode");
                _result = true;
            }
            else if (_osInfo[? "GL_MAX_TEXTURE_SIZE"] < LOW_SPEC_ANDROID_TEXTURE_SIZE_TARGET)
            {
                show_debug_message("IsLowSpec(): Max texture size is " + string(_osInfo[? "GL_MAX_TEXTURE_SIZE"]) + " which is lower than target " + string(LOW_SPEC_ANDROID_TEXTURE_SIZE_TARGET) + ", returning low spec mode");
                _result = true;
            }
            else
            {
                var _ram = __LowSpecGetAndroidRAM();
                show_debug_message("IsLowSpec(): Received RAM as " + string(_ram));
                
                var _ramInGB = _ram / (1024*1024*1024);
                if (_ramInGB < LOW_SPEC_ANDROID_TARGET_RAM_GB)
                {
                    show_debug_message("IsLowSpec(): RAM is " + string(_ramInGB) + "GB which is lower than target " + string(LOW_SPEC_ANDROID_TARGET_RAM_GB) + "GB, returning low spec mode");
                    _result = true;
                }
                else
                {
                    _result = false;
                }
            }
        }
        else if (os_type == os_tvos)
        {
            show_debug_message("IsLowSpec(): On tvOS, returning low spec mode");
            _result = LOW_SPEC_TVOS;
        }
        else if (os_type == os_ios)
        {
            var _osInfoMap = os_get_info();
            var _ramInGB = _osInfoMap[? "totalMemory"] / (1024*1024*1024);
            var _model   = _osInfoMap[? "platform"];
            
            if (_ramInGB < LOW_SPEC_IOS_TARGET_RAM_GB)
            {
                show_debug_message("IsLowSpec(): RAM is " + string(_ramInGB) + "GB, returning low spec mode");
                _result = true;
            }
            else if (__LowSpeciOSModels(_model))
            {
                show_debug_message("IsLowSpec(): Model is \"" + string(_model) + "\", returning low spec mode");
                _result = true;
            }
            else
            {
                _result = false;
            }
            
            ds_map_destroy(_osInfoMap);
        }
        else
        {
            //Presume every other platform is high spec I guess?
            _result = false;
        }
    }
    
    return _result;
}
