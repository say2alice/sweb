<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-08
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="footer_main">
</div>
<div id="footer">
    <div id="footer_corp">
        <li><a href="http://petaz.co.kr/#contact">제휴하기 | 문의하기</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/policy/privacy">개인정보 취급 방침</a> | <a href="/policy/service">이용약관</a></li>
        <li><span class="copyright">막이슈 | COPYRIGHT © 2016 MAAKISSUE. ALL RIGHTS RESERVED</span></li>
    </div>
</div>
<!-- SmartIcon -->
<script>
    $(document).ready(function() {
        $('.drawer').drawer();
    });
    $(".logo img").on("click", function(){
        $(this).animate({'width':'76px'},100);
        $(this).animate({'width':'86.7px'},100).queue(function(){
            $(location).delay(300).attr("href","/");
        });
    });
    $(".search_btn").on("click", function (){
        $("#defaultHead").hide();
        $("#searchHead").css("float", "" );
        $("#searchHead").fadeIn(500);
    });
    $("#searchBtn2").on("click", function(){
        $(location).attr("href","/search?text="+$("#text").val());
    });
    $('.input_wrap input').live('keypress', function(e) {
        if (e.which == 13) {/* 13 == enter key@ascii */
            $(location).attr("href","/search?text="+$("#text").val());
        }
    });
    $(".drawer-nav").load("/navigation", function(){});
</script>
<script type="text/javascript" src="http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?u=2016111800005&us=8714&s=9425&mode=script"></script>