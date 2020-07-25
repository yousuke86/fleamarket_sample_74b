$(function() {
  $('.address-page').on('click', function(e){
    let first_name = $("#input-first_name").val();
    let last_name = $("#input-last_name").val();
    let first_name_kana = $("#input-first_name_kana").val();
    let last_name_kana = $("#input-last_name_kana").val();
    let postcode = $("#input-postcode").val();
    let city = $("#input-city").val();
    let house_number = $("#input-house_number").val();
    let building_and_roomnumber = $("#input-building_and_roomnumber").val();

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

    if (postcode == '') {
      $('#result-postcode').show();
    }
    else {
      $('#result-postcode').hide();
    };

    if (city == '') {
      $('#result-city').show();
    }
    else {
      $('#result-city').hide();
    };

    if (house_number == '') {
      $('#result-house_number').show();
    }
    else {
      $('#result-house_number').hide();
    };

    if (building_and_roomnumber == '') {
      $('#result-building_and_roomnumber').show();
    }
    else {
      $('#result-building_and_roomnumber').hide();
    };

    $(function(){
      $('.field__input--prefecture').on('click', function(e){
        $('#result-prefecture').hide();
      });
    });

  });
});