<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2016-11-03
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="drawer drawer--left">
<script>var from=document.referrer; document.write("<iframe src='http://www.dreamsearch.or.kr/servlet/iadbn?from="+escape(from)+"&u=2016111800004&us=8108&s=8823&psb=99' scrolling='no' frameborder=0 width=0 height=0></iframe>");</script>
<!--head fixed ad-->
<div class="top_ad">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- 막이슈 상단 띠배너 반응형 -->
        <ins class="adsbygoogle"
             style=" display:block;height:60px; width:100%;"
             data-ad-client="ca-pub-2522869015643333"
             data-ad-slot="3342264353"
             ></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    <!-- test -->
</div>
<!--foot fixed ad-->
<c:if test="${param.bz != ''}">
<div class="bottom_ad"><script>var from=document.referrer; document.write("<iframe name='mobon5mb' src='http://www.dreamsearch.or.kr/servlet/adbnMobileBanner?from="+escape(from)+"u=2016111800005&us=8112&s=8827&bntype=51&cntad=1&cntsr=1&iwh=320_75&mChk=75' frameborder='0' scrolling='no' style='height:75px;width:100%';></iframe>");</script></div>
</c:if>
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
        <div id="gnb">
            <div class="navi">
                <ul>
                    <li><a href="/issue/news" class="n1"><img src="/img/m-menu-01@2x.png"></a></li>
                    <li><a href="/gag/news" class="n2"><img src="/img/m-menu-02@2x.png"></a></li>
                    <li><a href="/video/news" class="n3"><img src="/img/m-menu-03@2x.png"></a></li>
                    <li><a href="/hot/news" class="n4"><img src="/img/m-menu-04@2x.png"></a></li>
                    <li><a href="https://www.minimon.com" class="n4"><img src="/img/m-menu-05@2x.png"></a></li>
                </ul>
            </div>
        </div>
    </div>