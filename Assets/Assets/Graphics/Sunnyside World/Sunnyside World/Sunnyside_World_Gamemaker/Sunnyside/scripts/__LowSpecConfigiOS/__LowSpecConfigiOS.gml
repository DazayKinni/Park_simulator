function __LowSpeciOSModels(_hardwareModel)
{
    switch(string_lower(_hardwareModel))
    {
        case "iphone1,1": 
        case "iphone1,2":
        case "iphone2,1":
        case "iphone3,1":
        case "iphone3,2":
        case "iphone3,3":
        case "iphone4,1":
        case "iphone5,1":
        case "iphone5,2":
        case "iphone5,3":
        case "iphone5,4":
        case "iphone6,1":
        case "iphone6,2":
        case "iphone7,2":
        case "iphone7,1":
        case "ipod1,1":
        case "ipod2,1":
        case "ipod3,1":
        case "ipod4,1":
        case "ipod5,1":
        case "ipod7,1":
        case "ipad1,1":
        case "ipad2,1":
        case "ipad2,2":
        case "ipad2,3":
        case "ipad2,4":
        case "ipad3,1":
        case "ipad3,2":
        case "ipad3,3":
        case "ipad3,4":
        case "ipad3,5":
        case "ipad3,6":
        case "ipad4,1":
        case "ipad4,2":
        case "ipad4,3":
        case "ipad2,5":
        case "ipad2,6":
        case "ipad2,7":
        case "ipad4,4":
        case "ipad4,5":
        case "ipad4,6":
        case "ipad4,7":
        case "ipad4,8":
        case "ipad4,9":
            return true;
        break;
    }
        
    return false;
}