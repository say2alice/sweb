<%--
  Created by IntelliJ IDEA.
  User: KIMKT
  Date: 2017-02-24
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" href="/css/default.css">
</head>
<body>
<jsp:include page="../m/head.jsp"/>
<jsp:include page="../m/header.jsp"/>
<div id="wrap">
    <div class="policy">
<div class="error">
<img src="/img/pc/logo.png" alt="막이슈">
<p>요청하신 페이지를 찾을수 없습니다!</p>
    <a href="/">홈으로가기</a> <a href="javascript:history.back()">이전페이지로</a>
</div>
</div>
</div>
<jsp:include page="../m/footer.jsp"/>
</body>
</html>
