$(document).on('turbolinks:load', function() {
  $(function(){

    // 商品説明文の文字数カウント実装
    $('.item-text').keyup(function(){
      let count = $(this).val().length;
      $('.word-count').text(count);
    });


    // エラーメッセージの表示実装
    $('#input-images').on('blur', function(){
        let images = $(this).val();

        if (images == '') {
          $('.result-images').show();
        }
        else {
          $('.result-images').hide();
        };
    });

    $('.item-name').on('blur', function(){
      let item_name = $(this).val();

      if (item_name == '') {
        $('.result-item-name').show();
      }
      else {
        $('.result-item-name').hide();
      };
    });

    $('.item-text').on('blur', function(){
      let item_text = $(this).val();

      if (item_text == '') {
        $('.result-item-text').show();
      }
      else {
        $('.result-item-text').hide();
      };
    });

    $('.field__select--category').on('blur', function(){
      let category = $(this).val();

      if (category == '') {
        $('.result-category').show();
      }
      else {
        $('.result-category').hide();
      };
    });

    $('.field__select--status').on('blur', function(){
      let status = $(this).val();

      if (status == '') {
        $('.result-status').show();
      }
      else {
        $('.result-status').hide();
      };
    });

    $('.field__select--postage_type').on('blur', function(){
      let postage = $(this).val();

      if (postage == '') {
        $('.result-postage').show();
      }
      else {
        $('.result-postage').hide();
      };
    });

    $('.field__select--prefecture').on('blur', function(){
      let prefecture = $(this).val();

      if (prefecture == '') {
        $('.result-prefecture').show();
      }
      else {
        $('.result-prefecture').hide();
      };
    });

    $('.field__select--need_day').on('blur', function(){
      let need_day = $(this).val();

      if (need_day == '') {
        $('.result-day').show();
      }
      else {
        $('.result-day').hide();
      };
    });

    $('.input-price').on('blur', function(){
      let price = $(this).val();

      if (price < 300) {
        $('.result-price').show();
      }
      else if(price > 9999999){
        $('.result-price').show();
      }
      else {
        $('.result-price').hide();
      };
    });

  });
});