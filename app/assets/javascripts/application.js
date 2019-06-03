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
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function(){


// $(function() {
	$(".timeshow").css("display", "none");
    $("td").click(function() {
    console.log("click");
    // 現在のセルの色が無色透明かを判別
    if($(this).css("background-color")=="rgba(0, 0, 0, 0)") {
        $("td").css("background-color", "");
        $("td").removeAttr('id'); 
        $(".timeshow").css("display", "none");

        $msg = $(this).text();
        $l_at = $msg.split(',');
        $("#g_time").text($l_at[1]);

        // 赤色に染める
        $(this).css("background-color","rgb(255,192,203)"); 

        // $(this).addClass("colorchange");
        $(this).attr('id', 'color');
        if($l_at.length == 2){
        	$(".timeshow").toggle();
    	}
    } else { 
          	   
        // 無色透明にする
        $(this).css("background-color", ""); 
        $("td").removeAttr('id');
        $(".timeshow").toggle();
    } 
    });
 
// }); 


$(function(){
  $('.scroll').click(function(){
  	console.log("scroll");
    var speed = 2000;
    var href= balloon;
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("body,html").animate({scrollTop:position}, speed, "swing");
    return false;

  });
});




$(function(){
$(document).on('click',   function(e) {
  if (!$(e.target).closest("#color").length) {
    // フェードやスライドなどの処理方法を記述;

    console.log("other")
    $("td").css("background-color", "");
    $("td").removeAttr('id');
    $(".timeshow").css("display", "none");
  }

}); 
});

});


