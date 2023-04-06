/// Returns a copy of the current transform matrix

function TransformGet()
{
	var _matrix = array_create(16, 0);
    array_copy(_matrix, 0, global.__transformMatrix, 0, 16);
    return _matrix;
}