/// @param GMDebugLevel
/// @param TexanDebugLevel
function TexanInit(argument0, argument1) {

	texture_debug_messages(argument0);
	global.__TexanDebugLevel = argument1;

	global.__TexanFlush                = ds_list_create();
	global.__TexanFetch                = ds_list_create();
	global.__TexanAlwaysFetch          = ds_list_create();
	global.__TexanTextureGroups        = ds_list_create();
	global.__TexanSpriteToTextureGroup = ds_map_create();


}
