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
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
    <div id="adH_list">
    </div>
    <div id="list_main" >
        <div class="main_list">
            <h4 class="icon"><div class="recent">최신 이슈</div></h4>
            <ul class="list_ul3">
            <c:forEach items="${recent}" var="recent">
                <li>
                    <a href="/view/${recent.id}">
                        <div class="thumimg">
                            <img src="${recent.image}" alt="섬네일">
                        </div>
                        <div class="title">
                            ${recent.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(recent.summary,0,39)}..."/>
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
        <script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8112&s=8827&bntype=51&cntad=1&cntsr=1&iwh=320_75&mChk=75' frameborder='0' scrolling='no' style='height:75px;width:100%';></iframe>");</script>
    </div>

    <div id="aside" class="mgt10">
        <div class="best_news">
            <h4>추천 이슈</h4>
            <ul class="list_ul3">
            <c:forEach items="${recommend}" var="recommend">
                <li>
                    <a href="/view/${recommend.id}">
                        <div class="thumimg">
                            <img src="${recommend.image}" alt="섬네일">
                        </div>
                        <div class="title">
                            ${recommend.subject}
                        </div>
                        <div class="summ">
                            <c:out value="${fn:substring(recommend.summary,0,40)} . . ."/>
                        </div>
                    </a>
                </li>
            </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
