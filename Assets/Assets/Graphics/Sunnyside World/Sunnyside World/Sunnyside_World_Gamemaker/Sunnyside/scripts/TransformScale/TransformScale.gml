/// Uniformly scales all drawn elements by the given scaling factor
/// The centre of the scaling operation is always the origin (0,0) so move elements accordingly using TransformMove()
/// 
/// @param scale

function TransformScale(_scale) 
{
    global.__transformMatrix[@ 0] *= _scale;
    global.__transformMatrix[@ 5] *= _scale;
}