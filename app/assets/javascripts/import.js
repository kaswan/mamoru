var _ua = (function(u){
  return {
    Tablet:(u.indexOf("windows") != -1 && u.indexOf("touch") != -1 && u.indexOf("tablet pc") == -1) 
      || u.indexOf("ipad") != -1
      || (u.indexOf("android") != -1 && u.indexOf("mobile") == -1)
      || (u.indexOf("firefox") != -1 && u.indexOf("tablet") != -1)
      || u.indexOf("kindle") != -1
      || u.indexOf("silk") != -1
      || u.indexOf("playbook") != -1,
    Mobile:(u.indexOf("windows") != -1 && u.indexOf("phone") != -1)
      || u.indexOf("iphone") != -1
      || u.indexOf("ipod") != -1
      || (u.indexOf("android") != -1 && u.indexOf("mobile") != -1)
      || (u.indexOf("firefox") != -1 && u.indexOf("mobile") != -1)
      || u.indexOf("blackberry") != -1
  }
})(window.navigator.userAgent.toLowerCase());

if(_ua.Mobile || _ua.Tablet){
		document.write('<link rel="stylesheet" type="text/css" href="/assets/common/common.css">');
        document.write('<link rel="stylesheet" type="text/css" href="/assets/tv/sp.css">');
}else{
		document.write('<link rel="stylesheet" type="text/css" href="/assets/common/common.css">');
    document.write('<link rel="stylesheet" type="text/css" href="/assets/tv/pc.css">');
	document.write('<script type="text/javascript" src="/assets/chat.js"></script>');
}