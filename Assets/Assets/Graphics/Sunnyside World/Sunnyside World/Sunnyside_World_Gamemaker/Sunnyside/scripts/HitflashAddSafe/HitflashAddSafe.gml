/// @param instance
/// @param [time]

function HitflashAddSafe(_instance, _time = undefined)
{
    if ((_instance != undefined)
    &&  instance_exists(_instance)
    &&  (variable_instance_exists(_instance, "hitflash")))
    {
        (_instance.hitflash).Add(_time);
    }
}