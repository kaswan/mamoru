// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require hermitage
//= require jquery_ujs
//= require jquery_nested_form
//= require dropzone
//= require jquery.infinite-pages
//= require alertify
//= require fancybox
//= require ../init_fancybox
//= require ../infinite_table
//= require ../import_mypage
//= require ../rollover
//= require ../slide
//= require_tree .
//= require turbolinks


$(function(){
  alertify.parent(document.body);
});

