//Font families are:
//  "latin"
//  "arabic"
//  "chinese_trad"
//  "japanese"
//  "korean"
//  "thai"
//  "chinese_simp"
//  "hebrew"
//  "greek"
//  "devanagari"
//  "cyrillic"

global.__fontFamilyPerLanguage = ds_map_create();
global.__fontFamilyPerLanguage[? "English"                ] = "latin";
global.__fontFamilyPerLanguage[? "Arabic"                 ] = "arabic";
global.__fontFamilyPerLanguage[? "Chinese (Traditional)"  ] = "chinese_trad";
global.__fontFamilyPerLanguage[? "French"                 ] = "latin";
global.__fontFamilyPerLanguage[? "German"                 ] = "latin";
global.__fontFamilyPerLanguage[? "Italian"                ] = "latin";
global.__fontFamilyPerLanguage[? "Japanese"               ] = "japanese";
global.__fontFamilyPerLanguage[? "Korean"                 ] = "korean";
global.__fontFamilyPerLanguage[? "Polish"                 ] = "latin";
global.__fontFamilyPerLanguage[? "Brazilian Portuguese"   ] = "latin";
global.__fontFamilyPerLanguage[? "Spanish (Spain)"        ] = "latin";
global.__fontFamilyPerLanguage[? "Spanish (Latin America)"] = "latin";
global.__fontFamilyPerLanguage[? "Swedish"                ] = "latin";
global.__fontFamilyPerLanguage[? "Thai"                   ] = "thai";
global.__fontFamilyPerLanguage[? "Turkish"                ] = "latin";
global.__fontFamilyPerLanguage[? "Chinese (Simplified)"   ] = "chinese_simp";
global.__fontFamilyPerLanguage[? "Danish"                 ] = "latin";
global.__fontFamilyPerLanguage[? "Dutch"                  ] = "latin";
global.__fontFamilyPerLanguage[? "Finnish"                ] = "latin";
global.__fontFamilyPerLanguage[? "Norwegian"              ] = "latin";
global.__fontFamilyPerLanguage[? "Portuguese (Portugal)"  ] = "latin";
global.__fontFamilyPerLanguage[? "Romanian"               ] = "latin";
global.__fontFamilyPerLanguage[? "Hebrew"                 ] = "hebrew";
global.__fontFamilyPerLanguage[? "Greek"                  ] = "greek";
global.__fontFamilyPerLanguage[? "Indonesian"             ] = "latin";
global.__fontFamilyPerLanguage[? "Hungarian"              ] = "latin";
global.__fontFamilyPerLanguage[? "Czech"                  ] = "latin";
global.__fontFamilyPerLanguage[? "Vietnamese"             ] = "vietnamese";
global.__fontFamilyPerLanguage[? "Hindi"                  ] = "devanagari";
global.__fontFamilyPerLanguage[? "Malay"                  ] = "latin";
global.__fontFamilyPerLanguage[? "Russian"                ] = "cyrillic";
global.__fontFamilyPerLanguage[? "Croatian"               ] = "latin";
global.__fontFamilyPerLanguage[? "Ukranian"               ] = "cyrillic";

#region Latin

var _latinFinalFont = "spr_font_avenir_heavy_italic_msdf";
scribble_font_set_default(_latinFinalFont);

scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "E", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "L", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "P", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "R", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "X", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "Y", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "Z", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_kerning_pair_set("spr_font_avenir_heavy_italic_msdf", "A", "Y", -3, true);

scribble_kerning_pair_set("spr_font_riffic_msdf", "A", "Y", -3, true);

scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "E", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "L", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "P", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "R", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "X", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "Y", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_glyph_set("spr_font_avenir_heavy_italic_msdf", "Z", SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);
scribble_kerning_pair_set("spr_font_avenir_heavy_italic_msdf", "A", "Y", -3, true);

/*
scribble_glyph_set(_latinFinalFont, "a", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "à", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "á", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "â", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "ã", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "ä", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "ă", SCRIBBLE_GLYPH.SEPARATION,  1, true);

scribble_glyph_set(_latinFinalFont, "e", SCRIBBLE_GLYPH.SEPARATION, -1, true); scribble_glyph_set(_latinFinalFont, "e", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_glyph_set(_latinFinalFont, "i", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "j", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "j", SCRIBBLE_GLYPH.X_OFFSET, -7, true);
scribble_glyph_set(_latinFinalFont, "k", SCRIBBLE_GLYPH.SEPARATION, -2, true);
scribble_glyph_set(_latinFinalFont, "l", SCRIBBLE_GLYPH.SEPARATION, -3, true);
scribble_glyph_set(_latinFinalFont, "m", SCRIBBLE_GLYPH.SEPARATION,  2, true);
scribble_glyph_set(_latinFinalFont, "o", SCRIBBLE_GLYPH.SEPARATION, -1, true); scribble_glyph_set(_latinFinalFont, "o", SCRIBBLE_GLYPH.X_OFFSET, -2, true);
scribble_glyph_set(_latinFinalFont, "ó", SCRIBBLE_GLYPH.SEPARATION, -1, true); scribble_glyph_set(_latinFinalFont, "ó", SCRIBBLE_GLYPH.X_OFFSET, -2, true);
scribble_glyph_set(_latinFinalFont, "r", SCRIBBLE_GLYPH.SEPARATION, -2, true);
scribble_glyph_set(_latinFinalFont, "v", SCRIBBLE_GLYPH.SEPARATION, -1, true);
scribble_glyph_set(_latinFinalFont, "w", SCRIBBLE_GLYPH.SEPARATION, -1, true); scribble_glyph_set(_latinFinalFont, "w", SCRIBBLE_GLYPH.X_OFFSET, -1, true); scribble_glyph_set(_latinFinalFont, "w", SCRIBBLE_GLYPH.Y_OFFSET, -1, true);

scribble_glyph_set(_latinFinalFont, "A", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "A", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "À", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "À", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "Á", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "Á", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "Â", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "Â", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "Ã", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "Ã", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "Ä", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "Ä", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "Ă", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_latinFinalFont, "Ă", SCRIBBLE_GLYPH.X_OFFSET, -3, true);

scribble_glyph_set(_latinFinalFont, "D", SCRIBBLE_GLYPH.SEPARATION, -3, true); scribble_glyph_set(_latinFinalFont, "D", SCRIBBLE_GLYPH.X_OFFSET,  1, true);
scribble_glyph_set(_latinFinalFont, "E", SCRIBBLE_GLYPH.SEPARATION, -1, true);
scribble_glyph_set(_latinFinalFont, "F", SCRIBBLE_GLYPH.SEPARATION,  1, true); scribble_glyph_set(_latinFinalFont, "F", SCRIBBLE_GLYPH.X_OFFSET,  1, true);
scribble_glyph_set(_latinFinalFont, "H", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "I", SCRIBBLE_GLYPH.X_OFFSET,   -1, true);
scribble_glyph_set(_latinFinalFont, "Î", SCRIBBLE_GLYPH.X_OFFSET,   -1, true);
scribble_glyph_set(_latinFinalFont, "J", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "K", SCRIBBLE_GLYPH.X_OFFSET,    1, true);
scribble_glyph_set(_latinFinalFont, "L", SCRIBBLE_GLYPH.SEPARATION, -1, true);
scribble_glyph_set(_latinFinalFont, "O", SCRIBBLE_GLYPH.SEPARATION, -1, true);
scribble_glyph_set(_latinFinalFont, "M", SCRIBBLE_GLYPH.SEPARATION,  1, true);
scribble_glyph_set(_latinFinalFont, "P", SCRIBBLE_GLYPH.SEPARATION, -3, true);
scribble_glyph_set(_latinFinalFont, "R", SCRIBBLE_GLYPH.SEPARATION,  1, true); scribble_glyph_set(_latinFinalFont, "R", SCRIBBLE_GLYPH.X_OFFSET,  1, true);
scribble_glyph_set(_latinFinalFont, "S", SCRIBBLE_GLYPH.SEPARATION, -1, true);
scribble_glyph_set(_latinFinalFont, "T", SCRIBBLE_GLYPH.SEPARATION, -3, true); scribble_glyph_set(_latinFinalFont, "T", SCRIBBLE_GLYPH.X_OFFSET, -2, true);
scribble_glyph_set(_latinFinalFont, "V", SCRIBBLE_GLYPH.SEPARATION, -5, true); scribble_glyph_set(_latinFinalFont, "V", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_latinFinalFont, "W", SCRIBBLE_GLYPH.SEPARATION, -3, true); scribble_glyph_set(_latinFinalFont, "W", SCRIBBLE_GLYPH.Y_OFFSET, -1, true);
scribble_glyph_set(_latinFinalFont, "Y", SCRIBBLE_GLYPH.SEPARATION, -5, true); scribble_glyph_set(_latinFinalFont, "Y", SCRIBBLE_GLYPH.X_OFFSET, -3, true);

scribble_glyph_set(_latinFinalFont, "6", SCRIBBLE_GLYPH.SEPARATION,  3, true);

scribble_glyph_set(_latinFinalFont, "ç", SCRIBBLE_GLYPH.SEPARATION, -2, true);
scribble_glyph_set(_latinFinalFont, "İ", SCRIBBLE_GLYPH.SEPARATION, 2, true);
*/
#endregion


/*
#region Arabic

var _family = "arabic";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -31, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 1, true);
scribble_glyph_set(_super, "!", SCRIBBLE_GLYPH.X_OFFSET, -2, true); scribble_glyph_set(_super, "!", SCRIBBLE_GLYPH.SEPARATION, 2, true);

#endregion



#region Chinese (Traditional)

var _family = "chinese_trad";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -2, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 4, true);

#endregion



#region Japanese

var _family = "japanese";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -2, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 4, true);

#endregion



#region Korean

var _family = "korean";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -2, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 4, true);

#endregion



#region Thai

var _family = "thai";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_glyph_set(_super, " ", SCRIBBLE_GLYPH.SEPARATION, -7, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -8, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 8, true);

#endregion



#region Chinese (Simplified)

var _family = "chinese_simp";
var _source = "spr_font_chinese_simp_msdf"; //Custom

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -2, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 4, true);

#endregion



#region Hebrew

var _family = "hebrew";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);
scribble_glyph_set(_super, "!", SCRIBBLE_GLYPH.X_OFFSET, -2, true); scribble_glyph_set(_super, "!", SCRIBBLE_GLYPH.SEPARATION, 2, true);

#endregion



#region Greek

var _family = "greek";
var _source = "spr_font_" + _family + "_msdf";

scribble_glyph_set(_source, "Α", SCRIBBLE_GLYPH.SEPARATION, -4, true); scribble_glyph_set(_source, "Α", SCRIBBLE_GLYPH.X_OFFSET, -3, true);
scribble_glyph_set(_source, "Π", SCRIBBLE_GLYPH.SEPARATION, 3, true);

#endregion



#region Devanagari

var _family = "devanagari";
var _source = "spr_font_" + _family + "_msdf";

scribble_glyph_set(_source, ord("U") + __SCRIBBLE_DEVANAGARI_OFFSET, SCRIBBLE_GLYPH.Y_OFFSET, 0.5, true);

scribble_glyph_set(_source, all, SCRIBBLE_GLYPH.Y_OFFSET, -18, true);
scribble_glyph_set(_source, " ", SCRIBBLE_GLYPH.SEPARATION, -2, true);

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [33, 127]);

scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.Y_OFFSET, 10, true);

#endregion



#region Cyrillic

var _family = "cyrillic";
var _source = "spr_font_" + _family + "_msdf";

//Nudge letters following Г to the left to avoid АНГАР looking strange on the main menu
scribble_glyph_set(_source, ord("А"), SCRIBBLE_GLYPH.SEPARATION, -2, true); scribble_glyph_set(_source, ord("А"), SCRIBBLE_GLYPH.X_OFFSET, -2, true);
scribble_glyph_set(_source, ord("Г"), SCRIBBLE_GLYPH.SEPARATION, -1, true); scribble_glyph_set(_source, ord("Г"), SCRIBBLE_GLYPH.X_OFFSET,  1, true);
scribble_glyph_set(_source, ord("І"), SCRIBBLE_GLYPH.SEPARATION,  2, true); scribble_glyph_set(_source, ord("І"), SCRIBBLE_GLYPH.X_OFFSET,  2, true);

#endregion



#region Vietnamese

var _family = "vietnamese";
var _source = "spr_font_" + _family + "_msdf";

//Create a new superfont to add in basic symbols and Latin (English) characters from the base font (Riffic)
var _super = _family + "Super";
scribble_super_create(_super);
scribble_super_glyph_copy_all(_super, _source, true);
scribble_super_glyph_copy(_super, _latinFinalFont, true, [48, 57]);

scribble_glyph_set(_super, ".", SCRIBBLE_GLYPH.X_OFFSET, 3, true);
scribble_glyph_set(_super, ".", SCRIBBLE_GLYPH.SEPARATION, 5, true);
scribble_glyph_set(_super, "%", SCRIBBLE_GLYPH.X_OFFSET, 6, true);
scribble_glyph_set(_super, "%", SCRIBBLE_GLYPH.SEPARATION, 6, true);
scribble_glyph_set(_super, all, SCRIBBLE_GLYPH.FONT_HEIGHT, -10, true);

#endregion
*/