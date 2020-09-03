$(function(){ 
  let note1 = $("input.content__description_name--input");

  var noteBorder_css = {
    border: "3px solid red",
  }
  var noteAlert_css = {
    display: "block",
  }
  function noteAlert() {
    $(this).css(noteBorder_css);
    $("p.description_name_note").css(noteAlert_css);
  }

  note1.blur(noteAlert);
});