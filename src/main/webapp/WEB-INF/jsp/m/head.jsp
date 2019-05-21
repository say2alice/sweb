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
    <meta name="description" content="지금 막 올라온 이슈들을 확인하세요<c:if test="${news != null}"> - ${news.subject}</c:if>">

    <title>막이슈<c:if test="${news != null}"> - ${news.subject}</c:if></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/m/style.css">
    <link rel="stylesheet" href="/css/drawer.min.css">
    <link rel="shortcut icon" href="/img/pc/icon.ico"/>
    <link href="/css/jquery.bxslider.css" rel="stylesheet" />
    <script src="/js/iscroll.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/drawer.min.js"></script>
    <script src="/js/googleAnalytics.js"></script>
    <script src="/js/jquery.bxslider.js"></script>
    <script src="/js/kakao.min.js"></script>
</head>
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
