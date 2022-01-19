<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberJoin</title>
<link href="static/css/header.css" rel="stylesheet" />
</head>

<body>

<form action="jsp/member_join.jsp">
      <section class="page-section text-white" style="margin-top: 10%;">
            <div class="container px-4 px-lg-5 text-center" style="margin-left:5%; width:90%; height: 10%; border: solid;">
             <div style=" margin:0 auto;">
                <h2 style="text-align: center;" class="mb-4">MEMBER JOIN</h2>
               
         <table class="table" style="text-align: center; width: 70%; margin: auto;">
        	<tr>
        		<th style="width: 40%">ID</th>
        		<td>
        		<div class="input-group mb-3">
      				<input style="width: 25%;" type="text" class="form-control" id="id" name="memb_id" placeholder="ID" required>
      				<button class="btn btn-primary" type="button" id="btn">중복확인</button>
    			</div>
    			<div style="display: none;" id="target"></div>
    			</td>
        	</tr> <Br>
        	<tr>
        		<th>PASSWORD</th>
        		<td>
        		    <div class="form-group">
      				<input type="password" class="form-control" id="pwd" name="memb_pw" placeholder="Password" required>
    				</div>
        		</td>
        	</tr><Br>
        	<tr>
        		<th>PWDCheck</th>
        		<td>
        		    <div class="form-group">
      				<input style="width: 28%" type="password" class="form-control" id="pwd" name="memb_pwcheck" placeholder="PWD Chk" required>
      				<button class="btn btn-primary" type="button" id="btn1">Check</button>
    				</div>
        		</td>
        	</tr><Br>
        	<tr>
        		<th>Name</th>
        		<td>
        		    <div class="form-group">
      				<input type="text" class="form-control" id="name" name="memb_nm" placeholder="Name" required>
    				</div>
        		</td>
        	</tr>
        	<tr>
        		<th>Phone</th>
        	    <td>
        	    	<div class="input-group mb-3">
					  <input type="tel" class="form-control" placeholder="ex)010-1234-1234" id="phone" name="mobile_no" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
					  
					</div>
					<div style="display: none;" id="target1"></div>
        	    </td>
        	</tr>
        	<tr>
        		<th>E-Mail</th>
        	    <td>
        	    	<div class="input-group mb-3">
					  <input type="tel" class="form-control" placeholder="ex)www@www.com" id="emaill" name="email_addr" required>
					  
					</div>
					<div style="display: none;" id="target1"></div>
        	    </td>
        	</tr>
			<tr>
        		<th style="width: 20%">Address</th>
        		<td>
        		<div class="input-group mb-3">
      				<input type="text" class="form-control" id="address" name="zip_addr" placeholder="ex)서울시 강남구 테헤란로" required>
    			</div>
    			</td>
        	</tr><Br>
        	</table><br><br><br>
        		<div style="position: absolute; width: 100%; height: 100%; margin-left: 10%">
        		<input class="btn btn-primary btn-xl" style="border-radius:10px; border:none; padding: 10px; width: 70%; font-size: 18px; background-color: #ef4746; font" type="submit" value="Join">
        		</div>
        	<div style="height: 50px;"></div>
                
            </div>
            </div>
        </section>
      </form>  
</body>
    <script>
   
    $(function() {
    	$('#btn').click(function() {
    		var id = $('#id').val();
    		// var obj = {"":"",ss:function(){}}
    		$.ajax({
    			url: "idcheck?id="+id,
    			cache : false, //ajax 통신중  캐시롤 삭제
    			success:function(res){ // 콜백
    				console.log("data: "+res);
    				var resMsg = "";
    				if (res === "1") {
    					resMsg = "<p style='color:red'>이미 사용중인 아이디 입니다.</p>";
    				} else {
    					resMsg = "<p style='color:blue'>사용 가능한 아이디 입니다.</p>";
    				}
    				$('#target').css('display','block');
    				$('#target').html(resMsg);
    			}
    			
    		});
    	});
    });
    </script>
</html>