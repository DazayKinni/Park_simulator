enum RES_LIB
{
    //Desktop and console
    
    //1920x1080 - The most common resolution in the Steam hardware survey, as of 2023-01-04
    DESKTOP_COMMON,
    
    DESKTOP_16_9_1280_X_720,
    DESKTOP_16_9_1366_X_768,
    DESKTOP_16_9_1920_X_1080,
    DESKTOP_16_9_2560_X_1440,
    DESKTOP_16_9_3840_X_2160,
    
    DESKTOP_16_10_1280_X_800,
    DESKTOP_16_10_1920_X_1200,
    DESKTOP_16_10_2560_X_1600,
    DESKTOP_16_10_3840_X_2400,
    
    STEAM_DECK,      //1280x800
    SWITCH_HANDHELD, //1280x720
    
    //Android Phones
    SAMSUNG_S22_ULTRA,
    SAMSUNG_S22_PLUS,
    SAMSUNG_S22,
    SAMSUNG_S21_FE,
    SAMSUNG_S21_ULTRA,
    SAMSUNG_S21_PLUS,
    SAMSUNG_S21,
    SAMSUNG_S20_ULTRA,
    SAMSUNG_S20_PLUS,
    SAMSUNG_S20,
    SAMSUNG_S10_PLUS,
    SAMSUNG_S10,
    SAMSUNG_S10E,
    SAMSUNG_S9_PLUS,
    SAMSUNG_S9,
    SAMSUNG_S8_PLUS,
    SAMSUNG_S8,
    SAMSUNG_S7_EDGE,
    SAMSUNG_S7,
    
    //Android Tablets
    SAMSUNG_TAB_S8_ULTRA,
    SAMSUNG_TAB_S8_PLUS,
    SAMSUNG_TAB_S8,
    SAMSUNG_TAB_S7_FE,
    SAMSUNG_TAB_S7_PLUS,
    SAMSUNG_TAB_S7,
    SAMSUNG_TAB_S6,
    SAMSUNG_TAB_S6_LITE,
    
    //iPhone
    //https://www.ios-resolution.com/
    IPHONE_14_PLUS,
    IPHONE_14_PRO_MAX,
    IPHONE_14_PRO,
    IPHONE_14,
    IPHONE_SE_3RD_GEN,
    IPHONE_13,
    IPHONE_13_MINI,
    IPHONE_13_PRO_MAX,
    IPHONE_13_PRO,
    IPHONE_12,
    IPHONE_12_MINI,
    IPHONE_12_PRO_MAX,
    IPHONE_12_PRO,
    IPHONE_SE_2ND_GEN,
    IPHONE_11_PRO_MAX,
    IPHONE_11_PRO,
    IPHONE_11,
    IPOD_TOUCH_7TH_GEN,
    IPHONE_XR,
    IPHONE_XS_MAX,
    IPHONE_XS,
    IPHONE_X,
    IPHONE_8_PLUS,
    IPHONE_8,
    IPHONE_7_PLUS,
    IPHONE_7,
    IPHONE_SE_1ST_GEN,
    IPHONE_6S_PRO,
    IPHONE_6S,
    
    //iPad
    //https://www.ios-resolution.com/
    IPAD_PRO_6TH_GEN_12_INCH,
    IPAD_PRO_6TH_GEN_11_INCH,
    IPAD_10TH_GEN,
    IPAD_AIR_5TH_GEN,
    IPAD_9TH_GEN,
    IPAD_PRO_5TH_GEN_12_INCH,
    IPAD_PRO_5TH_GEN_11_INCH,
    IPAD_AIR_4TH_GEN,
    IPAD_8TH_GEN,
    IPAD_PRO_4TH_GEN_12_INCH,
    IPAD_PRO_4TH_GEN_11_INCH,
    IPAD_MINI_6TH_GEN,
    IPAD_MINI_5TH_GEN,
    IPAD_AIR_3RD_GEN,
    IPAD_PRO_3RD_GEN_12_INCH,
    IPAD_PRO_3RD_GEN_11_INCH,
    IPAD_6TH_GEN,
    IPAD_PRO_2ND_12_INCH,
    IPAD_PRO_2ND_10_INCH,
    IPAD_5TH_GEN,
    IPAD_PRO_1ST_GEN_9_INCH,
    IPAD_PRO_1ST_GEN_12_INCH,
    IPAD_MINI_4TH_GEN,
    IPAD_AIR_2,
}

global.__resLib = [];

//Desktop and console
global.__resLib[@ RES_LIB.DESKTOP_COMMON] = { __width: 1920, __height: 1080 };

global.__resLib[@ RES_LIB.DESKTOP_16_9_1280_X_720 ] = { __width: 1280, __height:  720 };
global.__resLib[@ RES_LIB.DESKTOP_16_9_1366_X_768 ] = { __width: 1366, __height:  768 };
global.__resLib[@ RES_LIB.DESKTOP_16_9_1920_X_1080] = { __width: 1920, __height: 1080 };
global.__resLib[@ RES_LIB.DESKTOP_16_9_2560_X_1440] = { __width: 2560, __height: 1440 };
global.__resLib[@ RES_LIB.DESKTOP_16_9_3840_X_2160] = { __width: 3840, __height: 2160 };

global.__resLib[@ RES_LIB.DESKTOP_16_10_1280_X_800 ] = { __width: 1280, __height:  800 };
global.__resLib[@ RES_LIB.DESKTOP_16_10_1920_X_1200] = { __width: 1920, __height: 1200 };
global.__resLib[@ RES_LIB.DESKTOP_16_10_2560_X_1600] = { __width: 2560, __height: 1600 };
global.__resLib[@ RES_LIB.DESKTOP_16_10_3840_X_2400] = { __width: 3840, __height: 2400 };

global.__resLib[@ RES_LIB.STEAM_DECK     ] = { __width: 1280, __height: 800 };
global.__resLib[@ RES_LIB.SWITCH_HANDHELD] = { __width: 1280, __height: 720 };

//Android Phones
global.__resLib[@ RES_LIB.SAMSUNG_S22_ULTRA ] = { __width: 1440, __height: 3088 };
global.__resLib[@ RES_LIB.SAMSUNG_S22_PLUS  ] = { __width: 1080, __height: 2340 };
global.__resLib[@ RES_LIB.SAMSUNG_S22       ] = { __width: 1080, __height: 2340 };
global.__resLib[@ RES_LIB.SAMSUNG_S21_FE    ] = { __width: 1080, __height: 2340 };
global.__resLib[@ RES_LIB.SAMSUNG_S21_ULTRA ] = { __width: 1440, __height: 3200 };
global.__resLib[@ RES_LIB.SAMSUNG_S21_PLUS  ] = { __width: 1080, __height: 2400 };
global.__resLib[@ RES_LIB.SAMSUNG_S21       ] = { __width: 1080, __height: 2400 };
global.__resLib[@ RES_LIB.SAMSUNG_S20_ULTRA ] = { __width: 1440, __height: 3200 };
global.__resLib[@ RES_LIB.SAMSUNG_S20_PLUS  ] = { __width: 1440, __height: 3200 };
global.__resLib[@ RES_LIB.SAMSUNG_S20       ] = { __width: 1440, __height: 3200 };
global.__resLib[@ RES_LIB.SAMSUNG_S10_PLUS  ] = { __width: 1440, __height: 3200 };
global.__resLib[@ RES_LIB.SAMSUNG_S10       ] = { __width: 1440, __height: 3040 };
global.__resLib[@ RES_LIB.SAMSUNG_S10E      ] = { __width: 1080, __height: 2280 };
global.__resLib[@ RES_LIB.SAMSUNG_S9_PLUS   ] = { __width: 1440, __height: 2960 };
global.__resLib[@ RES_LIB.SAMSUNG_S9        ] = { __width: 1440, __height: 2960 };
global.__resLib[@ RES_LIB.SAMSUNG_S8_PLUS   ] = { __width: 1440, __height: 2960 };
global.__resLib[@ RES_LIB.SAMSUNG_S8        ] = { __width: 1440, __height: 2960 };
global.__resLib[@ RES_LIB.SAMSUNG_S7_EDGE   ] = { __width: 1440, __height: 2560 };
global.__resLib[@ RES_LIB.SAMSUNG_S7        ] = { __width: 1440, __height: 2560 };

//Android Tablets
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S8_ULTRA] = { __width: 1848, __height: 2960 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S8_PLUS ] = { __width: 1752, __height: 2800 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S8      ] = { __width: 1600, __height: 2560 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S7_FE   ] = { __width: 1600, __height: 2560 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S7_PLUS ] = { __width: 1752, __height: 2800 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S7      ] = { __width: 1600, __height: 2560 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S6      ] = { __width: 1600, __height: 2560 };
global.__resLib[@ RES_LIB.SAMSUNG_TAB_S6_LITE ] = { __width: 1200, __height: 2000 };

//iPHONE
global.__resLib[@ RES_LIB.IPHONE_14_PLUS    ] = { __width: 1284, __height: 2360 };
global.__resLib[@ RES_LIB.IPHONE_14_PRO_MAX ] = { __width: 1290, __height: 2778 };
global.__resLib[@ RES_LIB.IPHONE_14_PRO     ] = { __width: 1179, __height: 2796 };
global.__resLib[@ RES_LIB.IPHONE_14         ] = { __width: 1170, __height: 2556 };
global.__resLib[@ RES_LIB.IPHONE_SE_3RD_GEN ] = { __width:  750, __height: 1334 };
global.__resLib[@ RES_LIB.IPHONE_13         ] = { __width: 1170, __height: 2532 };
global.__resLib[@ RES_LIB.IPHONE_13_MINI    ] = { __width: 1080, __height: 2340 };
global.__resLib[@ RES_LIB.IPHONE_13_PRO_MAX ] = { __width: 1284, __height: 2778 };
global.__resLib[@ RES_LIB.IPHONE_13_PRO     ] = { __width: 1170, __height: 2532 };
global.__resLib[@ RES_LIB.IPHONE_12         ] = { __width: 1170, __height: 2532 };
global.__resLib[@ RES_LIB.IPHONE_12_MINI    ] = { __width: 1080, __height: 2340 };
global.__resLib[@ RES_LIB.IPHONE_12_PRO_MAX ] = { __width: 1284, __height: 2778 };
global.__resLib[@ RES_LIB.IPHONE_12_PRO     ] = { __width: 1170, __height: 2532 };
global.__resLib[@ RES_LIB.IPHONE_SE_2ND_GEN ] = { __width:  750, __height: 1334 };
global.__resLib[@ RES_LIB.IPHONE_11_PRO_MAX ] = { __width: 1242, __height: 2688 };
global.__resLib[@ RES_LIB.IPHONE_11_PRO     ] = { __width: 1125, __height: 2436 };
global.__resLib[@ RES_LIB.IPHONE_11         ] = { __width:  828, __height: 1792 };
global.__resLib[@ RES_LIB.IPOD_TOUCH_7TH_GEN] = { __width:  640, __height: 1136 };
global.__resLib[@ RES_LIB.IPHONE_XR         ] = { __width:  828, __height: 1792 };
global.__resLib[@ RES_LIB.IPHONE_XS_MAX     ] = { __width: 1242, __height: 2688 };
global.__resLib[@ RES_LIB.IPHONE_XS         ] = { __width:  812, __height: 2436 };
global.__resLib[@ RES_LIB.IPHONE_X          ] = { __width: 1125, __height: 2436 };
global.__resLib[@ RES_LIB.IPHONE_8_PLUS     ] = { __width: 1080, __height: 1920 };
global.__resLib[@ RES_LIB.IPHONE_8          ] = { __width:  750, __height: 1334 };
global.__resLib[@ RES_LIB.IPHONE_7_PLUS     ] = { __width: 1080, __height: 1920 };
global.__resLib[@ RES_LIB.IPHONE_7          ] = { __width:  750, __height: 1334 };
global.__resLib[@ RES_LIB.IPHONE_SE_1ST_GEN ] = { __width:  640, __height: 1136 };
global.__resLib[@ RES_LIB.IPHONE_6S_PRO     ] = { __width: 1080, __height: 1920 };
global.__resLib[@ RES_LIB.IPHONE_6S         ] = { __width:  750, __height: 1334 };

//iPad
global.__resLib[@ RES_LIB.IPAD_PRO_6TH_GEN_12_INCH] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_PRO_6TH_GEN_11_INCH] = { __width: 1668, __height: 2388 };
global.__resLib[@ RES_LIB.IPAD_10TH_GEN           ] = { __width: 1640, __height: 2360 };
global.__resLib[@ RES_LIB.IPAD_AIR_5TH_GEN        ] = { __width: 1640, __height: 2360 };
global.__resLib[@ RES_LIB.IPAD_9TH_GEN            ] = { __width: 1620, __height: 2160 };
global.__resLib[@ RES_LIB.IPAD_PRO_5TH_GEN_12_INCH] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_PRO_5TH_GEN_11_INCH] = { __width: 1668, __height: 2388 };
global.__resLib[@ RES_LIB.IPAD_AIR_4TH_GEN        ] = { __width: 1640, __height: 2360 };
global.__resLib[@ RES_LIB.IPAD_8TH_GEN            ] = { __width: 1620, __height: 2160 };
global.__resLib[@ RES_LIB.IPAD_PRO_4TH_GEN_12_INCH] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_PRO_4TH_GEN_11_INCH] = { __width: 1668, __height: 2388 };
global.__resLib[@ RES_LIB.IPAD_MINI_6TH_GEN       ] = { __width: 1488, __height: 2266 };
global.__resLib[@ RES_LIB.IPAD_MINI_5TH_GEN       ] = { __width: 1536, __height: 2048 };
global.__resLib[@ RES_LIB.IPAD_AIR_3RD_GEN        ] = { __width: 1668, __height: 2224 };
global.__resLib[@ RES_LIB.IPAD_PRO_3RD_GEN_12_INCH] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_PRO_3RD_GEN_11_INCH] = { __width: 1668, __height: 2388 };
global.__resLib[@ RES_LIB.IPAD_6TH_GEN            ] = { __width: 1536, __height: 2048 };
global.__resLib[@ RES_LIB.IPAD_PRO_2ND_12_INCH    ] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_PRO_2ND_10_INCH    ] = { __width: 1668, __height: 2224 };
global.__resLib[@ RES_LIB.IPAD_5TH_GEN            ] = { __width: 1536, __height: 2048 };
global.__resLib[@ RES_LIB.IPAD_PRO_1ST_GEN_9_INCH ] = { __width: 1536, __height: 2048 };
global.__resLib[@ RES_LIB.IPAD_PRO_1ST_GEN_12_INCH] = { __width: 2048, __height: 2732 };
global.__resLib[@ RES_LIB.IPAD_MINI_4TH_GEN       ] = { __width: 1536, __height: 2048 };
global.__resLib[@ RES_LIB.IPAD_AIR_2              ] = { __width: 1536, __height: 2048 };