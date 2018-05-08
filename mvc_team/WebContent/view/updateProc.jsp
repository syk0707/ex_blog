<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/ssi/ssi.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<script type="text/javascript">
	function mlist() {
		var url = "list.do";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
</script>
</head>
<body>
	<div>
	<c:choose>
	<c:when test="${flag}">
	정보를 수정했습니다.
	</c:when>
	<c:otherwise>
	정보 수정을 실패했습니다.
	</c:otherwise>
	</c:choose>
		<br>
		<button class="button" onclick="mlist()">목록</button>
	</div>
</body>
</html>
