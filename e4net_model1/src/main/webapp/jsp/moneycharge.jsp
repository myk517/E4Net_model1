<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/static/css/moneycharge.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp"%>

<div class="money_main">
	<div class="money_balance">
		<span>머니잔액</span>
		
	</div>
	<div class="money_charge">
		<span>머니충전액</span>
		<input type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
	</div>
	<div class="money_result">
		<span>충전결과예정액</span>
	</div>
</div>


</body>
</html>