function DistortionSurfaceSetTarget()
{
    var _surface = DistortionGetSurface();
    if ((_surface == undefined) || (_surface < 0)) return false;
    surface_set_target(_surface);
    return true;
}