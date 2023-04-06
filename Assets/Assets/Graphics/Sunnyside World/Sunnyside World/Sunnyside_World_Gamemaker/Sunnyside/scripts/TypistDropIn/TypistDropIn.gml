function TypistDropIn()
{
        return scribble_typist()
               .in(0.3, 5)
               .ease(SCRIBBLE_EASE.BACK, 0, -59, 1, 1, 0, 0.15);
}