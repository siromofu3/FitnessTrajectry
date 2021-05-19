document.addEventListener("turbolinks:load", function () {

  // フラッシュ自動フェードアウト
  $(function(){
    setTimeout("$('.flash').fadeOut('slow')", 5000) 
  });

});

