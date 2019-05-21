<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-02
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<html>
<jsp:include page="head.jsp"></jsp:include>
<div id="wrap">
<div id="container">
    <div class="main_focus_area">
        <div class="best_news">
            <div class="border">
                <%--<h4><img src="/img/best.png"></h4>--%>
                <ul class="list_ul2">
                    <li>
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- 막이슈 본문 상단 300 x 250 -->
                        <ins class="adsbygoogle"
                             style="display:inline-block;width:300px;height:250px"
                             data-ad-client="ca-pub-2522869015643333"
                             data-ad-slot="1082701675"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </li>
                    <c:forEach items="${best}" var="best">
                        <li>
                            <div class="thumimg">
                                <a href="/view/${best.id}">
                                    <img src="${best.image}">
                                    <p class="title">
                                            ${best.subject}
                                    </p>
                                </a>

                            </div>

                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <%--<div id="adH_list">--%>
            <%--<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>--%>
            <%--<!-- 막이슈 728 X 90 상단 배너 PC용 -->--%>
            <%--<ins class="adsbygoogle"--%>
                 <%--style="display:inline-block;width:728px;height:90px"--%>
                 <%--data-ad-client="ca-pub-2522869015643333"--%>
                 <%--data-ad-slot="1091452298"></ins>--%>
            <%--<script>--%>
                <%--(adsbygoogle = window.adsbygoogle || []).push({});--%>
            <%--</script>--%>
        <%--</div>--%>
        <div class="slider">
            <div class="bxslider">
                <c:forEach items="${main}" var="main">
                <div class="main_focus">
                    <a href="/view/${main.id}">
                        <img src="${main.originImage}">
                        <p class="title">${main.subject}</p>
                            <%--<p class="count">${main.hit}</p>--%>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="main">
        <div class="main_list mgt20">
            <div class="title_info">
                <h4><img src="/img/pc/title_issue.png" alt="이슈"></h4>
                <div class="more">
                    <a href="/issue/news">+더보기</a>
                </div>
            </div>
            <ul class="list_ul1">
                <c:forEach items="${homeNews.issue}" var="issue">
                <li class="mgr14">
                    <div class="thumimg">
                        <a href="/view/${issue.id}">
                            <img src="${issue.image}">
                        </a>
                    </div>
                    <div class="title">
                        <a href="/view/${issue.id}">
                            ${issue.subject}
                        </a>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="main_list mgt20">
            <div class="title_info">
                <h4><img src="/img/pc/title_gag.png" alt="개그"></h4>
                <div class="more">
                    <a href="/gag/news">+더보기</a>
                </div>
            </div>
            <ul class="list_ul1">
                <c:forEach items="${homeNews.gag}" var="gag">
                    <li class="mgr14">
                        <div class="thumimg">
                            <a href="/view/${gag.id}">
                                <img src="${gag.image}">
                            </a>
                        </div>
                        <div class="title">
                            <a href="/view/${gag.id}">
                                    ${gag.subject}
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="main_list mgt20">
            <div class="title_info">
                <h4><img src="/img/pc/title_video.png" alt="영상"></h4>
                <div class="more">
                    <a href="/video/news">+더보기</a>
                </div>
            </div>
            <ul class="list_ul1">
                <c:forEach items="${homeNews.video}" var="video">
                    <li class="mgr14">
                        <div class="thumimg">
                            <a href="/view/${video.id}">
                                <img src="${video.image}">
                            </a>
                        </div>
                        <div class="title">
                            <a href="/view/${video.id}">
                                    ${video.subject}
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="main_list mgt20">
            <div class="title_info">
                <h4><img src="/img/pc/title_hot.png" alt="꿀팁"></h4>
                <div class="more">
                    <a href="/hot/news">+더보기</a>
                </div>
            </div>
            <ul class="list_ul1 non_line">
                <c:forEach items="${homeNews.hot}" var="hot">
                    <li class="mgr14">
                        <div class="thumimg">
                            <a href="/view/${hot.id}">
                                <img src="${hot.image}">
                            </a>
                        </div>
                        <div class="title">
                            <a href="/view/${hot.id}">
                                    ${hot.subject}
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>

    </div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('.bxslider').bxSlider({
            mode: 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
            speed: 200, //default:500 이미지변환 속도
            auto: true, //default:false 자동 시작
            pager: false,
            controls: false
        });
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>