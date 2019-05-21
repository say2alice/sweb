<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-08
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navigation">
    <ul>
        <a href="/issue/news"><li class="issue">이 슈</li></a>
        <a href="/gag/news"><li class="gag">개 그</li></a>
        <a href="/video/news"><li class="video">영 상</li></a>
        <a href="/hot/news"><li class="hot">불 금</li></a>
    </ul>
    <p></p>
    <ul>
        <a href="/best"><li class="best">베스트 이슈</li></a>
        <a href="/recent"><li class="recent">최신 이슈</li></a>
    </ul>
    <p></p>
    <ul class="s_ul">
        <a href="http://petaz.co.kr/#contact"><li>제휴문의</li></a>
        <a href="/policy/privacy"><li>개인정보 취급 방침</li></a>
        <a href="/policy/service"><li>이용약관</li></a>
    </ul>
    <c:if test="${view ne null}">
    <ul class="f_ul">
        <div class="float_right" id="google_translate_element"></div>
        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({pageLanguage: 'ko', includedLanguages: 'en,ja,ko,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-88252176-1'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    </ul>
    </c:if>
</div>