$(function() {
  window.keydown = {};

  function keyName(event) {
    return jQuery.hotkeys.specialKeys[event.which] ||
      String.fromCharCode(event.which).toLowerCase();
  }
    $(document).unbind("keypress");
  $(document).bind("keydown", function(event) {
    keydown[keyName(event)] = true;
      var k = event.keyCode;
      if(k >= 37 && k <= 40) {
          return false;
      }

  });
  
  $(document).bind("keyup", function(event) {
    keydown[keyName(event)] = false;
  });
});
