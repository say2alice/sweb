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
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
    <div id="adH_list">
    </div>
    <div id="list_main" >
        <div class="main_list">
            <h4 class="icon"><img src="/img/title-${category}.png" alt="개그"></h4>
            <ul class="list_ul3">
            <c:forEach items="${newsList.content}" var="newsList" varStatus="i">
                <li>
                    <a href="/view/${newsList.id}">
                        <div class="thumimg">
                            <img src="${newsList.image}">
                        </div>
                        <div class="title">
                            ${newsList.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(newsList.summary,0,39)}..."/>
                        </div>
                    </a>
                </li>
                <c:if test="${i.index eq 2}">
                    <%--<div class="ad_body"></div>--%>
                </c:if>
            </c:forEach>

                <%--<?$num++;}?>--%>
            </ul>
        </div>
        <!-- 페이지 -->
        <div class="pagination pg_wrap pg">
            <c:set var="size" value="${newsList.size}"/>
            <c:set var="totalPage" value="${newsList.totalPages - 1}"/>
            <c:set var="curPage" value="${newsList.number + 1}"/>
            <c:set var="limitPage" value="5"/>
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
        <%--<div class="ad_body"></div>--%>
        <div class="ad_body_res">
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- 막이슈 본문 반응형1 -->
            <ins class="adsbygoogle"
                 style="display:block; width:100%"
                 data-ad-client="ca-pub-2522869015643333"
                 data-ad-slot="6144672964"
                 data-ad-format="auto"></ins>
            <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
        </div>
    </div>

    <div id="aside" class="mgt10">
        <div class="best_news">
            <h4>베스트 이슈</h4>
            <ul class="list_ul3">
            <c:forEach items="${best}" var="best">
                <li>
                    <a href="/view/${best.id}">
                        <div class="thumimg">
                            <img src="${best.image}">
                        </div>
                        <div class="title">
                            ${best.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(best.summary,0,40)} . . ."/>
                        </div>
                    </a>
                </li>
            </c:forEach>
            </ul>
        </div>
        <div class="ad_body_res">
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- 막이슈 본문 반응형1 -->
            <ins class="adsbygoogle"
                 style="display:block; width:100%"
                 data-ad-client="ca-pub-2522869015643333"
                 data-ad-slot="9187916507"
                 data-ad-format="auto"></ins>
            <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
            </script>
        </div>
            <div class="best_news">
            <h4>최신 이슈</h4>
            <ul class="list_ul3">
            <c:forEach items="${recent}" var="recent">
                <li>
                    <a href="/view/${recent.id}">
                        <div class="thumimg">
                            <img src="${recent.image}">
                        </div>
                        <div class="title">
                                ${recent.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(recent.summary,0,40)} . . ."/>
                        </div>
                    </a>
                </li>
            </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>