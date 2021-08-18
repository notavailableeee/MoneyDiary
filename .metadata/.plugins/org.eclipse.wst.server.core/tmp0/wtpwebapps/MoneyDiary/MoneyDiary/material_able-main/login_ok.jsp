<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="Pkg_DB.DBHandle" scope="page" />

<%
	
	//로그인 처리
	// 1. userId, userPass
	
	String strUserId = request.getParameter("email");
	String strUserPass = request.getParameter("password");
	
	// 2. 아이디와 패스워드가 일치하는지 검사
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "money_diary";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_MEMBER.PROC_LOGIN(?,?,?)}";
	String[] strParams = new String[2];
	strParams[0] = strUserId;
	strParams[1] = strUserPass;
	
	ResultSet rs = DBConn.getResultSet(strProcName, strParams);
	
	rs.next();
	
	String Login_YN = rs.getString("LOGIN_YN");
	
	// 3. Login_YN='Y' --> 로그인 Login_YN='N' --> 아이디 또는 비밀번호가 잘못되었습니다.
			
	if(Login_YN.equals("Y")){
		
		//로그인 - session
		session.setAttribute("userId", strUserId); // session 변수이름, 변수 값
		
		response.sendRedirect("./index.jsp");
	}else{
		
		//실패 - index.jsp 돌려주
		response.sendRedirect("./auth-normal-sign-in.jsp?result=N");
	}
%>
