/// Scales all drawn elements by the given scaling factors
/// The centre of the scaling operation is always the origin (0,0) so move elements accordingly using TransformMove()
/// 
/// @param xScale
/// @param yScale

function TransformScaleExt(_xscale, _yscale) 
{
    global.__transformMatrix[@ 0] *= _xscale;
    global.__transformMatrix[@ 5] *= _yscale;
}