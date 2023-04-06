if (caption == undefined)
{
    if (keyboard_check_pressed(ord("J")))
    {
        caption = new PopCaption("Juju was here!", c_red);
    }
}
else
{
    caption.Update();
    if (caption.GetFinished()) caption = undefined;
}