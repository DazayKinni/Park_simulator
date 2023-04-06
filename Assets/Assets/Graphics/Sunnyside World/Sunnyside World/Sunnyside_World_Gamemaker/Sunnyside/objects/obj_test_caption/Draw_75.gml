if (caption != undefined)
{
    caption.Draw(DISPLAY.GetGuiMidX(), DISPLAY.GetGuiMidY());
    
    draw_line(0, DISPLAY.GetGuiMidY(), DISPLAY.GetGuiWidth(), DISPLAY.GetGuiMidY());
    draw_line(DISPLAY.GetGuiMidX(), 0, DISPLAY.GetGuiMidX(), DISPLAY.GetGuiHeight());
}