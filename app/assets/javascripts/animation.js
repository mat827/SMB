// スクロールアニメーション
$(function(){
  $(".inview").on("inview", function (event, isInView) {
    if (isInView) {
      $(this).stop().addClass("is-show");
    }
  });

  $('.content-introduction').hover(
    function(){
      $('.content-text-introduction').fadeIn();
    },
    function(){
      $('.content-text-introduction').fadeOut();
    }
    );

  $('.content-body').hover(
    function(){
      $('.content-text-body').fadeIn();
    },
    function(){
      $('.content-text-body').fadeOut();
    }
    );

  $('.content-measures').hover(
    function(){
      $('.content-text-measures').fadeIn();
    },
    function(){
      $('.content-text-measures').fadeOut();
    }
    );
});
