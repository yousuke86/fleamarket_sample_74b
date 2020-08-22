$(document).on('turbolinks:load', function() {
  $(function() {
    $('#input-nickname').on('blur', function(){
      let nickname = $(this).val();
      if (nickname == '') {
        $('#result-nickname').show();
      }
      else {
        $('#result-nickname').hide();
      };
    });

    $('#input-email').on('blur', function(){
      let email = $(this).val();
      if (email == '') {
        $('#result-email').show();
      }
      else {
        $('#result-email').hide();
      };
    });
    
    $('#input-password').on('blur', function(){
      let password = $(this).val();
      if (password == '') {
        $('#result-password').show();
      }
      else {
        $('#result-password').hide();
      };
    });

    $('#input-password_confirmation').on('blur', function(){
      let password_confirmation = $(this).val();
      if (password_confirmation == '') {
        $('#result-password_confirmation').show();
      }
      else {
        $('#result-password_confirmation').hide();
      };
    });

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

    $('#input-birth_day').on('blur', function(){
      let birth_day = $(this).val();
      if (birth_day == '') {
        $('#result-birth').show();
      }
      else {
        $('#result-birth').hide();
      };
    });
  });
});