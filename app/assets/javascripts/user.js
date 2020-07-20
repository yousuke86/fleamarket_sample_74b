// jqueryが読み込めてるかのテストです
$(function(){
<<<<<<< HEAD
  // ユーザーマイページの「出品した商品 - 出品中」のjs実装
  $('.exhibision-now-info').hide();

  $(function(){
    $('.exhibision-now').on('click', function(e){
      e.preventDefault();
      $('.exhibision-now-info').toggle(350);
    });
  });

  // ユーザーマイページの「出品した商品 - 売却済み」のjs実装
  $('.exhibision-end-info').hide();

  $(function(){
    $('.exhibision-end').on('click', function(e){
      e.preventDefault();
      $('.exhibision-end-info').toggle(350);
    });
  });

   // ユーザーマイページの「購入した商品 - 過去の取引」のjs実装
   $('.purchase-info').hide();

<<<<<<< HEAD
  $(function(){
    $('.purchase').on('click', function(e){
      e.preventDefault();
      $('.purchase-info').toggle(350);
    });
  });

  //  ログアウトボタンのjs実装
  $('.log-out__btn').hide();

  $(function(){
    $('.log-out').on('click', function(e){
      e.preventDefault();
      $('.log-out__btn').toggle(350);
      $("html,body").animate({scrollTop:$('.log-out').offset().top});
    });
  });
=======
  console.log('OK');
>>>>>>> parent of ee30beb... user_mypage_add_js
=======
   $(function(){
     $('.purchase').on('click', function(e){
       e.preventDefault();
       $('.purchase-info').toggle(350);
     });
   });
>>>>>>> parent of de14004... make_log-out-page&refactoring
});