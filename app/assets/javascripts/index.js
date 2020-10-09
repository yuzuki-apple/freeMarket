
$(function() {
  $('.category').hover(
    function() {
      $('.display-None').fadeIn();
    },
    function() {
      $('.display-None').fadeOut();
    });

});

$(function() {
  $('.display-None').hover(
    function() {
      $('.subcatTree').fadeIn();
    },
    function() {
      $('.subcatTree').fadeOut();
    });

});

$(function() {
  $('.subcatTree').hover(
    function() {
      $('.itemTree').fadeIn();
    },
    function() {
      $('.itemTree').fadeOut();
    });

});