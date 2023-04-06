if (transform.draw)
{
	transform.ApplyTransform(x, y);
		draw_pill(0, 0, boxW, boxH, pillCol, 1, true, true);
		Apply();
		scribbleElement.draw(textX, 0);
	TransformReset();
}