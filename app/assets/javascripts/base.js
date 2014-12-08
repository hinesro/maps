$(document).ready(function () {
	setTimeout(function () {
		$('.alert').fadeOut(1000);
	}, 2000);

	$('.listing-image').on('click', function () {
		$(this).toggleClass('large');
	});
});