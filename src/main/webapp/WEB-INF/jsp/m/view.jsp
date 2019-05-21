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
<meta property="fb:app_id"           content="1182934818449292" />
<meta property="fb:pages" content="1635011180125871" />
<meta property="og:url"           content="http://www.maak.kr/view/${news.id}" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="${news.subject}" />
<meta property="og:description" content="<c:out value='${fn:substring(news.summary,0,120)} . . .'/>"/>
<meta property="og:image"         content="${news.originImage}" />
<meta property="dable:item_id"           content="${news.id}" />
<meta property="dable:author"           content="${news.writer}"/>
<meta property="article:section"           content="${news.category}" />
<meta property="article:published_time"           content='<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ss'Z'" value="${news.regiDate}" />'/>
<meta name="subject" content="${news.subject}">
<div id="container">
    <div id="content" >
        <div class="article"  itemprop="articleBody">
            <%--<div class="hit"><strong>${news.hit}</strong> 명이 봤어요</div>--%>
            <h1>${news.subject}</h1>
            <div class="share_wrap"><div class="g_translate" id="google_translate_element"></div>
                <script type="text/javascript">
                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({pageLanguage: 'ko', includedLanguages: 'en,ja,ko,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-88252176-1'}, 'google_translate_element');
                    }
                </script>
                <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                <img src="/img/pc/share_icon_s.png" usemap="#share" alt="소셜">
                <map name="share">
                    <area shape="rect" coords="0,0,34,35" href="javascript:shareLink('FACEBOOK')" target="_blank">
                    <area shape="rect" coords="36,0,70,35" href="javascript:shareLink('TWITTER')" target="_blank">
                    <area shape="rect" coords="72,0,106,35" href="javascript:shareLink('KAKAOSTORY')" target="_blank">
                    <area shape="rect" coords="108,0,142,35" href="javascript:shareLink('LINE')" target="_blank">
                    <area shape="rect" coords="144,0,180,35" href="javascript:sendLink()" target="_blank" id="kakao-link-btn">
                    <area shape="rect" coords="182,0,217,35" href="javascript:shareLink('NAVER')" target="_blank">
                </map>
            </div>
            <div class="fb-like" data-href="https://www.facebook.com/maakissue/" data-width="320" data-layout="standard" data-action="like" data-size="large" data-show-faces="false" data-share="false"></div>
            <div class="content_thumb"><img src="${news.image}" alt="섬네일"/></div>
            <div class="ad_body_res">
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- 막이슈 본문 반응형3 -->
                <ins class="adsbygoogle"
                style="display:block; width:100%"
                data-ad-client="ca-pub-2522869015643333"
                data-ad-slot="7137178678"
                data-ad-format="auto"></ins>
                <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            </div>
            <div class="article_body">
                ${news.content}
            </div>
            <div class="share_wrap_2">
                <img src="/img/pc/share_icon.png" usemap="#share2" alt="소셜">
                <map name="share2">
                    <area shape="rect" coords="0,0,50,50" href="javascript:shareLink('FACEBOOK')" target="_blank">
                    <area shape="rect" coords="55,0,105,50" href="javascript:shareLink('TWITTER')" target="_blank">
                    <area shape="rect" coords="110,0,160,50" href="javascript:shareLink('KAKAOSTORY')" target="_blank">
                    <area shape="rect" coords="165,0,170,50" href="javascript:shareLink('LINE')" target="_blank">
                    <area shape="rect" coords="220,0,270,50" href="javascript:sendLink()" target="_blank">
                    <area shape="rect" coords="275,0,320,50" href="javascript:shareLink('NAVER')" target="_blank">
                </map>
            </div>
        </div>
        <div class="ad_body2" style="height: auto;">
            <c:if test="${param.bz == ''}">
                <iframe  src="http://adv.imadrep.co.kr/3092_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
            </c:if>
            <c:if test="${param.bz != ''}">
                <iframe  src="http://adv.imadrep.co.kr/2986_01.html" title="광고" width="100%" height="240" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
            </c:if>
        </div>

        <div class="sns_box mgt20">
            <div class="fb_share_bt" onclick="jShare('f','${id}')"><img src="/img/pc/fb_logo.jpg" style="margin-right:5px;"> 공유하기</div>
        </div>
        <!--페이스북 댓글-->
        <div id="fb-root"></div>
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
        <div class="fb-comments" data-href="http://www.maak.kr/view/${news.id}" data-width="730" data-numposts="5"></div>
        <div class="ad_body2" style="height: auto;">
            <c:if test="${param.bz == ''}">
                <iframe  src="http://adv.imadrep.co.kr/3093_01.html" title="광고" width="100%" height="250" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
            </c:if>
            <c:if test="${param.bz != ''}">
                <iframe  src="http://adv.imadrep.co.kr/2987_01.html" title="광고" width="100%" height="250" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>
            </c:if>
        </div>
        <div class="ad_body">
            <c:if test="${param.bz == ''}">
                <script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8261&s=8974&cntad=1&cntsr=2&iwh=300_250&bntype=42' frameborder='0' scrolling='no' style='height:250px; width:300px;'></iframe>");</script>
            </c:if>
            <c:if test="${param.bz != ''}">
                <script type="text/javascript" src="//cdn.interworksmedia.co.kr/js/media/maak/mo/ainterplay_300_250.js"></script>
            </c:if>
        </div>
        <div id="_popIn_recommend"></div>
    </div>


    <div class="ad_body_res">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 본문 반응형2 -->
        <ins class="adsbygoogle"
             style="display:block; width:100%"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="9187916507"
             data-ad-format="auto"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
    <script type="text/javascript">

        (function() {

            var pa = document.createElement('script'); pa.type = 'text/javascript'; pa.charset = "utf-8"; pa.async = true;

            pa.src = window.location.protocol + "//api.popin.cc/searchbox/m_maak.js";

            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(pa, s);

        })();

    </script>
        <div id="dablewidget_x7y6G4l6" data-widget_id="x7y6G4l6">
            <script>
                (function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
                dable('renderWidget', 'dablewidget_x7y6G4l6');
            </script>
        </div>
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
    <%--<div class="ad_body"></div>--%>
    <div class="issue_div">
        <div class="best_news">
            <h4>베스트 이슈</h4>
            <ul class="list_ul1">
                <c:forEach items="${best}" var="best">
                    <li>
                        <a href="/view/${best.id}">
                            <div class="thumimg">
                                <img src="${best.image}" alt="섬네일">
                            </div>
                            <div class="title">
                                    ${best.subject}
                            </div>
                            <%--<div class="summ">--%>
                                <%--<c:out value="${fn:substring(best.summary,0,40)} . . ."/>--%>
                            <%--</div>--%>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="ad_body_res">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 본문 반응형4 -->
        <ins class="adsbygoogle"
             style="display:block; width:100%"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="9132964230"
             data-ad-format="auto"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
    <div class="issue_div mgt10">
        <div class="best_news">
            <h4>추천 이슈</h4>
            <ul class="list_ul1">
                <%--$thumb = get_list_thumbnail('news', $row['writer'], '264', '160');--%>
                <c:forEach items="${recommend}" var="recommend" varStatus="s">
                    <c:if test="${s.index lt 6}">
                    <li>
                        <a href="/view/${recommend.id}">
                            <div class="thumimg">
                                <img src="${recommend.image}" alt="섬네일">
                            </div>
                            <div class="title">
                                    ${recommend.subject}
                            </div>
                            <%--<div class="summ">--%>
                                <%--<c:out value="${fn:substring(recommend.summary,0,40)} . . ."/>--%>
                            <%--</div>--%>
                        </a>
                    </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>


<c:if test="${param.bz != ''}">

<script type="text/javascript" >

//    var generateRandom = function (min, max) {
//        var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
//        return ranNum;
//    }
//    var sv_u_idx = [10,772,2247,303];
//    var ref=document.referrer;
//    var initPrimeAd={mCode:"655"};
//    var from=document.referrer;
//    var enliple_addScript = function(fileSrc) {
//        var head = document.getElementsByTagName('head')[0];
//        var script = document.createElement('script');
//        script.type = 'text/javascript';
//        script.src = fileSrc;
//        head.appendChild(script);
//    };
//
//    var enliple_path = 'http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from='+escape(from)+'&u=2016111800005&us=8110&s=8825&types=ico_m&bCover=true';
//    var enliple_lib_path =  'http://img.mobon.net/js/elpBackUnder.js';
//    var enliple_lib_path1 =  'http://code.jquery.com/jquery-1.10.1.min.js';
//    var enliple_lib_path2 =  'http://img.mobon.net/js/jquery.mobile.custom.min.js';
//    var enliple_lib_path4 =  'http://script.theprimead.co.kr/js/primeBridge.js';
//
//    var enliple_lib_path3 =  'http://simg.imadrep.co.kr/js/sv.min-3.js';
//
//    enliple_addScript(enliple_lib_path1);
//    enliple_addScript(enliple_lib_path2);
//    enliple_addScript(enliple_lib_path);
//    enliple_addScript(enliple_path);
//    enliple_addScript(enliple_lib_path4);

    if(${param.bz != ''}) {

        $(document).ready(function () {
//            var nan = generateRandom(0,1);
//            if(nan == 1) enliple_addScript(enliple_lib_path3);
//            console.log(nan);
//            if(nan == 0){
                if (window.history && window.history.pushState) {

                    $(window).on('popstate', function() {
                        var hashLocation = location.hash;
                        var hashSplit = hashLocation.split("#!/");
                        var hashName = hashSplit[1];

                        if (hashName !== '') {
                            console.log("yeah?")
                            var hash = window.location.hash;
                            window.location.href="https://www.minimon.com";
                        }
                    });

                    window.history.pushState('forward', null, '#buff');
                }
//            }
        })
    }

</script>
</c:if>
    <script>
        function jShare(snsType,id){
            var snsUrl = encodeURIComponent("http://maak.kr/view/"+id);
            //페이스북
            if(snsType=="f"){
                var href = 'http://www.facebook.com/sharer.php?u=' + snsUrl + '&t=';
                var a = window.open(href, 'facebook', 'width=650, height=356');
                if (a) {a.focus();}
            }
        }
    </script>


</div>
<script>
    function shareLink(link){
        var getUrl = encodeURIComponent($(location).attr("href"));
        var title = "${news.subject}";
        console.log(getUrl);
        if(link == "FACEBOOK") {
            jShare('f','${id}');
        } else if(link == "TWITTER"){
            var url = "https://twitter.com/intent/tweet?text=" + title + "&url=" + getUrl;
            window.open(url, "_blank", "menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600");
        } else if(link == "LINE") {
            var url = "http://line.me/R/msg/text/?" +  title;
            window.open(url, '_blank', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');
        } else if(link == "KAKAOSTORY"){
            var url = 'https://story.kakao.com/s/share?url=' + getUrl;
            window.open(url, '_blank', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');
        } else if(link == "NAVER") {
            var url = 'http://share.naver.com/web/shareView.nhn?url=' + getUrl + '&title=' + title;
            window.open(url, '_blank', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
        }
    }
</script>

<script src="/js/kakao.min.js"></script>
<script>
    Kakao.init('c00d8dbd6befd6e0165aa1067af405ec');

    function sendLink() {

        var title = "${news.subject}";
        var img = "${news.image}";

        Kakao.Link.sendTalkLink({
            label: title,
            image: { src: img, width: '300', height: '200'},
            webButton: { text: '자세히 보기', url : $(location).attr('href')},
            fail: checkMobile()
        });
    }
    function checkMobile(){
        var filter = "win16|win32|win64|mac|macintel";
        if ( navigator.platform  ) {
            if ( filter.indexOf( navigator.platform.toLowerCase() ) >= 0 ) {
                alert("모바일에서만 가능합니닼");
            }
        }
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
