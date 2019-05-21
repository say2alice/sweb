<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>막이슈<c:if test="${news != null}"> - ${news.subject}</c:if></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/m/style.css">
    <link rel="shortcut icon" href="/img/pc/icon.ico"/>
    <link rel="stylesheet" href="/css/drawer.min.css">
    <link href="/css/jquery.bxslider.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.1.3/iscroll.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/drawer.min.js"></script>
    <script src="/js/googleAnalytics.js"></script>
    <script src="/js/jquery.bxslider.js"></script>
    <script src="/js/kakao.min.js"></script>

</head>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-3668296972466994",
        enable_page_level_ads: true
    });
</script>

<body class="drawer drawer--left">
<!--head fixed ad-->
<div class="top_ad"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=4227499998"></script></div>
<!--foot fixed ad-->
<div id="wrap">
    <div id="header">
        <div class="head_t" id="searchHead" style="float: right;display: none;">
            <h1 class="s_logo" style="float: left"><a href="/"><img src="/img/m-logo@2x.png" alt="막이슈"></a></h1>
            <div class="input_wrap">
                <input type="text" id="text" value="${param.text}" placeholder="이슈검색"/>
                <span id="searchBtn2" class="search_btn btn2" style="position: absolute;left: 1px; text-align: left;top:8px" ><a href="#"><img src="/img/ic-search@2x.png" alt="검색"></a></span>
            </div>
        </div>
        <div class="head_t" id="defaultHead">
            <div class="drawer-toggle drawer-hamburger"><img src="/img/ic-menu@2x.png" alt="메뉴"></div>
            <div id="searchBtn" class="search_btn"><img src="/img/ic-search@2x.png" alt="검색"></div>
            <h1 class="logo">
                <a href="#">
                    <img src="/img/m-logo@2x.png" alt="막이슈">
                </a>
            </h1>
            <nav class="drawer-nav" role="navigation">
                <li><a class="drawer-brand" href=""></a></li>
            </nav>
        </div>
        <c:if test="${param.tab eq ''}">
            <div class="ad_H_100"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=3089879763"></script></div>
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
    <div id="content" >
        <div class="article">
            <div class="ad_body2"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=750318366"></script></div>
            <%--<div class="hit"><strong>${news.hit}</strong> 명이 봤어요</div>--%>
            <div class="fb-like" data-href="https://www.facebook.com/maakissue/" data-width="320" data-layout="standard" data-action="like" data-size="large" data-show-faces="false" data-share="false"></div>
            <h1>${news.subject}</h1>
            <div class="ad_body2"><iframe width="300" height="250" src="http://ad.ad4989.co.kr/cgi-bin/PelicanC.dll?impr?pageid=03uH&out=iframe" allowTransparency = "true" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe></div>
            <div class="ad_body2"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=1786269830"></script></div>
            <div class="article_body">
                ${news.content}
                    <div class="ad_body2" style="height: auto;"><iframe src="http://adv.imadrep.co.kr/2208_01.html" width="100%" height="145" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></div>
                    <iframe src="http://adv.imadrep.co.kr/2207_01.html" width="100%" height="240" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                <div class="ad_body2"><script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016122100013&us=8332&s=9043&cntad=1&cntsr=2&iwh=300_250&bntype=42' frameborder='0' scrolling='no' style='height:250px; width:300px;'></iframe>");</script></div>
            </div>
            <div class="ad_body2"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=3969643150"></script></div>
        </div>
        <div id="mmaDisplay001">
            <script src="http://image.cauly.co.kr/websdk/common/lasted/ads.js"></script>
            <script>
                new CaulyAds({app_code:"2nNEmoHE",placement:1,displayid:"mmaDisplay001",
                    success:function(){/* 광고노출 성공 callback*/},
                    passback:function(){
                        var mmaIframe = document.createElement("iframe");
                        mmaIframe.src = "http://www.mediamixad.com/ad/webad?code=631110330";
                        mmaIframe.setAttribute("scrolling" , "no");
                        mmaIframe.setAttribute("marginheight" , "0");
                        mmaIframe.setAttribute("marginwidth" , "0");
                        mmaIframe.setAttribute("frameborder" , "0");
                        mmaIframe.setAttribute("frameborder" , "0");
                        mmaIframe.setAttribute("height" , "100");
                        mmaIframe.setAttribute("width" , "100%");
                        document.getElementById("mmaDisplay001").appendChild(mmaIframe );
                    }});</script>
        </div>

        <!--페이스북 공유-->
        <div class="sns_box mgt30">
            <div class="fb_share_bt" onclick="jShare('f','${id}')"><img src="/img/pc/fb_logo.jpg" style="margin-right:5px;"> 공유하기</div>
        </div>
        <iframe width="100%" height="80px" src="http://adexpert.ad4989.co.kr/cgi-bin/PelicanC.dll?impr?pageid=042D&out=iframe" allowTransparency = "true" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe>
        <div class="ad_body2"><script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=2332802922"></script></div>
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
        <!--//페이스북-->
        <div class="mgt20 mgb20"><iframe src="http://adv.imadrep.co.kr/2305_01.html" width="100%" height="285" border="0" frameborder="0" framemargin="0" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" SCROLLING="no"></iframe></div>
    </div>
    <iframe width="100%" height="80px" src="http://adexpert.ad4989.co.kr/cgi-bin/PelicanC.dll?impr?pageid=042D&out=iframe" allowTransparency = "true" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe>
</div>
<div id="aside" class="mgt10">
    <div class="ad_body2"><iframe width="300" height="250" src="http://ad.ad4989.co.kr/cgi-bin/PelicanC.dll?impr?pageid=03uI&out=iframe" allowTransparency = "true" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe></div>
    <div class="best_news">
        <h4>추천 이슈</h4>
        <ul class="list_ul3">
                <%--$thumb = get_list_thumbnail('news', $row['writer'], '264', '160');--%>
                <c:forEach items="${recommend}" var="recommend">
                <li>
                    <a href="/view/${recommend.id}">
                        <div class="thumimg">
                            <img src="${recommend.image}">
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
    <div id="mmaDisplay002">
        <script src="http://image.cauly.co.kr/websdk/common/lasted/ads.js"></script>
        <script>
            new CaulyAds({app_code:"C4aPM47A",placement:1,displayid:"mmaDisplay002",
                success:function(){/* 광고노출 성공 callback*/},
                passback:function(){
                    var mmaIframe = document.createElement("iframe");
                    mmaIframe.src = "http://www.mediamixad.com/ad/webad?code=1494411293";
                    mmaIframe.setAttribute("scrolling" , "no");
                    mmaIframe.setAttribute("marginheight" , "0");
                    mmaIframe.setAttribute("marginwidth" , "0");
                    mmaIframe.setAttribute("frameborder" , "0");
                    mmaIframe.setAttribute("frameborder" , "0");
                    mmaIframe.setAttribute("height" , "250");
                    mmaIframe.setAttribute("width" , "100%");
                    document.getElementById("mmaDisplay002").appendChild(mmaIframe );
                }});</script>
        </div>
    </div>
    </div>
    <%--<div class="ad_body"></div>--%>
    <div id="aside" class="pgb40 mgt10">
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
</div>
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
    <c:if test="${tab eq 'tab'}">
    <script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=3579629907"></script>
    <script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=2508744859"></script>
    <script type="text/javascript" src="http://www.mediamixad.com/ad/webad?code=2104228623"></script>
    <div id="mmaDisplay003">
        <script src="http://image.cauly.co.kr/websdk/common/lasted/ads.js"></script>
        <script>
            new CaulyAds({app_code:" bkT3qgPQ ",placement:1,displayid:"mmaDisplay003",
                success:function(){/* 광고노출 성공 callback*/},
                passback:function(){
                    /* 패스백 설정 구간 */
                }});</script>
    </div>
    <script src="http://nscreen.neoebiz.co.kr/xJqScreen.php?data=maak_m&pburl=http%3a%2f%2fwww.mediamixad.com%2fad%2fwebad%3fcode%3d2610411581&pbtype=2"></script>
    </c:if>
<%--//ads--%>
    <div id="footer_main">
    </div>

    <div id="footer">
        <div id="footer_corp">
            <li><a href="http://petaz.co.kr/#contact">제휴하기 | 문의하기</a></li>
            <li><span class="copyright">막이슈 | COPYRIGHT © 2016 MACISSUE. ALL RIGHTS RESERVED</span></li>
        </div>
    </div>
    <script type="text/javascript">
        var initPrimeAd={mCode:"594"};
    </script>
    <script src="http://script.theprimead.co.kr/js/primeBridge.js"></script>
</body>
<c:if test="${tab eq 'tab'}">
<script type="text/javascript">
    var s3dpop_position = ""; //static or relative or absolute or fixed
    var s3dpop_left = "";	//단위 pixel
    var s3dpop_bottom = "";	//단위 pixel
    var s3dpop_closeBtn = "";	//close 버튼 유무(Y/N)
    var s3dpop_closeCookieHours = "0";	//close버튼 클릭시 hidden 쿠키 시간값(기본값 0)
    var s3dpop_ratioValueFull = "";	//Full 배너 비율 => 0.1 ~ 1.0 (기본값 0.7)
    var target_url = "//ad.3dpop.kr/web/gate.pop?company_uid=828596ffff0d3fdbcfe8edccb7357ec7c5beeb41";
    target_url += "&pos_position="+s3dpop_position+"&pos_left="+s3dpop_left+"&pos_bottom="+s3dpop_bottom+"&isCloseBtn="+s3dpop_closeBtn+"&closeCookieHours="+s3dpop_closeCookieHours+"&ratioValueFull="+s3dpop_ratioValueFull;
    (function(){
        var s3dpop = document.createElement("script");
        s3dpop.type = "text/javascript";
        s3dpop.async = true;
        s3dpop.src = target_url;
        (document.getElementsByTagName("head")[0]||document.getElementsByTagName("body")[0]).appendChild(s3dpop);
    })();
</script>
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
        var enliple_lib_path3 =  'http://script.theprimead.co.kr/js/primeBridge.js';

        enliple_addScript(enliple_lib_path1);
        enliple_addScript(enliple_lib_path2);
        enliple_addScript(enliple_lib_path3);
        enliple_addScript(enliple_lib_path);
        enliple_addScript(enliple_path);
    </script>
</c:if>
</body>
</html>