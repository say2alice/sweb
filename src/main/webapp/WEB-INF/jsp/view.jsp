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
    <div id="content" class="mgt25">
        <div class="article" itemprop="articleBody">
            ${pageContext.request.contextPath}
            <h1>${news.subject}</h1>
            <div class="article_body">
                ${news.content}
            </div>
        </div>


        <!--페이스북-->
        <script>
            window.fbAsyncInit = function() {
                FB.init({
                    appId      : '1182934818449292',
                    xfbml      : true,
                    version    : 'v2.8'
                });
            };

            (function(d, s, id){
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ko_KR/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>

        <div class="fb-like" data-href="https://www.facebook.com/maakissue/" data-width="320" data-layout="standard" data-action="like" data-size="large" data-show-faces="false" data-share="false"></div>
        <div class="fb_share_bt mgt20" onclick="jShare('f',${news.id})"><img src="/img/pc/fb_logo.jpg" style="margin-right:5px;"> 공유하기</div>

        <div id="fb-root"></div>
        <div class="fb-comments" data-href="http://www.maak.kr/view/${news.id}" data-width="730" data-numposts="5"></div>
        <!--//페이스북-->
        <div class="ad_body" style="height: auto;">
            <div class="mgt20 mgb20">
                <c:if test="${param.bz == ''}">
                    <iframe  src="http://adv.imadrep.co.kr/3092_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
                </c:if>
                <c:if test="${param.bz != ''}">
                    <iframe  src="http://adv.imadrep.co.kr/2986_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
                </c:if>
            </div>
        </div>
        <div class="main_list mgt20">
            <div class="title_info">
                <h4 style="font-size:17px">추천 이슈</h4>
            </div>
            <ul class="list_ul5">
                <%--$image = get_list_thumbnail('news', $row['writer'], '264', '160');--%>
                <c:forEach items="${recent}" var="recent">
                <li class="mgr13">
                    <div class="thumimg">
                        <a href="/view/${recent.id}">
                            <img src="${recent.image}">
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

</div>

<div class="side">
    <div class="best_news border">
        <ul class="list_ul2">
            <c:forEach items="${recommend}" var="recommend" varStatus="s">
                <c:if test="${s.index eq 0 }">
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
                </c:if>
                <c:if test="${s.index eq 3 }">
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
                </c:if>
                <c:if test="${s.index eq 6 }">
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
                </c:if>
                <li>
                    <div class="thumimg">
                        <a href="/view/${recommend.id}">
                            <img src="${recommend.image}">
                            <p class="title">
                                    ${recommend.subject}
                            </p>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <c:if test="${param.bz == ''}">
        <iframe  src="http://adv.imadrep.co.kr/3093_01.html" title="광고" width="100%" height="250" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
    </c:if>
    <c:if test="${param.bz != ''}">
        <iframe  src="http://adv.imadrep.co.kr/2987_01.html" title="광고" width="100%" height="250" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
    </c:if>
    <%--<div class="best_news mgt20 border">--%>
        <%--<h4>최신 이슈</h4>--%>
        <%--<ul class="list_ul3">--%>
            <%--<c:forEach items="${recent}" var="recent">--%>
                <%--<li>--%>
                    <%--<div class="thumimg">--%>
                        <%--<a href="/view/${recent.id}">--%>
                            <%--<img src="${recent.image}">--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="title">--%>
                        <%--<a href="/view/${recent.id}">--%>
                                <%--${recent.subject}--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</c:forEach>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <%--<div id="aside_ad" class="mgt20"><iframe src="http://imp.mklaud.com/ad?id=3768" scrolling="no" border="0" marginWidth="0" marginHeight="0" frameBorder="0" width="100%" height="250"></iframe></div>--%>
</div>
</div>


<%--<div id="body_ad" class="mgt30" style="text-align:left;float:left;">--%>

<%--</div>--%>
</div>
<script>
    function jShare(snsType,newsID){
        var snsUrl = encodeURIComponent("http://www.maak.kr/view/"+newsID);
        //페이스북
        if(snsType=="f"){
            var href = 'http://www.facebook.com/sharer.php?u=' + snsUrl + '&t=';
            var a = window.open(href, 'facebook', 'width=650, height=356');
            if (a) {a.focus();}
        }
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>