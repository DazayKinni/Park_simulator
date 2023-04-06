/// Rotates all drawn elements by the given angle
/// The centre of rotation is always the origin (0,0) so move elements accordingly using TransformMove()
/// 
/// @param angle

function TransformRotate(_angle) 
{
    //TODO - Optimise
	global.__transformMatrix = matrix_multiply(global.__transformMatrix, matrix_build(0,0, 0,   0,0,_angle,   1,1,1));
}