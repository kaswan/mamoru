// JavaScript Document

//p = console.log;

$(function(){
  var conf = {
    className : 'over',
    postfix : '_o'
  };
  $('.'+conf.className).each(function(){
    this.originalSrc = this.src;
    this.rolloverSrc = this.originalSrc.replace(/(\.gif|\.jpg|\.png)/, conf.postfix+"$1");
    preloadImage(this.rolloverSrc);
  }).hover(function(){
    this.src = this.rolloverSrc;
  },function(){
    this.src = this.originalSrc;
  });
});
preloadedImages = [];
function preloadImage(url){
	var p = preloadedImages;
	var l = p.length;
	p[l] = new Image();
	p[l].src = url;
}