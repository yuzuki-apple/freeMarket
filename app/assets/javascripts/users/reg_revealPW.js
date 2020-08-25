$(function(){
  if($('.registration').length){

    function responsive(){
      if($(window).width()>=768){
        revealHeight='48px';
        revealPadding='10px';
      }else{
        revealHeight='12vw';
        revealPadding='3vw';
      }
    }
    function revealPassword(){
      if(reveal_password.checked){
        $('.revealedPassword').css('display','block');
        $('.revealedPassword').animate({padding:revealPadding,height:revealHeight},300);
        $('.revealedPassword').text($('#user_password').val());
      }else if($('.revealedPassword').height()!=0){
        $('.revealedPassword').animate({padding:`0 ${revealPadding}`,height:'0'},300);
        setTimeout(function(){$('.revealedPassword').css('display','none');},300);
      }
    }

    $('#reveal_password').change(function(){
      responsive();
      revealPassword();
    });

    $('#user_password').keyup(function(){
      responsive();
      revealPassword();
    });

  }
});