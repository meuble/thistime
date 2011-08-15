function findSize() {
	var height = $(window).height();
	var width = $(window).width();
	var widePhotoWidth = $(window).height() * 1.5

	if (width < widePhotoWidth + 250) {
		$('#wrapper').removeClass('wide');
		$('#wrapper').addClass('small');
	} else {
		$('#wrapper').removeClass('small');		
		$('#wrapper').addClass('wide');
	}

	$('.photos').css('width', widePhotoWidth > width ? width : widePhotoWidth);
	$('.photo').each(function(index, element) {
		var article = $(element);
		var image = $('img', element);
		var photoWidth = image.attr('src') ? parseInt(image.css('width')) : widePhotoWidth

		if (photoWidth > width) {
			image.css('marginLeft', (width - photoWidth) / 2)
		} else {
			image.css('marginLeft', 0)
		}
		article.css('width', photoWidth > width ? width : photoWidth).css('height', height)
	});	
}

$(window).resize(findSize);
$(window).load(function() {
	findSize();
	$('footer').fadeOut(500);
});


$(function() {
	$("article.photo").hover(function() { $('footer', this).fadeIn(500); }, function() { $('footer', this).fadeOut(500); });
});
