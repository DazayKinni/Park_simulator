/// Adds a squash & strech controller to the currently scoped instance
/// You can access the controller later by reading the <squashStretch> variable
/// 
/// <squashStretch> itself contains a reference to a new struct of the class __ClassSquashStretch()
/// The created struct has the following methods:
/// 
/// .Add(x, y)
///   Adds stretch & squash distortion, starting the animation
/// 
/// .Tick()
///   Updates the stretch & squash animation
/// 
/// .DrawSprite(sprite, image, x, y)
///   Draws the given sprite/image at the given position using the stretch & squash animation
/// 
/// @param [sprite=sprite_index]

function SquashStretchAttachToSelf(_sprite = sprite_index)
{
    if (variable_instance_exists(id, "squashStretch"))
    {
        show_debug_message("Squash & Stretch: Instance " + string(id) + " already has a squash & stretch controller");
    }
    else
    {
        squashStretch = new __ClassSquashStretch(_sprite);
    }
}

function __ClassSquashStretch(_sprite) constructor
{
    stretchX = 1;
    stretchY = 1;
    
    myHeight     = sprite_get_height(_sprite);
    myHeightHalf = myHeight/2;
    myWidth      = sprite_get_width(_sprite);
    myWidthHalf  = myWidth/2;
    
    sx1 = -myWidthHalf;
    sy1 = -myHeight-myHeightHalf;
    sx2 = myWidthHalf;
    sy2 = -myHeight-myHeightHalf;
    sx3 = myWidthHalf;
    sy3 = -myHeightHalf;
    sx4 = -myWidthHalf;
    sy4 = -myHeightHalf;
    
    lx = 0;
    lxVal = 0;
    
    static Add = function(_x, _y)
    {
        stretchX = _x;
        stretchY = _y;
    }
    
    static Tick = function()
    {
        stretchX = lerp(stretchX, 1, 0.1);
        stretchY = lerp(stretchY, 1, 0.1);
        
        lx  = lerp(lx, lxVal, 0.35);
        
        sx1 = -myWidthHalf + lx;
        sy1 = -myHeight-myHeightHalf;
        sx2 = myWidthHalf + lx;
        sy2 = -myHeight-myHeightHalf;
        sx3 = myWidthHalf;
        sy3 = -myHeightHalf;
        sx4 = -myWidthHalf;
        sy4 = -myHeightHalf;
    }
    
    static DrawSprite = function(_sprite, _image, _xOffset, _yOffset)
    {
        matrix_set(matrix_world, matrix_build(_xOffset, _yOffset + myHeightHalf, 0, 0, 0, 0, stretchX, stretchY, 0));
        
        draw_sprite_pos(_sprite, _image, sx1, sy1, sx2, sy2, sx3, sy3, sx4, sy4, 1);
        
        matrix_set(matrix_world, matrix_build_identity());
    }
}