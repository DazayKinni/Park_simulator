/// Closes the compound transform, applies it to the draw pipeline
/// This function does *not* return the resulting matrix

function TransformEnd() 
{
	matrix_set(matrix_world, global.__transformMatrix);
    TransformStart();
}