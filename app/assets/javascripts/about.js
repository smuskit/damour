document.addEventListener("turbolinks:load", function(){
  $('#load-more-content').click(function(){

    $('#more-content').toggleClass('shown');

    $('#load-more-content').hide();

    if( $('#more-content').hasClass('shown') ){
      $('#load-more-content').text('閉じる');
      $('#more-content').fadeIn('slow', function(){
        $('#load-more-content').fadeIn('slow');
      });
    }
    else{
      $('#load-more-content').text('サイトの使い方');
      $('#more-content').fadeOut('slow', function(){
        $('#load-more-content').fadeIn('slow');
      });
    }
  });
});