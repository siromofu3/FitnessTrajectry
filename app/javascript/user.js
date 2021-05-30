document.addEventListener("turbolinks:load", function () {

  // user_showページでタブ毎にコンテンツを切り替える
  $("#charts-tab").click(function() {
    $("#user-charts-tab").css("display", "block");
    $("#user-posts-tab, #user-likes-tab").css("display", "none");
    $("#posts-tab, #likes-tab").removeClass("active");
    $("#charts-tab").addClass("active");
  });
  $("#posts-tab").click(function() {
    $("#user-posts-tab").css("display", "block");
    $("#user-likes-tab, #user-charts-tab").css("display", "none");
    $("#likes-tab, #charts-tab").removeClass("active");
    $("#posts-tab").addClass("active");
  });
  $("#likes-tab").click(function() {
    $("#user-posts-tab, #user-charts-tab").css("display", "none");
    $("#user-likes-tab").css("display", "block");
    $("#posts-tab, #charts-tab").removeClass("active");
    $("#likes-tab").addClass("active");
  });

});

