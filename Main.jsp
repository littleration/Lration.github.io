<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");


String num = request.getParameter("num");
String a = request.getParameter("a");

int numCnt = 0;
int b = 0;

if(a != null){b = Integer.parseInt(a);}else{a = "";}
if(num != null){
numCnt = Integer.parseInt(num);
} else { num = ""; }
int madoCnt = 0;

String txUrl1,txUrl2,txUrl3,txUrl4,txUrl5,txUrl6,txUrl7,txUrl8,txUrl9 = "";


String[] txUrl = request.getParameterValues("txUrl");

if(numCnt == 2){
	for(int i=0; i<b; i++){
		txUrl[i] = txUrl[i].substring(txUrl[i].length()-11,txUrl[i].length());
	}
}
%>
    
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	input:-ms-input-placeholder{color:#a8a8a8;}
	input::-webkit-input-placeholder{color:#a8a8a8;}
	input::-moz-placeholder{color:#a8a8a8;}
	.serDiv {height:35px;border:0px; background:#ffffff;}
	.search {width:200px;padding:5px;border:1px solid #1b5ac2;outline:none;float:left;}
</style>
<script>
var txUrl = new Array();
var youtu = "youtu";

function frmChk(b){
	var isCur = 0;
	for(i=0; i<b; i++){
		txUrl[i] = document.frm.txUrl[i].value;
		if(txUrl[i] == ""){
			isCur = 1;
		} else {
			if(txUrl[i].indexOf(youtu) == -1){
				isCur = 2;
			}
		}
	}
	if(isCur == 1){
		alert("URL에 빈칸을 입력못해요");
	} else if(isCur == 2){
		alert("제대로된 유튜브URL이 아니에요");
	} else {
		document.frm.submit();
	}
}
</script>
<head>
<meta charset="UTF-8">
<title>Mado</title>
</head>
<body>
<div id="main">
<% if(numCnt == 0){ %>
	<div>
		<a href="Main.jsp?num=1&a=2"><input type="button" value="2"></a>
		<a href="Main.jsp?num=1&a=3"><input type="button" value="3"></a>
		<a href="Main.jsp?num=1&a=4"><input type="button" value="4"></a>
		<a href="Main.jsp?num=1&a=5"><input type="button" value="5"></a>
		<a href="Main.jsp?num=1&a=6"><input type="button" value="6"></a>
		<a href="Main.jsp?num=1&a=7"><input type="button" value="7"></a>
		<a href="Main.jsp?num=1&a=8"><input type="button" value="8"></a>
		<a href="Main.jsp?num=1&a=9"><input type="button" value="9"></a>
	</div>

<%} else if(numCnt == 2) { %>
	<div>
		<%for(int i = 0; i < b; i++) {%>
		<div>
			<iframe width="100%" height="80%" src="https://www.youtube.com/embed/<%=txUrl[i] %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe><%=txUrl[i] %>
		</div>
		<%} %>
		<a href="Main.jsp"><input type="button" value="HOME"></a>
	</div>
<%} else if(numCnt == 1){ %>
	<div class="serDiv">
	<form action="Main.jsp" method="get" name="frm">
		<input type="hidden" name="num" value="2">
		<input type="hidden" name="a" value="<%=b %>">
		<%for(int i = 0; i < b; i++){ %>
			<input type="text" name="txUrl" placeholder="URL">
		<%} %>
		<input type="button" value="OK" onclick="frmChk(<%=b %>)">
	</form>
	</div>
<%} else {%>
	<div>오류</div>
<%} %>
</div>
</body>
</html>