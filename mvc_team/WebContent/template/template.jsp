<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<body>

<jsp:include page="./top.jsp"></jsp:include>
<!-- flush 속성은 포함될 페이지로 제어가 이동될 때 현재 포함하는 페이지가 지금까지 출력 버퍼에 저장한 결과를 처리하는 방법을 결정한다.-->
<jsp:include page = "${CONTENT_PAGE}" flush="false"/>
<jsp:include page="./bottom.jsp"></jsp:include>

</body>

</html>