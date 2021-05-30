document.addEventListener("turbolinks:load", function () {


  // ハンバーガーメニュー
  $(function () {
    $('.menu-icon').on('click', function () {
    $('.header-menus').toggleClass('open');
    })
  });


  // フラッシュ自動フェードアウト
  $(function(){
    setTimeout("$('.flash').fadeOut('slow')", 5000) 
  });


  

});

