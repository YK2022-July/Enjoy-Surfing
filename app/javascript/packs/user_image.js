window.onload = function() {
  ('#button1').on('click', function() {
    ("#overlay, #overlayWindow").fadeIn();
  });

  ('#button2').on('click', function() {
    ("#overlay, #overlayWindow").fadeOut();
  });
};
