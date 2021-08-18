<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:useBean id="DBConn" class="Pkg_DB.DBHandle" scope="page" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>맘대로!</title>
    
    <%
    	request.setCharacterEncoding("UTF-8");
		DecimalFormat price = new DecimalFormat("###,###,###");
    
    	String strUserId = (String)session.getAttribute("userId");
    	if(strUserId == null){
    		response.sendRedirect("./auth-normal-sign-in.jsp");
    	}
    	
    	String strDate = "21-04-10";
    	//System.out.println(strUserId);

		String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "money_diary";
		dbInfos[2] = "1";
	
		DBConn.setDBInfo(dbInfos);
		
		String strProcName = "{call PKG_SEL_DIARY.PROC_SEL_DAY(?,?,?)}";
		
		String[] strParams = new String[2];
		strParams[0] = strUserId;
		strParams[1] = strDate;
		
		ResultSet rs = DBConn.getResultSet(strProcName, strParams);
		
		String strProcName2 = "{call PKG_SEL_DIARY.PROC_SEL_MONTH(?,?,?)}";
		
		String[] strParams2 = new String[2];
		strParams2[0] = strUserId;
		strParams2[1] = strDate;
		
		ResultSet rs2 = DBConn.getResultSet(strProcName2, strParams2);
		rs2.next();
		
		String strProcName3 = "{call PKG_SEL_DIARY.PROC_SEL_MEM_MONEY(?,?)}";
			
		String[] strParams3 = new String[1];
		strParams3[0] = strUserId;
		
		ResultSet rs3 = DBConn.getResultSet(strProcName3, strParams3);
		rs3.next();
		
    %>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <style>
        @font-face {font-family: "BMHANNA"; src: url ("../font/BMHANNAAir_ttf.ttf")}
        body {
            font-family: "BMHANNA";
        }
    </style>
    <script>
    	/* import html with ajax */
	    function includeHTML() {
	    	  var z, i, elmnt, file, xhttp;
	    	  /*loop through a collection of all HTML elements:*/
	    	  z = document.getElementsByTagName("*");
	    	  for (i = 0; i < z.length; i++) {
	    	    elmnt = z[i];
	    	    /*search for elements with a certain atrribute:*/
	    	    file = elmnt.getAttribute("include-html");
	    	    if (file) {
	    	      /*make an HTTP request using the attribute value as the file name:*/
	    	      xhttp = new XMLHttpRequest();
	    	      xhttp.onreadystatechange = function() {
	    	        if (this.readyState == 4) {
	    	          if (this.status == 200) {elmnt.innerHTML = this.responseText;}
	    	          if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
	    	          /*remove the attribute, and call this function once more:*/
	    	          elmnt.removeAttribute("include-html");
	    	          includeHTML();
	    	        }
	    	      }      
	    	      xhttp.open("GET", file, true);
	    	      xhttp.send();
	    	      /*exit the function:*/
	    	      return;
	    	    }
	    	  }
	    	};
	    /* import html with ajax */
        window.onload = function(){
            $("body").append('<div class="fixed-button active"><a href="./bs-basic-table2.jsp" target="_blank" class="btn btn-md btn-primary">자세히보기</a> </div>');
            var $window=$(window),nav=$(".fixed-button");
        };
		
    </script>
</head>

<body>
    <!-- Pre-loader start -->
    <!-- <div include-html="Pre-loader.html"></div> 
	<script>
		includeHTML();
	</script> -->
	<div class="theme-loader">
        <div class="loader-track">
            <div class="preloader-wrapper">
                <div class="spinner-layer spinner-blue">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-yellow">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-green">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <!-- <div include-html="Header.html"></div> 
            <script>
				includeHTML();
			</script> -->
			<nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">
                    <div class="navbar-logo">
                        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <div class="mobile-search waves-effect waves-light">
                            <div class="header-search">
                                <div class="main-search morphsearch-search">
                                    <div class="input-group">
                                        <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                                        <input type="text" class="form-control" placeholder="Enter Keyword">
                                        <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--<a href="index.jsp">
                            <img class="img-fluid" src="assets/images/logo.png" alt="Theme-Logo" />
                        </a>-->
                        <a class="mobile-options waves-effect waves-light">
                            <i class="ti-more"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>
                            <!--<li>
                                <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>-->
                        </ul>
                        <ul>
                            <!-- Page-header start --><!-- 모바일에서 깨져요 -->
                            <li>
                                <span style="width:25%;display:block;float:left;padding-top:0.8%;">
                                    <h4 style="text-align:center;color:rgb(255,252,244);">&#60;</h4>
                                </span>
                            </li>
                            <li>
                                    <span style="width:30%;display:block;float:left;padding-top:0.7%;">
                                    <h4 style="text-align:center;padding-top:5px;color:rgb(255,252,244);">2021.04.01 ~ 4.30</h4>
                                </span>
                            </li>
                            <li>
                                <span style="width:12%;display:block;float:left;padding-top:0.8%;">
                                    <h4 style="text-align:right;color:rgb(255,252,244);">&#62;</h4>
                                </span>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <!--
                            <li class="header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="ti-bell"></i>
                                    <span class="badge bg-c-red"></span>
                                </a>
                                <ul class="show-notification">
                                    <li>
                                        <h6>Notifications</h6>
                                        <label class="label label-danger">New</label>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">John Doe</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Joseph William</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Sara Soudein</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>-->
                            <li class="user-profile header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <img src="assets/images/profile.jpg" class="img-radius" alt="User-Profile-Image">
                                    <span><%=strUserId %></span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li class="waves-effect waves-light">
                                        <a href="#!">
                                            <i class="ti-settings"></i> Settings
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="user-profile.html">
                                            <i class="ti-user"></i> Profile
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="email-inbox.html">
                                            <i class="ti-email"></i> My Messages
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="auth-lock-screen.html">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="auth-normal-sign-in.jsp">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- 메뉴 시작 -->
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="">
                                <div class="main-menu-header">
                                    <img class="img-80 img-radius" src="assets/images/profile.jpg" alt="User-Profile-Image">
                                    <div class="user-details">
                                        <span id="more-details" style="color:#666;"><%=strUserId %><i class="fa fa-caret-down"></i></span>
                                    </div>
                                </div>
                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                                            <a href="#!"><i class="ti-settings"></i>Settings</a>
                                            <a href="auth-normal-sign-in.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="p-15 p-b-0">
                                <form class="form-material"><!-- 분류선택도 할 수 있으면 좋겠다. -->
                                    <div class="form-group form-primary">
                                        <input type="text" name="footer-email" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label"><i class="fa fa-search m-r-10"></i>Search</label>
                                    </div>
                                </form>
                            </div>
                            <!--<div class="pcoded-navigation-label">Navigation</div>-->
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="active">
                                    <a href="index.jsp?userId=<%=strUserId %>" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext">Home</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <!--<div class="pcoded-navigation-label">Tables</div>-->
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="bs-basic-table2.jsp?userId=<%=strUserId %>" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-receipt"></i><b>B</b></span>
                                        <span class="pcoded-mtext">Detail</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="modify.jsp?userId=<%=strUserId %>" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-receipt"></i><b>B</b></span>
                                        <span class="pcoded-mtext">modify</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <!--<div class="pcoded-navigation-label">Chart And Maps</div>-->
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="chart-morris.html?userId=<%=strUserId %>" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-bar-chart-alt"></i><b>C</b></span>
                                        <span class="pcoded-mtext">Charts</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <!--<div class="pcoded-navigation-label">Login</div>-->
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-id-badge"></i><b>A</b></span>
                                        <span class="pcoded-mtext">Login</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="">
                                            <a href="auth-normal-sign-in.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">Login</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="auth-sign-up.html" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">Registration</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="pcoded-content">
                        <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                            <!-- 첫번째 4등분 박스 시작 -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card mat-stat-card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center b-b-default">
                                                            <!-- box 1 -->
                                                            <div class="col-sm-6 b-r-default p-b-20 p-t-20" style="background-color:#67D5B5;">
                                                                
                                                                    <div class="col-12 p-m-0" style="color:rgb(255,252,244);text-align:center;padding-left:0px;padding-right:0px">
                                                                        <h5><%=price.format(Integer.parseInt(rs2.getString("INCOME"))) %></h5>
                                                                        <h7><%=rs2.getString("ICNT") %>건</h7>
                                                                    </div>
                                                                
                                                            </div>
                                                            <!-- box 2 -->
                                                            <div class="col-sm-6 p-b-20 p-t-20" style="background-color:#EE7785;">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-12 p-l-0" style="color:rgb(255,252,244);text-align:center;padding-right:0px">
                                                                        <h5><%=price.format(Integer.parseInt(rs2.getString("OUTCOME"))) %></h5>
                                                                        <h7><%=rs2.getString("OCNT") %>건</h7>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row align-items-center">
                                                            <!-- box 3 -->
                                                            <div class="col-sm-12 p-b-30 p-t-30 b-r-default">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-12 p-l-20" style="padding-right:0px">
                                                                        <h5 style="margin-bottom:0px;"><%=price.format(Integer.parseInt(rs2.getString("TLTPRICE"))) %></h5>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12">
                                                <div class="card mat-clr-stat-card text-white green" style="background:#aacfd0;">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-2 text-center bg-c-green" style="background:#1f4e5f;">
                                                                <i class="fas fa-star mat-icon f-24"></i>
                                                            </div>
                                                            <div class="col-10 cst-cont">
                                                                <h5>이럴거면 차를 사세요</h5>
                                                                <p class="m-b-0">택시비</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card mat-clr-stat-card text-white" style="background:#dedcee;">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-2 text-center bg-c-green" style="background:#6a60a9;">
                                                                <i class="fas fa-trophy mat-icon f-24"></i>
                                                            </div>
                                                            <div class="col-10 cst-cont">
                                                                <h5>잠시 지나가겠습니다~</h5>
                                                                <p class="m-b-0">카드대금</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Material statustic card end -->
                                            <!-- order-visitor start -->


                                            <!-- order-visitor end -->

                                            <!--  sale analytics start -->
                                            <div class="col-xl-12 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header" style="background-color:#FBFFB9">
                                                        <h4 style="margin-top:5px">4월 10일</h4>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <!-- 일일 소비 테이블 시작 -->
                                                        <div class="table-responsive">
                                                            <table class="table table-hover m-b-0 without-header">
                                                                <tbody>
                                                                	<% 
                                                                		while(rs.next()){
                                                                			
                                                                			if(Integer.parseInt(rs.getString("price")) < 0){	
                                                                	%>
                                                                    <tr>
                                                                        <td style="width:15%">
                                                                            <div style="text-align:center;padding:15px 0px 0px 0px;margin:0px 0px 0px 0px">
                                                                                <h6><%=rs.getString("C_NAME") %></h6>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="d-inline-block align-middle">
                                                                                <div class="d-inline-block">
                                                                                    <div>
                                                                                        <span style="font-size:15px;font-weight:bold;">
                                                                                            <%=rs.getString("M_CONTENT")%>
                                                                                        </span>
                                                                                        &nbsp;&nbsp;&nbsp;
                                                                                        <span class="text-muted m-b-0" style="font-size:12px;">
                                                                                            <%
                                                                                            	String etc = "";
                                                                                            
                                                                                            	if(rs.getString("M_ETC") != null){
                                                                                            		etc = rs.getString("M_ETC");
                                                                                            		//System.out.println("null");
                                                                                            	} 
                                                                                            %>
                                                                                            <%=etc %>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div>
                                                                                        <span class="text-muted m-b-0">
                                                                                            <%=rs.getString("MDATE") %>
                                                                                        </span>
                                                                                        &nbsp;&nbsp;&nbsp;
                                                                                        <span class="text-muted m-b-0">
                                                                                            <%=rs.getString("P_NAME") %>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-right" style="width:15%">
                                                                            <h5 class="f-w-700" style="color:red;text-align:center;padding:10px 0px 0px 0px;">
                                                                                <%=price.format(Integer.parseInt(rs.getString("PRICE"))) %>
                                                                            </h5>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                			}
                                                                			else{
                                                                    %>
                                                                    <tr>
                                                                        <td style="width:15%">
                                                                            <div style="text-align:center;padding:15px 0px 0px 0px;margin:0px 0px 0px 0px">
                                                                                <h6><%=rs.getString("C_NAME") %></h6>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="d-inline-block align-middle">
                                                                                <div class="d-inline-block">
                                                                                    <div>
                                                                                        <span style="font-size:15px;font-weight:bold;">
                                                                                            <%=rs.getString("M_CONTENT") %>
                                                                                        </span>
                                                                                        &nbsp;&nbsp;&nbsp;
                                                                                        <span class="text-muted m-b-0" style="font-size:12px;">
                                                                                        	<%
                                                                                            	String etc = "";
                                                                                            
                                                                                            	if(rs.getString("M_ETC") != null){
                                                                                            		etc = rs.getString("M_ETC");
                                                                                            		//System.out.println("null");
                                                                                            	} 
                                                                                            %>
                                                                                            <%=etc %>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div>
                                                                                        <span class="text-muted m-b-0">
                                                                                            <%=rs.getString("MDATE") %>
                                                                                        </span>
                                                                                        &nbsp;&nbsp;&nbsp;
                                                                                        <span class="text-muted m-b-0">
                                                                                            <%=rs.getString("P_NAME") %>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-right" style="width:15%">
                                                                            <h5 class="f-w-700" style="color:blue;text-align:center;padding:10px 0px 0px 0px;">
                                                                                <%=price.format(Integer.parseInt(rs.getString("PRICE"))) %>
                                                                            </h5>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                			}
                                                                		}
                                                                    %>
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  sale analytics end -->

                                            <!-- 현재 순수 자산 -->
                                            <div class="col-xl-12">
                                                <div class="card proj-progress-card">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-xl-12 col-md-12">
                                                                <h3>나의 수명</h3>
                                                                <h5 class="m-b-30 f-w-700"><%=price.format(Integer.parseInt(rs3.getString("TLTPROPERTY"))) %>
                                                                	<span class="text-c-green m-l-10"><%=rs3.getString("RATE") %>&#37;</span>
                                                                </h5>
                                                                <div class="progress">
                                                                    <div class="progress-bar bg-c-red" style="width:<%=rs3.getString("RATE") %>%;background:#E53A40"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Project statustic end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->

    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- slimscroll js -->
    <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>

    <!-- menu js -->
    <script src="assets/js/pcoded.min.js"></script>
    <script src="assets/js/vertical/vertical-layout.min.js "></script>

    <script type="text/javascript" src="assets/js/script.js "></script>
</body>

</html>
