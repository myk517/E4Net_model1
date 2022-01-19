<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery-3.5.1.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<div class="login-block"
		style="outline-color: #ef4746; outline-style: solid; padding: 30px; padding-top: 5px; padding-bottom: 40px; margin-left: 20%; margin-right: 20%;">
		<h1 style="color: #ef4746; text-align: center">E4. Pay Service</h1>
		<h2 style="font-size: small; text-align: center">서비스 이용을 위해서는
			로그인이 필요합니다.</h2>
	</div>

	<div style="text-align: center">
		<form name="login" method="get" action="loginAction.jsp" id="login">
			<input type="text" value="" placeholder="ID" name="memb_id"
				id="memb_id" style="margin-top: 15px; text-align: center;" /> <br />
			<input type="password" value="" placeholder="Password" name="memb_pw"
				id="memb_pw" style="margin-top: 5px; text-align: center;" /> <br />
			<input type="button" onClick="login_chk()"
				style="background-color: #ef4746; color: white; padding-inline: 67px; padding-top: 3px; padding-bottom: 3px; margin: 10px; border-color: #ef4746;"
				value="Login">
		</form>
		<br>
	</div>

	<%
	String se_id = (String) session.getAttribute("memb_id");
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		function login_chk() {
			if ($('#memb_id').val() == "" || $('#memb_pw').val == "") {
				alert('빈 칸없이 입력해주세요!');
				return false;
			} else {
				document.getElementById('login').submit();
			}
		}
	</script>


</body>
</html>