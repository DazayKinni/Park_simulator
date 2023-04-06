/// @desc methods

updateGallery = function()
{
	var _index = irandom(array_length(gallery)-1);
	while ( _index == galleryIndexPrev ) _index = irandom(array_length(gallery)-1);
	galleryIndex = irandom(array_length(gallery)-1);
	galleryIndexPrev = galleryIndex;
}

showGallerySlide = function(_bool)
{
	galleryShowSlideAsBackground = _bool;	
}

getGalleryCount = function()
{
	return array_length(gallery);
}