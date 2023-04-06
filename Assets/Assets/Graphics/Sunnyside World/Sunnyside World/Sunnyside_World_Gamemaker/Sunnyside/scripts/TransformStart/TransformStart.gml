/// Starts a compound transform
/// Once you're done setting up the compound transform, call TransformEnd() or TransformEndNoApply()

global.__transformMatrix = array_create(16, 0);

function TransformStart() 
{
    static _identityMatrix = matrix_build_identity();
    array_copy(global.__transformMatrix, 0, _identityMatrix, 0, 16);
}