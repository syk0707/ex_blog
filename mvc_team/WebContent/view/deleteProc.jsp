<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href = "../css/style.css" rel = "stylesheet">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<script type="text/javascript">
function mlist(){
	var url = "list.do";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
</script>
</head> 
<body>
<div class = "title">
<c:choose>
<c:when test="${flag}">
정보를 삭제했습니다
</c:when>
<c:otherwise>
정보 삭제를 실패했습니다.
</c:otherwise>
</c:choose>
<br>
</div>
<div class = "bottom">
<button class ="button" onclick="mlist()"> 목록</button>
</div> 
</body> 
</html> 