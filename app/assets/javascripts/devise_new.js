$(function() {
  $('.account-page').on('click', function(e){
    let nickname = $("#input-nickname").val();
    let email = $("#input-email").val();
    let password = $("#input-password").val();
    let password_confirmation = $("#input-password_confirmation").val();
    let first_name = $("#input-first_name").val();
    let last_name = $("#input-last_name").val();
    let first_name_kana = $("#input-first_name_kana").val();
    let last_name_kana = $("#input-last_name_kana").val();
    let year = $("#input-year").val();
    let month = $("#input-month").val();
    let day = $("#input-day").val();

    if (nickname == '') {
      $('#result-nickname').show();
    }
    else {
      $('#result-nickname').hide();
    };

    if (email == '') {
      $('#result-email').show();
    }
    else {
      $('#result-email').hide();
    };

    if (password == '') {
      $('#result-password').show();
    }
    else {
      $('#result-password').hide();
    };

    if (password_confirmation == '') {
      $('#result-password_confirmation').show();
    }
    else {
      $('#result-password_confirmation').hide();
    };

    if (first_name == '') {
      $('#result-first_name').show();
    }
    else {
      $('#result-first_name').hide();
    };

    if (last_name == '') {
      $('#result-last_name').show();
    }
    else {
      $('#result-last_name').hide();
    };

    if (first_name_kana == '') {
      $('#result-first_name_kana').show();
    }
    else {
      $('#result-first_name_kana').hide();
    };

    if (last_name_kana == '') {
      $('#result-last_name_kana').show();
    }
    else {
      $('#result-last_name_kana').hide();
    };

    $(function(){
      $('.field__birth-select').on('click', function(e){
        $('#result-birth').hide();
      });
    });

  });
});