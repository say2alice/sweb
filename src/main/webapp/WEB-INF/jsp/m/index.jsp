<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-02
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<jsp:include page="head.jsp"/>
<jsp:include page="header.jsp"/>
<html>
<div id="container">
    <div class="main_focus_area">
        <div class="bxslider">
            <c:forEach items="${main}" var="main">
                <a href="/view/${main.id}">
                    <div class="main_focus " style="background-image: url('${main.image}')">
                        <p class="title">
                                ${main.subject}
                                <%--<div class="main_hit">조회수 : ${main.hit}</div>--%>
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <!-- Dable 모바일_하단(썸6)_02 위젯 시작/ 문의 support@dable.io -->
    <div id="dablewidget_6o3VVPXZ" data-widget_id="6o3VVPXZ">
        <script>
            (function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
            dable('renderWidget', 'dablewidget_6o3VVPXZ');
        </script>
    </div>
    <!-- Dable 모바일_하단(썸6)_02 위젯 종료/ 문의 support@dable.io -->
    <div id="main">
        <div class="main_list">

            <ul class="list_ul1">
                <c:forEach items="${recent}" var="recent" varStatus="i">
                    <c:if test="${i.count == 7}">
                        <div class="ad_body2" style="height: auto;">
                            <c:if test="${param.bz == ''}">
                                <iframe  src="http://adv.imadrep.co.kr/3092_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
                            </c:if>
                            <c:if test="${param.bz != ''}">
                                <iframe  src="http://adv.imadrep.co.kr/2986_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
                            </c:if>
                        </div>
                    </c:if>
                    <li>
                        <a href="/view/${recent.id}">
                            <div class="thumimg">
                                <img src="${recent.image}">
                            </div>
                            <div class="title">
                                    ${recent.subject}
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <%--<div class="ad_body"></div>--%>
        <div id="_popIn_recommend_main"></div>
        <script type="text/javascript">

            (function() {

                var pa = document.createElement('script'); pa.type = 'text/javascript'; pa.charset = "utf-8"; pa.async = true;

                pa.src = window.location.protocol + "//api.popin.cc/searchbox/m_maak.js";

                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(pa, s);

            })();
        </script>
    </div>
    <script>
        $(document).ready(function() {
            $('.bxslider').bxSlider({
                mode: 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
                speed: 400, //default:500 이미지변환 속도
                auto: true, //default:false 자동 시작
                captions: true, // 이미지의 title 속성이 노출된다.
                pager: false,
                controls: false,
            });
        });
    </script>
    <jsp:include page="footer.jsp"></jsp:include>
</html>