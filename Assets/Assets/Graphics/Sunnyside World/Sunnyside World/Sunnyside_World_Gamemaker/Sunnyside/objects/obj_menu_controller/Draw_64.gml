if ( room = rm_menu and galleryShowSlideAsBackground ) draw_sprite_ext( gallery[galleryIndex].index, 0, DISPLAY.GetGuiMidX(), DISPLAY.GetGuiMidY(), gallery[galleryIndex].scale, gallery[galleryIndex].scale, 0, c_white, 1 );

drawGallerySlides();
drawSidePanels();
drawButtons();

drawHeader();

drawLoader();
drawTitles();
drawLogo();