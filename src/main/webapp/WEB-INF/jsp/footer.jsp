<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-08
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

</div>
<div id="footer">
    <div id="footer_corp">
        <span class="copyright"><img src="/img/logo@2x.png"> COPYRIGHT © 2016 MAAKISSUE. ALL RIGHTS RESERVED</span>
        <span style="float: right">
            <a href="/policy/privacy">개인정보 취급 방침</a>&nbsp; | &nbsp;<a href="/policy/service">이용약관</a>
            &nbsp;|&nbsp;
            <a href="http://petaz.co.kr/#contact">제휴하기 & 문의하기</a></span>
    </div>
</div>
<script>
    $("#searchBtn").on("click",function(){
        var text = $(".input_wrap input").val();
        $(location).attr("href","/search?text="+text);
    });
    $('.input_wrap input').live('keypress', function(e) {
        if (e.which == 13) {/* 13 == enter key@ascii */
            $(location).attr("href","/search?text="+$(".input_wrap input").val());
        }
    });
//    $(window).on("scroll",function() {
//        var current = $(document).scrollTop() + 80;
//        console.log(current);
//    });

    var quick_top = 130;
    var quick_move = 290;
    var right_banner_on = true;

    function _right_scrollbar(){
        var quick_menu = $('#ad_right_float');
        var pPosition = $(window).scrollTop();
        if (pPosition > quick_move){
        quick_menu.stop().animate( { "top": $(document).scrollTop() }, 700 );
    }else{
        quick_menu.stop().animate( { "top": quick_top + "px" }, 700 );
    }
    }

    $(document).ready(function(){
        $(window).scroll(function() {
            if (right_banner_on == true){
                _right_scrollbar();
            }
        });
    });


</script>