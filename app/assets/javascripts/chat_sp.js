$(document).ready( function(){
		var main = $("#main");
		var mainwidth = window.innerWidth;
		var mainheight = window.innerHeight;
		var maintop = $("#main_top");
		var maintopwidth = window.innerWidth;
		var maintopheight = window.innerHeight;
		main.css("width", mainwidth);
		main.css("min-height", mainheight);
		maintop.css("width", maintopwidth);
		maintop.css("min-height", maintopheight);
});
(function($) {
  $(function(){
    $(".first").click(function(){
      $("#wss").slideDown();
    });
    $("#mclose").click(function(){
      $("#wss").slideUp();
    });
  });
})(jQuery);