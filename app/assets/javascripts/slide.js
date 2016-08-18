(function($) {
  $(function(){
    $(".right").click(function(){
      $("header").slideDown();
    });
    $("#mclose").click(function(){
      $("header").slideUp();
    });
  });
})(jQuery);
(function($) {
  $(function(){
    $(".left").click(function(){
      $("#head").slideDown();
    });
    $("#close").click(function(){
      $("#head").slideUp();
    });
  });
})(jQuery);