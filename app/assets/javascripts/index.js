
$(function() {
  $('.category').hover(
    function() {
      $('.displayNone').fadeIn();
    },
    function() {
      $('.displayNone').fadeOut();
    });
  
});

$(function() {
  $('.displayNone').hover(
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