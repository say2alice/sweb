<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-03
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="head.jsp"></jsp:include>
<div id="wrap">
<div id="container">
    <div id="list_main">
        <div class="main_list mgt20">
            <div id="adH_list">
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- 막이슈 728 X 90 상단 배너 PC용 -->
                <ins class="adsbygoogle"
                     style="display:inline-block;width:728px;height:90px"
                     data-ad-client="ca-pub-2522869015643333"
                     data-ad-slot="1091452298"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            </div>
            <div class="title_info">
                <h4><img src="/img/pc/title_${category}.png" alt="카테고리제목"></h4>
            </div>
            <ul class="list_ul4">
            <c:forEach items="${newsList.content}" var="newsList">
                <li>
                    <a href="/view/${newsList.id}">
                        <div class="thumimg">
                            <img src="${newsList.image}" alt="이미지">
                        </div>
                        <div class="title">
                            ${newsList.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(newsList.summary,0,120)} . . ."/>
                        </div>
                    </a>
                </li>
            </c:forEach>
            </ul>
        </div>
        <!-- 페이지 -->
        <div class="pagination pg_wrap pg">
            <c:set var="size" value="${newsList.size}"/>
            <c:set var="totalPage" value="${newsList.totalPages - 1}"/>
            <c:set var="curPage" value="${newsList.number + 1}"/>
            <c:set var="limitPage" value="10"/>
            <fmt:parseNumber var="startValue" integerOnly="true" value="${ ( (curPage-1)/limitPage ) }"/>
            <fmt:parseNumber var="start" integerOnly="true" value="${ startValue * limitPage }"/>
            <c:set var="end" value="${start + limitPage}" />

            <c:choose>
                <c:when test="${start >= (limitPage-1)}">
                    <c:set var="prevPage" value="${(start - limitPage)}" />
                    <a href="${url}?page=${prevPage}&size=${size}" class="pg_page">이전</a>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${totalPage > limitPage }">
                    <c:if test="${totalPage < end}">
                        <c:set var="end" value="${totalPage+1}" />
                    </c:if>
                    <c:forEach var="i" begin="${start}" end="${end-1}" step="1">
                        <a href="news?page=${i}" class="pg_page <c:if test="${curPage == (i+1)}">pg_current</c:if>">${i+1}</a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="i" begin="0" end="${totalPage}" step="1">
                        <a href="news?page=${i}" class="pg_page <c:if test="${curPage == (i+1)}">pg_current</c:if>">${i+1}</a>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${totalPage > end}">
                    <c:set var="nextPage" value="${start + limitPage}" />
                    <a href="${url}?page=${nextPage}&size=${size}" class="pg_page">다음</a>
                </c:when>
            </c:choose>
        </div>
        <%--<div id="ad">--%>

            <%--&lt;%&ndash;<SCRIPT type='text/javascript' src='http://rsense-ad.realclick.co.kr/rsense/rsense_ad.js?rid=491652383509&stamp=1475209850&v_method=YmFubmVyfDcyOHg5MA' charset='euc-kr'></SCRIPT>&ndash;%&gt;--%>
        <%--</div>--%>
    </div>

    <div id="aside">
        <div class="best_news border">
            <h4>베스트 이슈</h4>
            <ul class="list_ul3">
            <c:forEach items="${best}" var="best">
                <li>
                    <div class="thumimg">
                        <a href="/view/${best.id}">
                            <img src="${best.image}" alt="섬네일">
                        </a>
                    </div>
                    <div class="title">
                        <a href="/view/${best.id}">
                            ${best.subject}
                        </a>
                    </div>
                </li>
            </c:forEach>
            </ul>
        </div>
        <%--<div id="aside_ad" class="mgt20">--%>

        <%--</div>--%>
        <div class="best_news mgt20 border">
            <h4>최신 이슈</h4>
            <ul class="list_ul3">
            <c:forEach items="${recent}" var="recent">
                <li>
                    <div class="thumimg">
                        <a href="/view/${recent.id}">
                            <img src="${recent.image}" alt="섬네일">
                        </a>
                    </div>
                    <div class="title">
                        <a href="/view/${recent.id}">
                            ${recent.subject}
                        </a>
                    </div>
                </li>
            </c:forEach>
            </ul>
        </div>
        <div id="aside_ad" class="mgt20"><iframe src="http://imp.mklaud.com/ad?id=3768" scrolling="no" border="0" marginWidth="0" marginHeight="0" frameBorder="0" width="100%" height="250"></iframe></div>
    </div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
