$(function() {
  $(".content__detail_category--select").on("change",function(){
    var int = $(this).val()
 
      function buildHTML(result){
          var html =
            `<option value= ${result.id}>${result.name}</option>`
          return html
      }
 
      if(int == ""){
        $('#child').remove();
        $('#item_category_id').remove();
      }else{
        $.ajax({
          url: "/items/get_children",
          type: 'GET',
          dataType: 'json',
          data: {category_id: int}
        })
        
        .done(function(categories) {
          var insertHTML = `<select name="child" id="child">
                            <option value=0>---</option>`;
          $.each(categories, function(i, category) {
            insertHTML += buildHTML(category)
          });
          insertHTML += `</select>`
          if($('#child').length){
            $('#child').replaceWith(insertHTML);
            $('#item_category_id').remove();
          } else {
            $('.content__detail_category--form').append(insertHTML);
          };
        });
      }
    });


    $('.content__detail_category--form').on("change","#child",function(){
      var int = $(this).val()
      function buildHTML(category){
          var html =
            `<option value= ${category.id}>${category.name}</option>`
          return html
      }
      var intParent = document.getElementById("item_category").value
      var intChild = document.getElementById("child").value
      var int = intParent + '/' + intChild

      if(intChild == 0){
        $('#item_category_id').remove();
      } else {
      
        $.ajax({
          url: "/items/get_grand_children",
          type: 'GET',
          dataType: 'json',
          data: {category_id: int}
        })

        .done(function(categories) {
          var insertHTML = `<select name="item[category_id]" id="item_category_id">
                            <option value=0>---</option>`;
          $.each(categories, function(i, category) {
            insertHTML += buildHTML(category)
          });
          insertHTML += `</select>`

          if($('#item_category_id').length){
            $('#item_category_id').replaceWith(insertHTML);
          } else {
            $('.content__detail_category--form').append(insertHTML);
          };
        });
      }
    });
})





