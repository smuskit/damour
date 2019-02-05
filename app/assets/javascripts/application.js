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
//= require activestorage
//= require turbolinks
//= require_tree .

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

  $("#map").japanMap(
    {
      width: 800,
      areas  : areas, //上で設定したエリアの情報
      selection : "area", //選ぶことができる範囲(県→prefecture、エリア→area)
      borderLineWidth: 0.25, //線の幅
      drawsBoxLine : false, //canvasを線で囲む場合はtrue
      movesIslands : true, //南西諸島を左上に移動させるときはtrue、移動させないときはfalse
      showsAreaName : true, //エリア名を表示しない場合はfalse
      width: 800, //canvasのwidth。別途heightも指定可。˜ß
      backgroundColor: "rgba(0, 0, 0, 0.1)", //canvasの背景色
      font : "MS Mincho", //地図に表示する文字のフォント
      fontSize : 12, //地図に表示する文字のサイズ
      fontColor : "areaColor", //地図に表示する文字の色。"areaColor"でエリアの色に合わせる
      fontShadowColor : "black", //地図に表示する文字の影の色
      onSelect:function(data){ //選択範囲をクリックしたときに実行
        location.href = areaLinks[data.area.name]; //data.area.nameは選択したエリアの名前
      },
    }
  );
});



document.addEventListener("turbolinks:load", function(){
    $('.tabcontent > div').hide();

    $('.tabnav a').click(function () {
        $('.tabcontent > div').hide().filter(this.hash).show(); //fadeInとどっちがいい？

        $('.tabnav a').removeClass('active');
        $(this).addClass('active');

        return false;
    }).filter(':eq(0)').click();
});

