$(function(){
  $('#content__send--button').on('submit', function(e){
    console.log('hoge');
    e.preventDefault()
  });
});

$(function() {
  $(".price").on("keyup", function() {
    let input = $(".price").val();
    console.log(input);
  });
});