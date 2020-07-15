$(function(){
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

   $(function(){
     $('.purchase').on('click', function(e){
       e.preventDefault();
       $('.purchase-info').toggle(350);
     });
   });
});