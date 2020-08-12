// 画像複数投稿
$(document).on('ready', function() {
  $('.slider_thumb').slick({
      arrows:false,
      asNavFor:'.thumb',
  });
  $('.thumb').slick({
      asNavFor:'.slider_thumb',
      focusOnSelect: true,
      slidesToShow:4,
      slidesToScroll:1
  });
});