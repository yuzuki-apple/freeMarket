$(function(){
  $('#content__send--button').on('submit', function(e){
    console.log('hoge');
    e.preventDefault()
  });
});

$(function() {
  $(".price").on("keyup", function() {
    var x = $(".price").val();
    var result = x * 0.10;
    document.getElementById("tax").innerText = result;
    var y = x - result;
    document.getElementById("profit").innerText = y;
  });
});