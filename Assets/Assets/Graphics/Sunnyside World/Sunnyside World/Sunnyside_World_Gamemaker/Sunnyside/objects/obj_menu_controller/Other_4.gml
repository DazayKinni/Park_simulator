if ( room == rm_menu )
{
	Menu_SetPage( MENUPAGE.CONTENTS );
	global.nextRoom = undefined;	
	
	if ( MUSIC_TITLES != undefined ) global.audio_TitleMusic = VinylPlay( MUSIC_TITLES );
}