$(document).on('turbolinks:load', function() {
  $(function() {
    
    $('#input-first_name').on('blur', function(){
      let first_name = $(this).val();
      if (first_name == '') {
        $('#result-first_name').show();
      }
      else {
        $('#result-first_name').hide();
      };
    });

    $('#input-last_name').on('blur', function(){
      let last_name = $(this).val();
      if (last_name == '') {
        $('#result-last_name').show();
      }
      else {
        $('#result-last_name').hide();
      };
    });

    $('#input-first_name_kana').on('blur', function(){
      let first_name_kana = $(this).val();
      if (first_name_kana == '') {
        $('#result-first_name_kana').show();
      }
      else {
        $('#result-first_name_kana').hide();
      };
    });

    $('#input-last_name_kana').on('blur', function(){
      let last_name_kana = $(this).val();
      if (last_name_kana == '') {
        $('#result-last_name_kana').show();
      }
      else {
        $('#result-last_name_kana').hide();
      };
    });

    $('#input-post_code').on('blur', function(){
      let post_code = $(this).val();
      if (post_code == '') {
        $('#result-postcode').show();
      }
      else {
        $('#result-postcode').hide();
      };
    });

    $('#input-city').on('blur', function(){
      let city = $(this).val();
      if (city == '') {
        $('#result-city').show();
      }
      else {
        $('#result-city').hide();
      };
    });
  });
});