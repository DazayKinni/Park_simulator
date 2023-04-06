/// Starts a compound transform, but using a preprepared matrix as the starting point
/// Once you're done setting up the compound transform, call TransformEnd() or TransformEndNoApply()
///
/// @param matrix

function TransformStartFrom(_matrix) 
{
    array_copy(global.__transformMatrix, 0, _matrix, 0, 16);
}