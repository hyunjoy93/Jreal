<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>(주)제이부동산중개법인 업무포탈</title>
	
<!-- [Favicons] -->
<link href="<c:url value='/img/favicon.png' />" rel="icon">
<%-- <link href="<c:url value='/img/apple-touch-icon.png' />" rel="apple-touch-icon"> --%>
	
<!--[CSS]-->
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.css' />"/>
<link rel="stylesheet" href="<c:url value='/css/style.css' />"/>
	
<!--[JS]-->
<script type="text/javaScript">
<!--

//공통 객체, 그리드 객체, 성공응답코드, 시스템메세지, 
var cmmObj = new Array();
cmmObj["isLogin"] = true;
cmmObj["isDisabledUser"] = true;

var gridObj = new Array();
var valObj = new Array();
var isLogin = ${isLogin};
var successResCode = "${successResCode}";
var failResCode = "${failResCode}";
var noChangeDataResCode = "${noChangeDataResCode}";
var successResMsg = "${successResMsg}";
var failResMsg = "${failResMsg}";
var noChangeDataResMsg = "${noChangeDataResMsg}";
var longLogoutMsg = "${longLogoutMsg}";
var defaultDate = "${defaultDate}";
var logoutUrl = "<c:url value='/view/ctl/logout' />";
var loginUserId = "${loginInfo.user_id}";
var loginUserName = "${loginInfo.user_name}";
var loginUserGroup = "${loginInfo.user_group}";

//-->
</script>
<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />"></script>
<script src="<c:url value='/js/chart.min.js' />"></script>
<script src="<c:url value='/js/common.js' />"></script>

<script src="<c:url value='/js/biz.js' />"></script>

</head>
	
<body>