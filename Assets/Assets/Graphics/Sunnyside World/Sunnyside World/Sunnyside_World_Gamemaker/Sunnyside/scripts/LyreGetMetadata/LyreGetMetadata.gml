/// Returns the metadata associated with a key as an array
/// If there is no metadata for a key, or the key is not found, this function returns <undefined>
/// 
/// @param key

function LyreGetMetadata(_key)
{
    static _lyre = __Lyre();
    //N.B. The metadata struct is NOT static!
    return _lyre.__metadataStruct[$ _key];
}