<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>

<link href = " ${root}/css/style.css" rel="stylesheet" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

<!-- Cascading Style Sheet 폭포.. 우선순위가 있는 스타일 시트 -->
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<script type="text/javascript">
	function alist() {
		var url = "list.do";
		location.href = url;
		url += "&col=${param.col}";
		url += "&word=${param.word}%>";
	}
</script>



</head>
<body>
	<div class = "title">조회</div>
	<table class="table table-bordered">
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${dto.zipcode}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.address1}<br>${dto.address2}
			</td>
		</tr>
		<tr>
			<th>팀원정보</th>
			<td>${info}<br>
			</td>
		</tr>		
		<tr>
			<th>지도 주소입력</th>
			<td id="panel" style="">
			<input id="address" type="textbox" value="${dto.address1}"> 
			<input id="submit" class="button"  value="위치 확인"></td>
	
	<tr>
	<th></th>
	<td>
	<input type="button" value="목록" onclick="javascript:alist()">
	
	</td>
	</tr>
	</table>
	<div id="map">
	</div>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				center : {
					lat : 37.5306,
					lng : 126.9653
				}
			});
			var geocoder = new google.maps.Geocoder();

			document.getElementById('submit').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('address').value;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
	</script>
	
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA6kQk7AdZNFCvw75M0b5zIG3Poij2V_0&callback=initMap">
		
	</script>

</body>
</html>

