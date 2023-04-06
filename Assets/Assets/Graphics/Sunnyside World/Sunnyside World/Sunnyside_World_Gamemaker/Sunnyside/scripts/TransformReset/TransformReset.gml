/// Resets the GPU's state so that no transform is applied

function TransformReset() 
{
	TransformStart();
	matrix_set(matrix_world, global.__transformMatrix);
}