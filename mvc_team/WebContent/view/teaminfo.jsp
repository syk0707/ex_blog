<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function incheck() {
	var f = document.frm;
	var sum = 0;
	var count = frm.skills.length;
	  for(var i=0; i < count; i++ ){
	       if( frm.skills[i].checked == true ){
		    sum += 1;
			}
	  } 
	if (f.name.value == "") {
		alert("이름을 입력하세요")
		f.name.focus();
		return;
	}
	if (f.gender.value == "") {
		alert("성별을 입력하세요")
		f.gender.focus();
		return;
	}
	if (f.phone.value == "") {
		alert("전화번호를 입력하세요")
		f.phone.focus();
		return;
	}

	if (sum == 0) {
		alert("보유기술을 선택하세요")
		f.skills.focus();
		return;
	}

	if (f.zipcode.value == "") {
		alert("우편번호를 입력하세요")
		f.zipcode.focus();
		return;
	}
	if (f.address1.value == "") {
		alert("주소를 입력하세요")
		f.address1.focus();
		return;
	}
	if (f.address2.value == "") {
		alert("상세주소를 입력하세요")
		f.address2.focus();
		return;
	}
	if (f.info.value == "") {
		alert("팀원정보를 입력하세요")
		f.info.focus();
		return;
	}
	f.submit();
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<link href = "${root}/css/style.css" rel = "stylesheet" />
</head>
<body>
<div class="title">
팀 정보 등록
</div>

	<form name ="frm" action="createProc.do" method="post" onsubmit="return incheck()">
		<table>
			<tr>
		<th>이름</th>
		<td><input type="text" name="name" size="30"></td>
			</tr>

			<tr>
				<th>성별</th>
				<td>
				<input type="radio" name="gender" value="여자"> 여자
				<input type="radio" name="gender" value="남자"> 남자
				
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone">
				</td>
			</tr>

			<tr>
				<th>보유기술</th>
				
				<td><input type="checkbox" name="skills" value="JAVA">JAVA
					<input type="checkbox" name="skills" value="JSP">JSP
					<input type="checkbox" name="skills" value="MVC/Spring">MVC/Spring
					<input type="checkbox" name="skills" value="jQuery">jQuery
					<input type="checkbox" name="skills" value="R/Python">R/Python
				</td>
			</tr>

			<tr>
				<th>취미</th>
				<td><select name="hobby">
						<option value="기술서적 읽기">기술서적 읽기
						<option value="모바일 게임">모바일 게임
						<option value="등산">등산
						<option value="영화감상">영화감상
						<option value="운동">운동
				</select> <script type="text/javascript">
					
				</script></td>
					<!--document.fname.hobby.value='%=hobby%-->
			</tr>
			<tr>
				<th>주소찾기</th>
				<td><input type="text" name="zipcode" size="6" maxlength="5"
					id="sample6_postcode" placeholder="우편번호">
					<button type="button" onclick="sample6_execDaumPostcode()">
						주소찾기</button></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" name="address1" size="45"
					id="sample6_address" placeholder="주소"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address2" size="50"
					id="sample6_address2" placeholder="상세주소"></td>
			</tr>
			<tr>
				<th>팀원정보</th>
				<td><textarea rows="5" cols="45" name="info"></textarea></td>
			</tr>

		</table>
		<div class = "bottom">
		<button class="button" onclick="incheck()"> 전송 </button>
		</div>
	</form>
</body>
</html>