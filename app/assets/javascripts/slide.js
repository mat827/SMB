$(function(){
  $('.slider').slick({
    // アクセシビリティ。左右ボタンで画像の切り替えをできるかどうか
    accessibility: false,
     // 自動再生。trueで自動再生される。
    autoplay: true,
    // 自動再生で切り替えをする時間
    autoplaySpeed: 2000,
    // 画像下のドット（ページ送り）を表示
    dots: true,
    fade: true,
    // ナビゲーション矢印の表示（trueで表示）
    arrows: false,
    // 変化にかかる時間（ミリ秒）
    speed : 3000,

  });
});