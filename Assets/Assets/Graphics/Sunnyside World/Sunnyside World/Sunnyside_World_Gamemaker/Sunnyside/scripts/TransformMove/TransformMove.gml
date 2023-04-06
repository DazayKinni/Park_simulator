/// Moves all drawn elements by the given offset
/// This is called a "linear translation" in the trade
///
/// @param xOffset
/// @param yOffset

function TransformMove(_x, _y)
{
    global.__transformMatrix[@ 12] += _x;
    global.__transformMatrix[@ 13] += _y;
}