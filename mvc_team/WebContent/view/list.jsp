<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");%>

<%@ include file = "/ssi/ssi.jsp" %>

<!DOCTYPE html> 

<!-- java.sql 패키지의 DriverManager 클래스 -->

<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>

<script type="text/javascript">
function update(num){
	//alert(num);
	var url = "updateForm.do";
	url+= "?num="+num;
	url += "&col=${col}";
	url += "&word=${word}";
	location.href=url;
}
	function del(num){
		//alert(num);
		if(confirm("정말 삭제하시겠습니까?")){
			var url = "deleteProc.do";
			url+="?num="+num;
			url += "&col=${col}";
			url += "&word=${word}";
			location.href=url;
		}
	}
	function read(num){
	var url = "read.do";
	url+= "?num=" + num;
	url += "&col=${col}";
	url += "&word=${word}";
	location.href=url;
	
}
</script>

</head> 
<body> 
	<div class = "title">팀 정보</div>
	
	<div class="search">
	<form action="./list.do" method="post">
		<select name="col">
			<option value="name"
			<c:if test='col==name'>selected</c:if>
			>이름</option>
			<option value="phone"
			<c:if test='col==phone'>selected</c:if>
			>전화번호</option>
			<option value="address1"
			<c:if test='col==address1'>selected</c:if>
			>주소</option>
		</select>
		<input type="search" name="word" value="${word}" required>
		<button class="button">검색</button>
		<button class="button" onclick="location.href='teaminfo.do'">등록</button>
	</form>
	</div>
	<table class="table table-bordered">
	<tr class="info">
		<th>번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>기술</th>
		<th>수정/삭제</th>
	</tr>
<c:choose>
<c:when test="${empty list}">
		<tr>
			<td colspan="5"> 등록된 주소가 없습니다.</td>
		</tr>
</c:when>
<c:otherwise>
<c:forEach var="dto" items="${list}">
		<tr> <!-- 표현식.. 스크립틀릿으로 데이터를 가져온다 -->
			<td>${dto.num}</td>
			<td><a href="javascript:read('${dto.num}')"> ${dto.name}</a></td>
			<td>${dto.phone}</td>
			<td>${dto.skillstr}</td>
			<td><a href="javascript:update('${dto.num}')"> 수정</a>
			<a href="javascript:del('${dto.num}')"> 삭제</a></td>
		</tr>
</c:forEach>
</c:otherwise>
</c:choose>
	</table>
	<div class = "bottom">
		${paging}
	</div>
</body> 
</html> 