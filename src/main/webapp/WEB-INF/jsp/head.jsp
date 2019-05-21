<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-03
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-store">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="Expires" content="0">
    <meta property="fb:pages" content="1635011180125871" />
    <meta name="viewport" content="width=device-width">

    <meta property="fb:app_id" content="1182934818449292" />
    <meta property="og:url" content="http://www.maak.kr/view/${news.id}" />
    <meta property="og:type" content="page" />
    <meta property="og:site_name" content="Maak">
    <c:if test="${view eq 'view'}">
        <meta property="og:title" content="${news.subject}" />
        <meta property="og:description" content="<c:out value='${fn:substring(news.summary,0,120)} . . .'/>"/>
        <meta property="og:image" content="${news.originImage}">
    </c:if>
    <c:if test="${view ne 'view'}">
        <meta property="og:title" content="막이슈" />
        <meta property="og:description" content="지금 막 올라온 이슈들"/>
        <meta property="og:image" content="http://www.maak.kr/img/pc/logo.png">
    </c:if>

    <meta property="dable:item_id"           content="${news.id}" />
    <meta property="dable:author"           content="${news.writer}"/>
    <meta property="article:section"           content="${news.category}" />
    <meta property="article:published_time"           content='<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ss'Z'" value="${news.regiDate}" />'/>

    <title>막이슈<c:if test="${news != null}"> - ${news.subject}</c:if></title>
    <meta name="description" content="지금 막 올라온 이슈들을 확인하세요<c:if test="${news != null}"> - ${news.subject}</c:if>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/style.css?v=2"/>
    <link rel="shortcut icon" href="/img/pc/icon.ico"/>
    <link href="/css/jquery.bxslider.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/googleAnalytics.js"></script>
    <script src="/js/jquery.bxslider.js"></script>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
            google_ad_client: "ca-pub-2522869015643333",
            enable_page_level_ads: true
        });
    </script>
    <script>
        (function(d,a,b,l,e,_) {
            d[b]=d[b]||function(){(d[b].q=d[b].q||[]).push(arguments)};e=a.createElement(l);
            e.async=1;e.charset='utf-8';e.src='//static.dable.io/dist/plugin.min.js';
            _=a.getElementsByTagName(l)[0];_.parentNode.insertBefore(e,_);
        })(window,document,'dable','script');
        dable('setService', 'maak.kr');
        dable('sendLog');
    </script>
</head>
<body>
<script>var from=document.referrer; document.write("<iframe src='http://www.dreamsearch.or.kr/servlet/iadbn?from="+escape(from)+"&u=2016111800004&us=8108&s=8823&psb=99' scrolling='no' frameborder=0 width=0 height=0></iframe>");</script>
    <header>
        <div id="header">
            <div class="head_t">
                <h1 class="logo">
                    <a href="/">
                        <img src="/img/logo@2x.png" alt="막이슈">
                    </a>
                </h1>
                <div id="gnb">
                    <div class="float_right" id="google_translate_element"></div>
                    <script type="text/javascript">
                        function googleTranslateElementInit() {
                            new google.translate.TranslateElement({pageLanguage: 'ko', includedLanguages: 'en,ja,ko,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true, gaId: 'UA-88252176-1'}, 'google_translate_element');
                        }
                    </script>
                    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                    <div class="navi">
                        <ul>
                            <li><a href="/issue/news" class="n1"><img src="/img/menu-01@2x.png"></a></li>
                            <li><a href="/gag/news" class="n2"><img src="/img/menu-02@2x.png"></a></li>
                            <li><a href="/video/news" class="n3"><img src="/img/menu-03@2x.png"></a></li>
                            <li><a href="/hot/news" class="n4"><img src="/img/menu-04@2x.png"></a></li>
                            <li><a href="https://www.minimon.com" class="n4"><img src="/img/menu-05@2x.png"></a></li>
                        </ul>
                    </div>
                    <div class="search">
                        <div class="input_wrap">
                            <div id="searchBtn" class="search_btn"><a href="#"><img src="/img/ic-search@2x.png"></a></div>
                            <input type="text" id="text" value="${param.text}" placeholder="이슈 검색">
                        </div>
                    </div>
                </div>
            </div>
        </div>
</header>
<div id="wrap_ad">
    <div id="ad_left">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 160 X 600 좌측 배너 PC용 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:160px;height:600px"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="5473550434"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
    <div id="ad_left2">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 160 X 600 우측 배너 PC용 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:160px;height:600px"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="9332904391"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
    <div id="ad_right_float">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 160 X 600 우측 배너 PC용 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:160px;height:600px"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="9332904391"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
</div>
<div class="top_ad">
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- 막이슈 pc 1100 광고 테스트 -->
    <ins class="adsbygoogle"
         style="display:inline-block;width:970px;height:90px"
         data-ad-client="ca-pub-2522869015643333"
         data-ad-slot="5310910006"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
</div>