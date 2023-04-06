application_surface_draw_enable(false);

#macro DISPLAY global.pictureFrame
DISPLAY = (new PictureFrame())
          .SetCameraParams(352, 198,   infinity, 198) //Min width/height, max width/height
          .SetViewParams(4, true) //Max scaling factor, pixel-perfect
          .SetWindowParams(ResLibGetMaxWidth(), ResLibGetMaxHeight(), true) //Max width/height, whether the window can be resized to fit the view
          .SetFullscreen(window_get_fullscreen()) //Whether is display should be in fullscreen
          .SetGuiParams(undefined, 1080) //Target width/height, max of one dimension can be defined

DISPLAY.Apply(); //Set the camera size, app surface size, window size, and GUI size

alarm[0] = 10;

kawaseBundle = kawase_create(surface_get_width(application_surface)/4, surface_get_height(application_surface)/4, 2);