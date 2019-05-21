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
<jsp:include page="head.jsp"></jsp:include>
<body>
<script>var from=document.referrer; document.write("<iframe src='http://www.dreamsearch.or.kr/servlet/iadbn?from="+escape(from)+"&u=2016111800004&us=8108&s=8823&psb=99' scrolling='no' frameborder=0 width=0 height=0></iframe>");</script>
<!--head fixed ad-->
<div class="top_ad">
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- 막이슈 상단 띠배너 320 x 50 -->
    <ins class="adsbygoogle"
         style="display:inline-block;width:320px;height:50px"
         data-ad-client="ca-pub-2522869015643333"
         data-ad-slot="5080343356"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
</div>
<!--foot fixed ad-->
<div class="bottom_ad"><script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8112&s=8827&bntype=51&cntad=1&cntsr=1&iwh=320_75&mChk=75' frameborder='0' scrolling='no' style='height:75px;width:100%';></iframe>");</script></div>
<div id="wrap">
    <div id="header">
        <div class="head_t" id="searchHead">
            <h1 class="s_logo" style="float: left"><a href="/"><img src="/img/m-logo@2x.png" alt="막이슈"></a></h1>
            <div class="input_wrap">
                <input type="text" id="text" value="${param.text}" placeholder="이슈검색"/>
                <span id="searchBtn2" class="search_btn btn2" style="position: absolute;left: 1px; text-align: left;top:8px" ><a href="#"><img src="/img/ic-search@2x.png" alt="검색"></a></span>
            </div>
        </div>
        <c:if test="${param.tab eq ''}">
            <div class="ad_H_50"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=3089879763"></script></div>
        </c:if>
        <div id="gnb">
            <div class="navi">
                <ul>
                    <li><a href="/issue/news" class="n1"><img src="/img/m-menu-01@2x.png"></a></li>
                    <li><a href="/gag/news" class="n2"><img src="/img/m-menu-02@2x.png"></a></li>
                    <li><a href="/video/news" class="n3"><img src="/img/m-menu-03@2x.png"></a></li>
                    <li><a href="/hot/news" class="n4"><img src="/img/m-menu-04@2x.png"></a></li>
                </ul>
            </div>
        </div>
    </div>
<div id="container">
    <div id="content">
        <div class="searched_text">"${param.text}"로 검색한 결과 ${list.totalElements}개를 찾았습니다.</div>
        <ul class="list_ul3">
        <c:forEach items="${list.content}" var="list">
            <li>
                <div class="thumimg">
                    <a href="/view/${list.id}">
                        <img src="${list.image}" alt="섬네일">
                    </a>
                </div>
                <div class="title">
                    <a href="/view/${list.id}">
                            ${fn:replace(fn:replace(list.subject, param.text, "<strong>temp</strong>"), "temp", param.text)}
                    </a>
                </div>
            </li>
        </c:forEach>
        </ul>
        <div class="pagination pg_wrap pg">
            <c:set var="size" value="${list.size}"/>
            <c:set var="totalPage" value="${list.totalPages > 0 ? list.totalPages - 1 : list.totalPages}"/>
            <c:set var="curPage" value="${list.number + 1}"/>
            <c:set var="limitPage" value="5"/>
            <fmt:parseNumber var="startValue" integerOnly="true" value="${ ( (curPage-1)/limitPage ) }"/>
            <fmt:parseNumber var="start" integerOnly="true" value="${ startValue * limitPage }"/>
            <c:set var="end" value="${start + limitPage}" />

            <c:choose>
                <c:when test="${start >= (limitPage-1)}">
                    <c:set var="prevPage" value="${(start - limitPage)}" />
                    <a href="${url}?text=${param.text}&page=${prevPage}&size=${size}" class="pg_page">이전</a>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${totalPage > limitPage }">
                    <c:if test="${totalPage < end}">
                        <c:set var="end" value="${totalPage+1}" />
                    </c:if>
                    <c:forEach var="i" begin="${start}" end="${end-1}" step="1">
                        <a href="search?text=${param.text}&page=${i}" class="pg_page <c:if test="${curPage == (i+1)}">pg_current</c:if>">${i+1}</a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="i" begin="0" end="${totalPage}" step="1">
                        <a href="search?text=${param.text}&page=${i}" class="pg_page <c:if test="${curPage == (i+1)}">pg_current</c:if>">${i+1}</a>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${totalPage > end}">
                    <c:set var="nextPage" value="${start + limitPage}" />
                    <a href="${url}?text=${param.text}&page=${nextPage}&size=${size}" class="pg_page">다음</a>
                </c:when>
            </c:choose>
        </div>
    </div>

    <div id="aside" class="mgt10">
        <div class="best_news">
            <h4>추천 컨텐츠</h4>
            <ul class="list_ul3">
                <c:forEach items="${recommend1}" var="recommend1">
                    <li>
                        <div class="thumimg">
                            <a href="/view/${recommend1.id}">
                                <img src="${recommend1.image}">
                            </a>
                        </div>
                        <div class="title">
                            <a href="/view/${recommend1.id}">
                                    ${recommend1.subject}
                            </a>
                        </div>
                    </li>
                </c:forEach>
                <script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8112&s=8827&bntype=51&cntad=1&cntsr=1&iwh=320_75&mChk=75' frameborder='0' scrolling='no' style='height:75px;width:100%';></iframe>");</script>
                <c:forEach items="${recommend2}" var="recommend2">
                    <li>
                        <div class="thumimg">
                            <a href="/view/${recommend2.id}">
                                <img src="${recommend2.image}" alt="섬네일">
                            </a>
                        </div>
                        <div class="title">
                            <a href="/view/${recommend2.id}" alt="섬네일">
                                    ${recommend2.subject}
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <%--<div class="ad_body"></div>--%>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>