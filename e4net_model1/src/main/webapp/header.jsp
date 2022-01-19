<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/static/css/header.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

		<nav>
		
			<h1>
				<img src="<%=request.getContextPath() %>/static/img/e4netMain.png">
			</h1>

			<ul class="header">
				<li><a href="#tabs-1">머니충전</a></li>
				<li><a href="#tabs-2">머니결제</a></li>
				<li><a href="#tabs-3">거래내역</a></li>
				<li><a href="#tabs-4">로그아웃</a></li>
			</ul>
		</nav>
</body>
</html>