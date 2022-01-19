<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 테스트</title>
</head>
<body>
	SQL에서 쿼리해오기
	<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	Class.forName("org.postgresql.Driver");
	//주소port는 각자포트사용, username, password
	con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/edudb", "edu", "edu");
	con.setAutoCommit(false);//setAutoCommit > fasel로  한 이유는 트랜잭션을 위해서이다.

	/* String sql = "SELECT * FROM tb_cmmn_code_detail tccd";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery(); /* select 절에서 사용 */

	String sql = "SELECT * FROM tb_member WHERE memb_id = ? and memb_pw = ? and use_yn= 'Y'"; //컬럼이 숫자타입이면 뒤에 ::numeric을 적어준다.(postgre SQL의 특징)

	String sql_loginInsert = "INSERT INTO public.tb_memb_login_hst "
	+ "(login_sn, frst_regist_dt, last_change_dt, use_yn, frst_regist_memb_sn, last_change_memb_sn, connect_ip, member_sn) "
	+ "VALUES(nextval('mem_login_hst_seq'), ?, ?, 'Y', ?::numeric, ?::numeric, ?, ?::numeric)";

	pstmt = con.prepareStatement(sql);

	pstmt.setString(1, request.getParameter("memb_id"));
	pstmt.setString(2, request.getParameter("memb_pw"));
	//int upCnt = pstmt.executeUpdate(); //insert, update문은 이 구문 사용!
	rs = pstmt.executeQuery();

	while (rs.next()) {
		System.out.print(rs.getString("memb_id")); //결과를 콘솔에 띄우기 rs.getString("컬럼명");
		System.out.print(rs.getString("memb_pw")); //결과를 콘솔에 띄우기 rs.getString("컬럼명");
		System.out.println("-----------------------");
		//out.print("환영합니다."); //결과를 웨브라우저 화면에 띄우기  rs.getString("컬럼명");
		//redirect? 

		request.setAttribute("IP", request.getRemoteAddr()); //IP획득

		//---로그인 이력 추가를 위한 쿼리문 -------

		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		pstmt2 = con.prepareStatement(sql_loginInsert);

		/* 		 frst_regist_dt, last_change_dt,  frst_regist_memb_sn, last_change_memb_sn, connect_ip, member_sn */

		pstmt2.setTimestamp(1, rs.getTimestamp("frst_regist_dt"));
		pstmt2.setTimestamp(2, rs.getTimestamp("LAST_CHANGE_DT"));
		pstmt2.setInt(3, rs.getInt("FRST_REGIST_MEMB_SN"));
		pstmt2.setInt(4, rs.getInt("last_change_memb_sn"));
		pstmt2.setString(5, String.valueOf(request.getAttribute("IP")));
		pstmt2.setInt(6, rs.getInt("memb_sn")); //Long 타입을 첫번째(1)물음표에 4를 넣겠다는 뜻!

		int upCnt = pstmt2.executeUpdate(); //int upCnt = pstmt.executeUpdate(); //insert, update문은 이 구문 사용!
	}
	if (session.getAttribute("memb_id") != null) {
		System.out.println("로그인 성공");
	} else {
		System.out.println("로그인 실패...");
	}

	con.commit();//commit시에 DB에 반영된다.(즉, 트랜잭션 진행중 문제가 발생하면 catch에서 잡기때문에 DB반영이 되지 않는다.)
	System.out.print("ERror1234");
} catch (Exception e) {
	e.printStackTrace();
	if (con != null) {
		try {
	con.rollback();
		} catch (Exception e2) {
	e2.printStackTrace();
		}
	}
} finally {
	if (con != null) {
		try {
	con.close();
		} catch (Exception e) {
	e.printStackTrace();
		}
	}
	if (pstmt != null) {
		try {
	pstmt.close();
		} catch (Exception e) {
	e.printStackTrace();
		}
	}
	if (rs != null) {
		try {
	rs.close();
		} catch (Exception e) {
	e.printStackTrace();
		}
	}
}
%>
</body>
</html>