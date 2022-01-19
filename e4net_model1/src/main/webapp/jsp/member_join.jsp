<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var="ds" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/edudb" user="edu" password="edu" />
	<c:set var="pw" value="${param.memb_pw }"/>
	<c:set var="pwcheck" value="${param.memb_pwcheck }"/>
<c:if test="${pw eq pwcheck}">
	<sql:transaction dataSource="${ds }">

		<sql:query var="select_memb_sn">
		select nextval('member_seq') tm ;
	</sql:query>

		<c:forEach var="i" items="${select_memb_sn.rows }">
			<c:set var="tm" value="${i['tm'] }" />
		</c:forEach>

		<sql:update var="member">
			<%--회원번호, 등록날짜, 최종수정날짜, 사용여부(Y,N), 등록회원번호, 수정회원번호, 
						  상세주소, 이메일주소, 최종로그인일시, 회원ID, 회원이름, 회원비밀번호, 회원전화번호, 우변번호주소, 우편번호, 
						  회원구분(ROLE_ADMIN:어드민, ROLE_SELLER:판매자, ROLE_USER: 사용자), 회원상태코드(10가입,20휴먼,99탈퇴) --%>
	INSERT INTO tb_member(memb_sn,  frst_regist_dt,  last_change_dt,  use_yn,  frst_regist_memb_sn,  last_change_memb_sn,
						  detail_addr,  email_addr,  last_login_dtm,  memb_id,  memb_nm,  memb_pw,  mobile_no,  zip_addr,  zip_cd,
						  member_ty_code,  member_sttus_code)
	VALUES(?, now(), now(), 'Y', 0, 0, 'null', ?, 'null', ?, ?, ?, ?, ?, 'null', 3, 10);
	
				<sql:param value="${tm }" />
			<sql:param value="${param.email_addr }" />
			<sql:param value="${param.memb_id }" />
			<sql:param value="${param.memb_nm }" />
			<sql:param value="${param.memb_pw }" />
			<sql:param value="${param.mobile_no }" />
			<sql:param value="${param.zip_addr }" />
		</sql:update>

		<sql:update var="member_money">
			<%-- 등록일시, 수정일시, 사용여부, 등록회원번호, 수정회원번호, 머니잔고, 회원번호 --%>
	INSERT INTO tb_memb_money(frst_regist_dt, last_change_dt, use_yn, frst_regist_memb_sn, last_change_memb_sn, money_blce, memb_sn)
	VALUES(now(), now(), 'Y', 0, 0, 0, ?);	
	<sql:param value="${tm }" />
		</sql:update>

	</sql:transaction>
</c:if>
<%
String path = request.getContextPath();
response.sendRedirect(path + "/index.jsp");
%>

