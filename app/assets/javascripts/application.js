// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .



//


// スライダー

document.addEventListener("turbolinks:load", function(){
  $("#theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'slide',
      // 変化に係る時間(ミリ秒)
      speed : 2000,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : 'block',
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : true,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 4000,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : true,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
  });
});

//JapanMap
document.addEventListener("turbolinks:load", function(){
  //地域を設定
  //{"code":[地域のコード], "name": [地域の名前], "color":[地域につける色], "hoverColor":[地域をマウスでホバーしたときの色], "prefectures":[地域に含まれる都道府県のコード]}
  var areas = [
    {"code": 1 , "name":"北海道地方", "color":"#ca93ea", "hoverColor":"#e0b1fb", "prefectures":[1]},
    {"code": 2 , "name":"東北地方",   "color":"#a7a5ea", "hoverColor":"#d6d4fd", "prefectures":[2,3,4,5,6,7]},
    {"code": 3 , "name":"関東地方",   "color":"#84b0f6", "hoverColor":"#c1d8fd", "prefectures":[8,9,10,11,12,13,14]},
    {"code": 4 , "name":"北陸・甲信越地方",   "color":"#52d49c", "hoverColor":"#93ecc5", "prefectures":[15,16,17,18,19,20]},
    {"code": 4 , "name":"東海地方",   "color":"#77e18e", "hoverColor":"#aff9bf", "prefectures":[21,22,23,24]},
    {"code": 6 , "name":"近畿地方",   "color":"#f2db7b", "hoverColor":"#f6e8ac", "prefectures":[25,26,27,28,29,30]},
    {"code": 7 , "name":"中国地方",   "color":"#f9ca6c", "hoverColor":"#ffe5b0", "prefectures":[31,32,33,34,35]},
    {"code": 8 , "name":"四国地方",   "color":"#fbad8b", "hoverColor":"#ffd7c5", "prefectures":[36,37,38,39]},
    {"code": 9 , "name":"九州地方",   "color":"#f7a6a6", "hoverColor":"#ffcece", "prefectures":[40,41,42,43,44,45,46,47]},
  ];

  var areaLinks = {
    "北海道地方" : "/prefectures/1",
    "東北地方" : "/prefectures/2",
    "関東地方" : "/prefectures/8",
    "北陸・甲信越地方" : "/prefectures/15",
    "東海地方" : "/prefectures/21",
    "近畿地方" : "/prefectures/25",
    "中国地方" : "/prefectures/31",
    "四国地方" : "/prefectures/36",
    "九州地方" : "/prefectures/40",
  };

  $(".map").japanMap(
    {
      areas  : areas, //上で設定したエリアの情報
      selection : "area", //選ぶことができる範囲(県→prefecture、エリア→area)
      borderLineWidth: 0.25, //線の幅
      drawsBoxLine : false, //canvasを線で囲む場合はtrue
      movesIslands : true, //南西諸島を左上に移動させるときはtrue、移動させないときはfalse
      showsAreaName : true, //エリア名を表示しない場合はfalse
      width: 900, //canvasのwidth。別途heightも指定可。
      // backgroundColor: "rgba(255, 255, 255, 0.1)", //canvasの背景色
      font : "MS Mincho", //地図に表示する文字のフォント
      fontSize : 12, //地図に表示する文字のサイズ
      fontColor : "#FFF", //地図に表示する文字の色。"areaColor"でエリアの色に合わせる
      fontShadowColor : "black", //地図に表示する文字の影の色
      onSelect:function(data){ //選択範囲をクリックしたときに実行
        location.href = areaLinks[data.area.name]; //data.area.nameは選択したエリアの名前
      },
    }
  );
});

//prefectures#show タブメニュー
document.addEventListener("turbolinks:load", function(){
    $('.tabcontent > div').hide();

    $('.tabnav a').click(function () {
        $('.tabcontent > div').hide().filter(this.hash).show(); //fadeInとどっちがいい？

        $('.tabnav a').removeClass('active');
        $(this).addClass('active');

        return false;
    }).filter(':eq(0)').click();
});


//カード編集用モーダル
$(function(){
  $('div.edit_modal').each(function(i){
        $(this).attr('id','edit-modal' + (i+1));
    });
});

//anchor
document.addEventListener("turbolinks:load", function(){
  $('a[href^="#"]').click(function() {
    var href = $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, 500, 'swing');
    return false;
  });
});

// count

// document.addEventListener("turbolinks:load", function(){

//     var text_max = 330; // 最大入力値
//     $(".count").text(text_max - $("#memo_text").val().length);

//     $("#memo_text").on("keydown keyup keypress change",function(){
//         var text_length = $(this).val().length;
//         var countdown = text_max - text_length;
//         $(".count").text(countdown);
//         // CSSは任意で
//         if(countdown < 0){
//             $('.count').css({
//                 color:'#ff0000',
//                 fontWeight:'bold'
//             });
//         } else {
//             $('.count').css({
//                 color:'#000000',
//                 fontWeight:'normal'
//             });
//         }
//     });
// });

//文字入力カウント
document.addEventListener("turbolinks:load", function(){

    var text_max = 330; // 最大入力値
    $(".count").text(text_max - $("#memo_text").val());

    $("#memo_text").on("keydown keyup keypress change",function(){
        var text_length = $(this).val().length;
        var countdown = text_max - text_length;
        $(".count").text(countdown);
        // CSSは任意で
        if(countdown < 0){
            $('.count').css({
                color:'#ff0000',
                fontWeight:'bold'
            });
        } else {
            $('.count').css({
                color:'#000000',
                fontWeight:'normal'
            });
        }
    });
});


$(document).ready(function(){
    $("#validate_id").validationEngine();
  });