$(function(){
  if($('.registration').length){

    let displayTime=300;

    function addErrMessage(inputField,message){
      if(inputField.parents('.formGroup').find('.errMessage').text()!=message){
        inputField.parents('.formGroup').find('.errMessage').remove();
      }
      if(!inputField.parents('.formGroup').find('.errMessage').length){
        inputField.addClass('errBorder');
        inputField.after(`<div class="errMessage">${message}</div>`);
        inputField.parents('.formGroup').find('.errMessage').addClass('errHeight');
      }
    }

    function addErrMessageName(beforeErrorMessage,inputField,message){

      if(inputField.parents('.formGroup').find('.errMessage:contains("不正")').length){
        if(inputField.attr('id').includes('kanji')){
          if(inputField.attr('id').includes('family')){name='姓';}else{name='名'}
        }else{
          if(inputField.attr('id').includes('family')){name='姓カナ';}else{name='名カナ'}
        }
        inputField.parents('.formGroup').find(`.errMessage:contains('${name} は不正')`).remove();
      }

      if(inputField.parents('.half').find(`.errMessage:contains('${message}')`).text()!=message){
        inputField.addClass('errBorder');
        beforeErrorMessage.after(`<div class="errMessage">${message}</div>`);
        beforeErrorMessage.parents('.half').find('.errMessage').addClass('errHeight');
      }
    }

    function removeErrMessage(inputField,errMessageClass){
      if(inputField.parents('.formGroup').find(errMessageClass).length){
        inputField.removeClass('errBorder');
        inputField.parents('.formGroup').find(errMessageClass).addClass('errHeight0');
        setTimeout(function(){inputField.parents('.formGroup').find(errMessageClass).remove();},displayTime);
      }
    }





    $('input').focusout(function(){

      if($(this).attr('id')=='user_nickname'){
        if(!$(this).val()){
          addErrMessage($(this),'ニックネームを入力してください');
        }else{
          removeErrMessage($(this),'.errMessage');
        }
      }

      if($(this).attr('id')=='user_email'){
        if(!$(this).val()){
          addErrMessage($(this),'メールアドレスを入力してください');
        }else if($(this).val()==$(this).val().match(/[\w\-._]+@[\w\-._]+\.[a-zA-Z]+/)){
          removeErrMessage($(this),'.errMessage');
        }else{
          addErrMessage($(this),'フォーマットが不適切です');
        }
      }

      if($(this).attr('id')=='user_password'){
        if(!$(this).val()){
          addErrMessage($(this),'パスワードを入力してください');
        }else if($(this).val()==$(this).val().match(/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/)){
          removeErrMessage($(this),'.errMessage');
          if($('#user_password_confirmation').val()!=$(this).val()&&$('#user_password_confirmation').val()!=''){
            addErrMessage($('#user_password_confirmation'),'パスワードが異なります。');
          }else if($('#user_password_confirmation').val().length){
            removeErrMessage($('#user_password_confirmation'),'.errMessage');
          }
        }else if(null==$(this).val().match(/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/)){
          if($(this).val().length<7){
            addErrMessage($(this),'7文字以上で入力してください');
          }else if($(this).val()==$(this).val().match(/[a-zA-Z\d]{7,}/)){
            addErrMessage($(this),'英字と数字の両方を含めて設定してください');
          }else{
            addErrMessage($(this),'半角英数字のみを使用してください');
          }
        }else{
          addErrMessage($(this),'半角英数字のみを使用してください');
        }
      }

      if($(this).attr('id')=='user_password_confirmation'){
        if(!$(this).val()){
          addErrMessage($(this),'パスワード：確認用を入力してください');
        }else if($(this).val()==$('#user_password').val()){
          removeErrMessage($(this),'.errMessage');
        }else if($('#user_password').val().length){
          addErrMessage($(this),'パスワードが異なります。');
        }
      }

      if($(this).attr('id')=='user_family_name_kanji'){
        if(!$(this).val()){
          addErrMessageName($("#user_first_name_kanji"),$(this),'姓 を入力してください');
        }else{
          removeErrMessage($(this),".errMessage:contains('姓')");
        }
      }

      if($(this).attr('id')=='user_first_name_kanji'){
        if(!$(this).val()){
          addErrMessageName($('#user_first_name_kanji'),$(this),'名 を入力してください');
        }else{
          removeErrMessage($(this),".errMessage:contains('名')");
        }
      }

      if($(this).attr('id')=='user_family_name_kana'){
        if(!$(this).val()){
          addErrMessageName($('#user_first_name_kana'),$(this),'姓カナ を入力してください');
        }else{
          removeErrMessage($(this),".errMessage:contains('姓')");
        }
      }

      if($(this).attr('id')=='user_first_name_kana'){
        if(!$(this).val()){
          addErrMessageName($('#user_first_name_kana'),$(this),'名カナ を入力してください');
        }else{
          removeErrMessage($(this),".errMessage:contains('名')");
        }
      }
    });

    $('select').focusout(function(){
      if($(this).attr('id')=='year'||'month'||'day'){
        if($(this).val().length<2){
          $(this).addClass('errBorder');
          if(!$(this).parents().children('.errMessage').length){
            $('#birthday').after('<div class="errMessage">生年月日を入力してください</div>');
            $(this).parents().children('.errMessage').addClass('errHeight');
          }
        }
      }
    });

    $('select').change(function(){
      if($(this).attr('id')=='year'||'month'||'day'){
        if($('#birthday').val().length==8){
          $(this).removeClass('errBorder');
          if($(this).parents().children('.errMessage').length){
            $(this).parents().children('.errMessage').addClass('errHeight0');
            setTimeout($.proxy(function(){$(this).parents().children('.errMessage').remove();},this),displayTime);
          }
        }else{
          $(this).removeClass('errBorder');
        }
      }
    });





    $('[type="submit"]').click(function(e){
      $('input,select').each(function(){$(this).blur();});
      if($('.errMessage').length){
        e.preventDefault();
        $('[type="submit"]').prop('disabled',false);
      }
    });

  }
});