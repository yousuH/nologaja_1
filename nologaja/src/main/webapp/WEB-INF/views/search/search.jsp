<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 메인내용 -->

<h3>검색 결과</h3>
<div class="container">
	<!-- 호텔 반복 s-->
	<c:forEach var="dto" items="${list}">
		<div class="room">
			<div class="roomlist_box">
				<div class="listbox_img">
					<div class="list_img">
						<!-- 이미지 불러오기 -->
						<img>

					</div>
				</div>
				<!-- 방 이름 -->
				<div class="listbox_title">
					<div class="list_name">
						<p title="${dto.roomName}" class="hotelname" onclick=""><a href="">${dto.roomName }</a></p>
					</div>

					<!-- 별표 이미지 + 총 리뷰점수 + 총리뷰 갯수-->
					<div class="list_grade">
						<img>
						<p>${dto.starAvg}(${dto.cnt })
						<p>
					</div>

					<!-- 전체주소 -->
					<div class="list_adrs">
						<p class="hoteladdress">${dto.addr1 }&nbsp;&nbsp;&nbsp;</p>
					</div>

					<!--  살릴지 안살릴지 모르겠음
					<div class="list_review">
						<img src="/img/sub_list/tripadvisor_logo.png"
							alt="tripadvisorlogo"> Review
					</div>
					<div class="list_info" style="left: 140px;">
						<p>
							<i class="fas fa-info-circle"></i>&nbsp;호텔 정보
						</p>
					</div>
					<div class="list_imgview" style="left: 245px;">
						<p>
							<i class="fas fa-image"></i>&nbsp;이미지 보기
						</p>
					</div>
					<div class="list_map">
						<p>
							<i class="fas fa-map-marker-alt"></i>&nbsp;지도 보기
						</p>
					</div>
				</div>
				 -->

					<!-- 가격 -->
					<div class="listbox_price">
						<p>Price</p>
						<p class="current_coin">
							KRW&nbsp;&nbsp;<span class="pricevalue">계산된 가격(${dto.fee })</span>
						</p>
					</div>
				</div>

			</div>
		</div>
		<!-- 호텔 반복 e-->
	</c:forEach>
</div>
</div>
<div class="col-lg-2"></div>
</div>
<%@ include file="../footer.jsp"%>