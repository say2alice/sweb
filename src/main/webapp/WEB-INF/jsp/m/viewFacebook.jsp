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
<head>
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-store">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="Expires" content="0">
    <meta name="viewport" content="width=device-width">
    <meta name="description" content="지금 막 올라온 이슈들을 확인하세요<c:if test="${news != null}"> - ${news.subject}</c:if>">
    <meta property="fb:app_id"           content="1182934818449292" />
    <meta property="og:url"           content="www.maak.kr" />
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="${news.subject}" />
    <meta property="og:description" content="<c:out value='${fn:substring(news.summary,0,120)} . . .'/>"/>
    <meta property="og:image"         content="${news.originImage}" />
    <meta property="fb:app_id"           content="1182934818449292" />
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

    <title>막이슈<c:if test="${news != null}"> - ${news.subject}</c:if></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/m/style.css">
    <link rel="stylesheet" href="/css/drawer.min.css">
    <link rel="shortcut icon" href="/img/pc/icon.ico"/>
    <link href="/css/jquery.bxslider.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/drawer.min.js"></script>
    <script src="/js/jquery.bxslider.js"></script>
    <script src="/js/kakao.min.js"></script>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-88252176-2', 'auto');
        ga('send', 'pageview');

    </script>
</head>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-3668296972466994",
        enable_page_level_ads: true
    });
</script>
<jsp:include page="header.jsp"></jsp:include>

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
                <div class="ad_body2">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- 막이슈 본문 상단 300 x 250 -->
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:300px;height:250px"
                         data-ad-client="ca-pub-2522869015643333"
                         data-ad-slot="1082701675"></ins>
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

        <!--페이스북 댓글-->
        <div id="fb-ro ot"></div>
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


        <!--//페이스북-->
        <div class="ad_body2" style="height: auto;"><iframe src="http://adv.imadrep.co.kr/2208_01.html" width="100%" height="145" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></div>
        <iframe src="http://adv.imadrep.co.kr/2207_01.html" width="100%" height="240" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
        <div class="ad_H_50"><iframe src="http://imp.mklaud.com/ad?id=3817" scrolling="no" border="0" marginWidth="0" marginHeight="0" frameBorder="0" width="320" height="50"></iframe></div>
        <%--<div class="ad_body"></div>--%>

        <!--페이스북 공유-->
        <div class="sns_box mgt20">
            <div class="fb_share_bt" onclick="jShare('f','${id}')"><img src="/img/pc/fb_logo.jpg" style="margin-right:5px;"> 공유하기</div>

            <%--<a id="kakao-link-btn" class="kakao_share_bt" href="javascript:;">--%>
            <%--<img src="//dev.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/> 공유하기--%>
            <%--</a>--%>
        </div>
        <div class="ac">
        </div>

        <div class="mgt20 mgb20"><iframe src="http://adv.imadrep.co.kr/2305_01.html" width="100%" height="285" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" SCROLLING="no"></iframe></div>
    </div>
    <div class="ad_body">
        <script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8261&s=8974&cntad=1&cntsr=2&iwh=300_250&bntype=42' frameborder='0' scrolling='no' style='height:250px; width:300px;'></iframe>");</script>
    </div>
</div>

<div id="aside" class="mgt10">
    <div class="best_news">
        <h4>추천 이슈</h4>
        <ul class="list_ul3">
            <%--$thumb = get_list_thumbnail('news', $row['writer'], '264', '160');--%>
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
<div class="ad_body"><iframe src="http://imp.mklaud.com/ad?id=3768" scrolling="no" border="0" marginWidth="0" marginHeight="0" frameBorder="0" width="100%" height="250"></iframe></div>
<%--<div class="ad_body"></div>--%>
<div id="aside" class="pgb20 mgt10">
    <div class="best_news">
        <h4>베스트 이슈</h4>
        <ul class="list_ul3">
            <c:forEach items="${best}" var="best">
                <li>
                    <a href="/view/${best.id}">
                        <div class="thumimg">
                            <img src="${best.image}" alt="섬네일">
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
</div>
<div class="pgb20"><script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8111&s=8826&cntad=3&cntsr=1&iwh=320_50&bntype=7' frameborder='0' scrolling='no' style='height:50px; width:100%'></iframe>");</script></div>
<c:if test="${param.bz != ''}">
    <script type="text/javascript" >
        var sv_u_idx = [10,772,2247,303];
        var ref=document.referrer;
        var initPrimeAd={mCode:"655"};
        var from=document.referrer;
        var enliple_addScript = function(fileSrc) {
            var head = document.getElementsByTagName('head')[0];
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = fileSrc;
            head.appendChild(script);
        };

        var enliple_path = 'http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from='+escape(from)+'&u=2016111800005&us=8110&s=8825&types=ico_m&bCover=true';
        var enliple_lib_path =  'http://img.mobon.net/js/elpBackUnder.js';
        var enliple_lib_path1 =  'http://code.jquery.com/jquery-1.10.1.min.js';
        var enliple_lib_path2 =  'http://img.mobon.net/js/jquery.mobile.custom.min.js';
        var enliple_lib_path3 =  'http://simg.imadrep.co.kr/js/sv.min-3.js';
        var enliple_lib_path4 =  'http://script.theprimead.co.kr/js/primeBridge.js';

        enliple_addScript(enliple_lib_path1);
        enliple_addScript(enliple_lib_path2);
        enliple_addScript(enliple_lib_path3);
        enliple_addScript(enliple_lib_path4);
        enliple_addScript(enliple_lib_path);
        enliple_addScript(enliple_path);
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
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?u=2016111800005&us=8714&s=9425&mode=script"></script>
<%--<!-- SmartIcon -->--%>
<%--<script type="text/javascript">--%>
<%--var tpmn_iconad_params = {--%>
<%--publisherID : "ADSQ",--%>
<%--inventoryID : "2246"--%>
<%--};--%>
<%--</script>--%>
<%--<script type="text/javascript" src="http://static.tpmn.co.kr/sf/v2/smart.icon.ad.js"></script>--%>
<%--<!-- SmartIcon -->--%>

<!-- Adtive 광고 표현부 -->
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
</body>
</html>