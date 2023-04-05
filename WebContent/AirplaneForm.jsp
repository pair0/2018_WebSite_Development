<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>여행 가즈아~</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css1/portfolio-item.css" rel="stylesheet">
    
<title>Insert title here</title>
</head>
<body>
	 <!-- username -->
  	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
	%>
	
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="HomepageForm.jsp">여행 가즈아~</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="HomepageForm.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	 게시판
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              	<a class="dropdown-item" href="free_board_list.jsp">자유 게시판</a>
                <a class="dropdown-item" href="image_main.jsp">사진 게시판</a>
                <a class="dropdown-item" href="trap_board_list.jsp">북아메리카 게시판</a>
                <a class="dropdown-item" href="trap_board_list_4.jsp">남아메리카 게시판</a>
                <a class="dropdown-item" href="trap_board_list_2.jsp">유럽 게시판</a>
                <a class="dropdown-item" href="trap_board_list_3.jsp">아시아 게시판</a>
                <a class="dropdown-item" href="trap_board_list_5.jsp">아프리카 게시판</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="MapForm.jsp">세계지도</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="AirplaneForm.jsp">비행기표 예매</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
	<!-- main-simple-control -->
			<!-- 액센츄어 개발 MainQuickBook2-->
			<!-- 20130830 수정 -->
			<section class="main-simple-control">
				<h2 class="hidden">간편 예매</h2>
				<div class="box-simple-control">
					<div class="inner-simple-control">

						<!-- 국내선 -->
						<div class="simple-each" id="first-simple"> <!-- 국제선만 id="first-simple" -->
							<h3 id="btnLeftDOM"><a href="#none"><img src="/CW/images/btn/btn_simpleNav01_on.png" alt="국내선"></a></h3>
							<div class="each" id="divDOM" DOMINTType="D">
								<div class="box-displayType-1">

									<div class="each-positype-2">
										<!-- 왕복 -->
										<h4 class="on" name="TripType"><a href="#none" onfocus="moveDOMContent(this)" TripType="RT" DOMINTType="D"><span>왕복</span></a></h4>
										<div class="box-displayType-2" id="domContent">
											<div class="each-positype-1">
												<div class="selectBox">
													<select id="DOM_RT_DepAirport" class="common-selectType-1" style="padding:6px;line-height:30px;height:30px;" title="출발지">

													<option value="KWJ" area="" country="" city="">광주</option>

													<option value="GMP" area="" country="" city="">김포</option>

													<option value="TAE" area="" country="" city="">대구</option>

													<option value="MWX" area="" country="" city="">무안</option>

													<option value="PUS" area="" country="" city="">부산</option>

													<option value="RSU" area="" country="" city="">여수</option>

													<option value="USN" area="" country="" city="">울산</option>

													<option value="CJU" area="" country="" city="">제주</option>

													<option value="HIN" area="" country="" city="">진주/사천</option>

													<option value="CJJ" area="" country="" city="">청주</option>

													</select>
												</div>
												<div class="selectBox">
													<select id="DOM_RT_ArrAirport" class="common-selectType-1" style="padding:6px;line-height:30px;height:30px;" title="도착지">

													<option value="KWJ" area="" country="" city="">광주</option>

													<option value="GMP" area="" country="" city="">김포</option>

													<option value="TAE" area="" country="" city="">대구</option>

													<option value="MWX" area="" country="" city="">무안</option>

													<option value="PUS" area="" country="" city="">부산</option>

													<option value="RSU" area="" country="" city="">여수</option>

													<option value="USN" area="" country="" city="">울산</option>

													<option value="CJU" area="" country="" city="">제주</option>

													<option value="HIN" area="" country="" city="">진주/사천</option>

													<option value="CJJ" area="" country="" city="">청주</option>

													</select>
												</div>
											</div>

											<!-- 국내선 Calendar 시작 -->
											<input type="hidden" name="DOM_RT_departureDate" id="DOM_RT_departureDate" value="2018-06-11">
											<input type="hidden" name="DOM_RT_arrivalDate" id="DOM_RT_arrivalDate" value="2018-06-11">
											<div class="each-positype-1" style="top:110px;min-height:36px;">
												<!-- 가는 날 - 달력 -->
												<div class="btnAR-calendar"  id="divDOM_RT_DepCalendar">
													<a class="btn_calendar CalendarBtn" href="#none" id="nextCalendarFocusA" title="" ><img alt="가는 날 달력 레이어 팝업 열기" src="/CW/images/btn/btn_calendar3.gif"></a>
													<input type="text" readonly="" class="text01 inputFocusin01" id="viewDate1" title="가는 날" value="2018-06-11">
												</div>
                                                <div class="CalendarBox" id="CalendarBox1" style="top:6px;" tabindex="-1"><!--KWCAG적용 -->
                                                    <div class="CalendarInner bg_start" id="sCalArea1"></div>
                                                    <a href="javascript:_cal_close('nextCalendarFocusA');" class="btn_close2"><img src="/CW/images/btn/btn_close2.gif" alt="가는날 달력 레이어 팝업 닫기"></a>
                                                </div>

                                                <!-- 오는 날 - 달력 -->
												<div class="btnAR-calendar" style="margin-left:0;margin-right:0;width:139px;" id="divDOM_RT_ArrCalendar">
													<a class="btn_calendar CalendarBtn" href="#none" id="nextCalendarFocusB" title="" ><img alt="오는 날 달력 레이어 팝업 열기" src="/CW/images/btn/btn_calendar3.gif"></a>
													<input type="text" readonly="" class="text01 inputFocusin01" id="viewDate2" title="오는 날" style="width:99px;"  value="2018-06-11">
												</div>
                                                <div class="CalendarBox" id="CalendarBox2" style="left:144px;" tabindex="-1"><!--KWCAG적용 -->
                                                    <div class="CalendarInner bg_arrival" id="sCalArea2"></div>
                                                    <a href="javascript:_cal_close();" class="btn_close2"><img src="/CW/images/btn/btn_close2.gif" alt="오는날 달력 레이어 팝업 닫기"></a>
                                                </div>
											</div>

											<!-- 국내선 Calendar 끝 -->

											<div class="each-positype-2" style="top:146px;padding:0;">
												<ul class="pp-cnt">
													<li>
														<select class="common-selectType-1" id="selectPaxADTCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;">
														
															<option value="1">성인1</option>
														
															<option value="2">성인2</option>
														
															<option value="3">성인3</option>
														
															<option value="4">성인4</option>
														
															<option value="5">성인5</option>
														
															<option value="6">성인6</option>
														
															<option value="7">성인7</option>
														
															<option value="8">성인8</option>
														
															<option value="9">성인9</option>
														
														</select>
														<label for="selectPaxADTCnt"></label>
													</li>

													<li>
														<select class="common-selectType-1" id="selectPaxCHDCnt" name="selectPaxCHDCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;" onchange="javascript:validateByValue('selectPaxCHDCnt', checkPaxCntD)">
														
															<option value="0">소아0</option>
														
															<option value="1">소아1</option>
														
															<option value="2">소아2</option>
														
															<option value="3">소아3</option>
														
															<option value="4">소아4</option>
														
															<option value="5">소아5</option>
														
															<option value="6">소아6</option>
														
															<option value="7">소아7</option>
														
															<option value="8">소아8</option>
														
															<option value="9">소아9</option>
														
														</select>
														<label for="selectPaxCHDCnt">(2~13세)</label>

														<div class="main-helpType-1" style="display:inline-block;*display:inline;*zoom:1;">
															<a class="help" href="#none"><img alt="소아 도움말" src="/CW/images/bl/bl_help.gif"></a>
															<!-- layerPopup -->
															<div class="abroadBox2 BoxClose">
																<div class="abroadInner">
																	<div class="aTitle">
																		<p>
																			<strong>소아 안내</strong>
																		</p>
																	</div>
																	<div class="abroadCt">
																		국내선 소아는 탑승일 기준 만2세부터 만13세 미만까지이며 반드시 만18세 이상의 성인과 동반하여 구매가 가능합니다.
																	</div>
																</div>
																<a href="#none" class="close"><img src="/CW/images/btn/btn_close.gif" alt="소아 안내 팝업 닫기"></a>
															</div>
															<!-- //layerPopup -->
														</div>
													</li>

													<li class="last">
														<select class="common-selectType-1" id="selectPaxINFCnt" name="selectPaxINFCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;">
														
															<option value="0">유아0</option>
														
															<option value="1">유아1</option>
														
															<option value="2">유아2</option>
														
															<option value="3">유아3</option>
														
															<option value="4">유아4</option>
														
															<option value="5">유아5</option>
														
															<option value="6">유아6</option>
														
															<option value="7">유아7</option>
														
															<option value="8">유아8</option>
														
															<option value="9">유아9</option>
														
														</select>
														<label for="selectPaxINFCnt">(2세 미만)</label>
														<div class="main-helpType-1" style="display:inline-block;*display:inline;*zoom:1;">
															<a class="help" href="#none"><img alt="유아 도움말" src="/CW/images/bl/bl_help.gif"></a>
															<!-- layerPopup -->
															<div class="abroadBox2 BoxClose">
																<div class="abroadInner">
																	<div class="aTitle">
																		<p>
																			<strong>유아 안내</strong>
																		</p>
																	</div>
																	<div class="abroadCt">
																		국내선 유아는 탑승일 기준 만 2세 (만 24개월) 미만까지이며 성인 1명이 동반 가능한 유아는 1명입니다.<br />2명 이상 동반할 경우 추가되는 유아수 만큼 소아 운임의 항공권을 구매하셔야 합니다.
																	</div>
																</div>
																<a href="#none" class="close"><img src="/CW/images/btn/btn_close.gif" alt="유아 안내 팝업 닫기"></a>
															</div>
															<!-- //layerPopup -->
														</div>
													</li>
													<p>* 해당 기준은 만 나이 기준입니다</p>
												</ul>

												<!-- 나이 계산기 -->
												<div class="main-age-calculator"><span class="btnType10_3 btn_CpopupLayer" name="btnAgeCalcurate"><a href="#none" title="나이계산기 새창으로 열기">나이계산기</a></span></div>
												<!-- //나이 계산기 -->

											</div>
										</div>
										<!-- //왕복 -->

										<!-- 편도 -->
										<h4 name="TripType"><a href="#none" onfocus="moveDOMContent(this)" TripType="OW" DOMINTType="D"><span>편도</span></a></h4>
										<!-- //편도 -->
									</div>
									
									
									<span class="btnType22" style="z-index:6;"><a href="/CW/ko/common/pageContent.do?pageId=PC_00002448" target="_blank">할인쿠폰 사용 안내</a></span>
								<div class="plan-textalign-right" style="position:absolute;top:255px;right:21px;z-index:5;">													
									<span class="Sbtn_TType03_2" id="btnSearchAvailOfDOM"><a href="#none" title="" >항공편 조회하기</a></span></div><a class="btn-linkType-1 posiType-1" href="#none" id="btnSearchOJOfDOM" style="display:block" title="국내선 항공권 예매 바로가기">기타</a></div>
								<span class="Sbtn_TType07_3" name="btnMoveRedemption" DOMINTType="D"><a href="/CW/ko/common/pageContent.do?pageId=PC_0574" title="" >마일리지항공권</a></span>
							</div>
						</div>
						<!-- //국내선 -->

						<!-- 국제선 -->


						<div class="simple-each">
							<h3><a href="#none"><img src="/CW/images/btn/btn_simpleNav02_off.png" alt="국제선"></a></h3>
							<div class="each" id="divINT" DOMINTType="I">
								<div class="box-displayType-1">
									<div class="each-positype-2">

										<!-- 왕복 -->
										<h4 class="on" name="TripType"><a href="#none" onfocus="moveINTContent(this)" TripType="RT" DOMINTType="I"><span>왕복</span></a></h4>
										<div class="box-displayType-2" id="intContent">
											<div class="each-positype-1" style="z-index:12;">


												<div class="selectBox2">
<!--CR4 판매고 확대 시작-->
													<input type="image" id="btn_INT_DepAirport_Search" class="btnSend btn_CpopupLayer" alt="출발지 레이어 팝업 열기" src="/CW/images/btn/btn_search4.gif">
													<span class="selectType02">
														<input type="text"   name="txt_INT_DepAirportName" id="txt_INT_DepAirportName" title="도시 또는 공항 이름(코드) 3자리 입력" value="도시 또는 공항 이름(코드) 3자리 입력" style="border: 1px solid #999999; padding:0; margin-top:0px; color: #201CB4;font-family: '굴림',gulim;height: 28px;line-height: 26px;width: 99%;">
														<input type="hidden" name="hid_INT_DepAirport"     id="hid_INT_DepAirport" >
														<input type="hidden" name="hid_INT_DepArea"        id="hid_INT_DepArea" >
														<input type="hidden" name="hid_INT_DepCity"        id="hid_INT_DepCity" >
														<input type="hidden" name="hid_INT_DepCountry"     id="hid_INT_DepCountry" >
													</span>
<!--CR4 판매고 확대 끝-->												
												</div>

												<div class="selectBox2">
													<input type="image" id="btn_INT_ArrAirport_Search" class="btnSend btn_CpopupLayer" alt="도착지 레이어 팝업 열기" src="/CW/images/btn/btn_search4.gif">
													<span class="selectType02">
														<input type="text"   name="txt_INT_ArrAirportName" id="txt_INT_ArrAirportName" title="도시 또는 공항 이름(코드) 3자리 입력" value="도시 또는 공항 이름(코드) 3자리 입력" style="border: 1px solid #999999; padding:0; margin-top:0px; color: #201CB4;font-family: '굴림',gulim;height: 28px;line-height: 26px;width: 99%;">
														<input type="hidden" name="hid_INT_ArrAirport"     id="hid_INT_ArrAirport" >
														<input type="hidden" name="hid_INT_ArrArea"        id="hid_INT_ArrArea" >
														<input type="hidden" name="hid_INT_ArrCity"        id="hid_INT_ArrCity" >
														<input type="hidden" name="hid_INT_ArrCountry"     id="hid_INT_ArrCountry" >
													</span>
												</div>
											</div>

											<input type="hidden" name="INT_RT_departureDate" id="INT_RT_departureDate" value="2018-06-11">
											<input type="hidden" name="INT_RT_arrivalDate" id="INT_RT_arrivalDate" value="2018-06-11">
											<div class="each-positype-1" style="top:110px;min-height:36px;">
                                                <!-- 가는 날 - 달력 -->
												<div class="btnAR-calendar">
													<a class="btn_calendar CalendarBtn" href="#none" id="nextCalendarFocusA_A" title="" ><img alt="가는 날 달력 레이어 팝업 열기" src="/CW/images/btn/btn_calendar3.gif"></a>
													<input type="text" readonly="" class="text01 inputFocusin01" id="viewDate1_A" title="가는 날" value="2018-06-11">
												</div>
                                                <div class="CalendarBox" id="CalendarBox1_A" style="top:6px;" tabindex="-1"><!--KWCAG적용 -->
                                                    <div class="CalendarInner bg_start" id="sCalArea1_A"></div>
                                                    <a href="javascript:_cal_close('nextCalendarFocusA_A');" class="btn_close2"><img src="/CW/images/btn/btn_close2.gif" alt="가는날 달력 레이어 팝업 닫기"></a>
                                                </div>

                                                <!-- 오는 날 - 달력 -->
												<div class="btnAR-calendar" style="margin-left:0;margin-right:0;width:139px;" id="divINT_RT_ArrCalendar">
													<a class="btn_calendar CalendarBtn" href="javascript:" id="nextCalendarFocusB_A" title="" ><img alt="오는 날 달력 레이어 팝업 열기" src="/CW/images/btn/btn_calendar3.gif"></a>
													<input type="text" readonly="" class="text01 inputFocusin01" id="viewDate2_A" title="오는 날" style="width:99px;" value="2018-06-11">
												</div>
                                                <div class="CalendarBox" id="CalendarBox2_A" style="left:144px;" tabindex="-1"><!--KWCAG적용 -->
                                                    <div class="CalendarInner bg_arrival" id="sCalArea2_A"></div>
                                                    <a href="javascript:_cal_close();" class="btn_close2"><img src="/CW/images/btn/btn_close2.gif" alt="오는날 달력 레이어 팝업 닫기"></a>
                                                </div>
											</div>


											<div class="each-positype-2" style="top:146px;padding:0;">
												<!-- 탑승객 수 시작 -->
												<ul class="pp-cnt">
													<li>
														<select class="common-selectType-1" id="selectINTPaxADTCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;">
														
															<option value="1">성인1</option>
														
															<option value="2">성인2</option>
														
															<option value="3">성인3</option>
														
															<option value="4">성인4</option>
														
															<option value="5">성인5</option>
														
															<option value="6">성인6</option>
														
															<option value="7">성인7</option>
														
															<option value="8">성인8</option>
														
															<option value="9">성인9</option>
														
														</select>
														<label for="selectINTPaxADTCnt">(12세~)</label>
													</li>

													<li>
														<select class="common-selectType-1" id="selectINTPaxCHDCnt" name="selectINTPaxCHDCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;" onchange="javascript:validateByValue('selectINTPaxCHDCnt', checkPaxCntI)">
														
															<option value="0">소아0</option>
														
															<option value="1">소아1</option>
														
															<option value="2">소아2</option>
														
															<option value="3">소아3</option>
														
															<option value="4">소아4</option>
														
															<option value="5">소아5</option>
														
															<option value="6">소아6</option>
														
															<option value="7">소아7</option>
														
															<option value="8">소아8</option>
														
															<option value="9">소아9</option>
														
														</select>
														<label for="selectINTPaxCHDCnt">(2~11세)</label>

														<div class="main-helpType-1" style="display:inline-block;*display:inline;*zoom:1;">
															<a class="help" href="#none"><img alt="혼자 여행하는 소아 도움말" src="/CW/images/bl/bl_help.gif"></a>
															<!-- layerPopup -->
															<div class="abroadBox2 BoxClose">
																<div class="abroadInner">
																	<div class="aTitle">
																		<p>
																			<strong>혼자 여행하는 소아 안내</strong>
																		</p>
																	</div>
																	<div class="abroadCt">
																		보호자 비동반 만 15세 미만 탑승객은<br> 홈페이지에서 예약이 불가하오니, 이용을<br> 원하시는 경우 아시아나항공 예약센터<br> (1588-8000)에서 확인하시기 바랍니다.
																	</div>
																</div>
																<a href="#none" class="close"><img src="/CW/images/btn/btn_close.gif" alt="혼자 여행하는 소아 안내 팝업 닫기"></a>
															</div>
															<!-- //layerPopup -->
														</div>
													</li>

													<li class="last">
														<select class="common-selectType-1" id="selectINTPaxINFCnt" name="selectINTPaxINFCnt" style="padding:6px 6px 6px 3px;line-height:30px;height:30px;">
														
															<option value="0">유아0</option>
														
															<option value="1">유아1</option>
														
															<option value="2">유아2</option>
														
															<option value="3">유아3</option>
														
															<option value="4">유아4</option>
														
															<option value="5">유아5</option>
														
															<option value="6">유아6</option>
														
															<option value="7">유아7</option>
														
															<option value="8">유아8</option>
														
															<option value="9">유아9</option>
														
														</select>
														<label for="selectINTPaxINFCnt">(0~2세)</label>
													</li>
												</ul>
												<!-- 탑승객 수 끝 -->

												<!-- 나이 계산기 -->
												<div class="main-age-calculator"><span class="btnType10_3 btn_CpopupLayer" name="btnAgeCalcurate"><a href="#none"  title="나이계산기 새창으로 열기">나이계산기</a></span></div>
												<!-- //나이 계산기 -->
												
												<!-- <select id="selectCabinClass" class="common-selectType-1" style="padding:6px;line-height:30px;height:30px;width:214px;margin-top:3px;" title="좌석"> -->
												<select id="selectCabinClass" title="좌석" style="padding:6px;line-height:30px;height:30px;width:170px;margin-top:3px;" class="common-selectType-1"><!-- 20161101 -->
													<option value='T'>이코노미 클래스</option>
													<option value='B'>비즈니스 클래스</option>
													<option value='F'>퍼스트 클래스</option>
												</select>
											</div>
										</div>
										<!-- //왕복 -->

										<!-- 편도 -->
										<h4 name="TripType"><a href="#none" onfocus="moveINTContent(this)" TripType="OW" DOMINTType="I"><span>편도</span></a></h4>
										<!-- //편도 -->
									</div>
									<!-- 20150115 선택일 제어 -->
									<div class="Ybox-selection">
										<input type="radio" id="fareViewType_L" name="fareViewType" value="L" checked="checked">
										<span class="selec-text"><label for="fareViewType_L">선택일만 보기</label></span><br>
										<input type="radio" id="fareViewType_C" name="fareViewType" value="C">
										<span class="selec-text"><label for="fareViewType_C">+/- 3일 최저운임 보기</label></span>
									</div>
									<!-- //20150115 -->
									
									<!-- 20161101 -->
									<span class="btnType22" style="z-index:6;"><a href="/CW/ko/common/pageContent.do?pageId=PC_00002448" target="_blank">할인쿠폰 사용 안내</a></span>
									<!-- //20161101 -->								
								
									<div class="plan-textalign-right" style="position:absolute;top:255px;right:21px;z-index:5;"><span class="Sbtn_TType03_2" id="btnSearchAvailOfINT"><a href="#none" title="" >항공편 조회하기</a></span></div>
									<a class="btn-linkType-1 posiType-1" href="#none" id="btnSearchOJOfINT" style="display:block" title="국제선 항공권 예매 바로가기">기타</a>
								</div>
								<span class="Sbtn_TType07_3"><a href="/CW/ko/common/pageContent.do?pageId=PC_0574">마일리지항공권</a></span>
							</div>
						</div>
						<!-- //국제선 -->

						<!-- 체크인 -->
						<!-- 160622 cwh 사전좌석 수정 -->
						<!-- 좌석배정 탑승권 -->
						<div class="simple-each">
							<h3><a href="#none"><img src="/images/btn/btn_simpleNav05_off.png" alt="좌석배정 탑승권"></a></h3><!-- 160622 cwh 이미지 수정 alt 수정-->
							<div class="each">
								<div class="box-displayType-1">
									<div class="each-positype-2">

										<!-- 좌석배정 -->
										<h4 class="on" id="checkInOfPNRNo"><a href="#none" name="checkIn"><span>좌석배정</span></a></h4><!-- 160622 cwh 텍스트수정 -->
										<div class="box-displayType-2">											
											<div class="each-positype-1 H-type-1" style="min-height:30px;"><!-- 160622 cwh class="H-type-1" 추가 -->
												<!-- 160622 cwh 추가 -->
												<div class="box-mainSelWrap1">
													<input type="text" class="ipt-txt-1 ipt-width1" id="strLastName" title="성" value="" placeholder="성">
													<input type="text" class="ipt-txt-1 ipt-width2" id="strFirstName" title="이름" value="" placeholder="이름">
												</div>
												<input type="text" name="tmpSDateSeats1" id="tmpSDateSeats1" style="display:none">  <!-- 160622 cwh 달력 -->
												<div class="box-mainSelWrap1">
													<input type="text" class="ipt-txt-1 ipt-width3" id="reservationNum" title="예약 번호" value="" placeholder="예약 번호" maxlength="9">
													<div class="box-mainCalendar">

														<a href="javascript:_cal_open('2018-06-11', 'tmpSDateSeats1', 'viewDateSeats1', 'sCalAreaSeats1', 'CalendarBoxSeats1', 'CA', '탑승일 선택', 'CalendarBoxSeats1,CalendarBoxSeats2,CalendarBox1,CalendarBox2,CalendarBox1_A,CalendarBox2_A', 'nextCalendarSeatsA', 'S', 'tmpSDateSeats1', '', '', '');" id="nextCalendarSeatsA" class="btn-calendar"><img src="/images/btn/btn_seatsCalendar.jpg" alt="가는날 달력보기"></a>
														<!-- 달력 -->
														<div class="CalendarBox" id="CalendarBoxSeats1">
															<!-- 가는 날 - 달력 -->
															<div class="CalendarInner bg_start" id="sCalAreaSeats1">
															</div>
															<!-- //가는 날 - 달력 -->
															<a href="javascript:_cal_close('nextCalendarSeatsA');" class="btn_close2"><img src="/images/btn/btn_close2.gif" alt="가는날 달력 레이어 팝업 닫기"></a>
														</div>
														<!-- //달력 -->
														<input type="text" id="viewDateSeats1" class="ipt-txt-cal" title="가는날 달력날짜" value="2018-06-11">
													</div>
												</div>
												<div class="box-mainSelWrap1">
													<input type="image" id="btn_NL_DepAirport_Search" class="ipt-img-1 btnSend btn_CpopupLayer" alt="출발 도시보기" src="/images/btn/btn_seatsSearch.jpg">
													<input type="text"   name="txt_NL_DepAirportName" id="txt_NL_DepAirportName" class="ipt-txt-2" title="도시 또는 공항 이름(코드) 3자리 입력" value="도시 또는 공항 이름(코드) 3자리 입력">
													<input type="hidden" name="hid_NL_DepAirport"     id="hid_NL_DepAirport" >
													<input type="hidden" name="hid_NL_DepArea"        id="hid_NL_DepArea" >
													<input type="hidden" name="hid_NL_DepCity"        id="hid_NL_DepCity" >
													<input type="hidden" name="hid_NL_DepCountry"     id="hid_NL_DepCountry" >
												</div>
												<div class="box-mainSelWrap1">
													<input type="image" id="btn_NL_ArrAirport_Search" class="ipt-img-1 btnSend btn_CpopupLayer" alt="도착 도시보기" src="/images/btn/btn_seatsSearch.jpg">
													<input type="text"   name="txt_NL_ArrAirportName" id="txt_NL_ArrAirportName" class="ipt-txt-2" title="도시 또는 공항 이름(코드) 3자리 입력" value="도시 또는 공항 이름(코드) 3자리 입력">
													<input type="hidden" name="hid_NL_ArrAirport"     id="hid_NL_ArrAirport" >
													<input type="hidden" name="hid_NL_ArrArea"        id="hid_NL_ArrArea" >
													<input type="hidden" name="hid_NL_ArrCity"        id="hid_NL_ArrCity" >
													<input type="hidden" name="hid_NL_ArrCountry"     id="hid_NL_ArrCountry" >
												</div>
												<ul class="list-mainInfo1">
													<li><strong>이용가능시간</strong>
														<ul>
															<li>국제선: 출발 361일 전~48시간 전</li>
															<li>국내선: 출발 30일 전~48시간 전</li>
														</ul>
													</li>
												</ul>
												<div class="btn-inquiry-wrap"><span class="Sbtn_TType03_2"><a href="#none" id="noLoginSearch">예약 조회</a></span></div>
												<!-- //160622 cwh 추가 -->
											</div>
										</div>
										<!-- //좌석배정 -->

										<!-- 탑승권 발급 -->
										<h4 id="checkInOfTicketNo"><a href="#none" name="checkIn"><span>체크인</span></a></h4><!-- 160622 cwh 텍스트수정 -->
										<div class="box-displayType-2">
											<div class="each-positype-1 H-type-1" style="min-height:30px;"><!-- 160622 cwh class="H-type-1" 추가 -->
												<ul class="list-mainRadio1">
													<li><input type="radio" name="checkInType" id="checkInType1" checked="checked"><label for="checkInType1"><strong>예약 번호</strong>(8자리 숫자 또는 6자리 영문/숫자)</label></li>
													<li><input type="radio" name="checkInType" id="checkInType2"><label for="checkInType2"><strong>항공권 번호</strong>(988로 시작하는 13자리 숫자)</label></li>
												</ul>
												<div class="box-mainSelWrap1">
													<!-- 예약 번호 일경우 -->
													<input type="text" class="ipt-txt-1 ipt-width4" id="txt_pnrNoOfCheckIn" title="예약 번호 입력" value="예약 번호" placeholder="예약 번호">
													<!-- //예약 번호 일경우 -->
													<!-- 항공권 번호 일경우 -->
													<input type="text" class="ipt-txt-1 ipt-width4" id="txt_ticketNumberOfCheckIn" title="항공권 번호 입력" style="display:none;" value="항공권 번호" placeholder="항공권 번호">
													<!-- //항공권 번호 일경우 -->
												</div>
												<input type="text" name="tmpSDateSeats2" id="tmpSDateSeats2" style="display:none">  <!-- 160622 cwh 달력 -->
												
												<div class="selectBox">
													<select title="출발일" style="padding:6px;line-height:30px;height:30px;" class="common-selectType-1" id="checkInNoDate" name="select_checkIn_dateBox">
														<option value="0000/00/00">출발일 선택</option>
														<option value='20180610'>2018/06/10</option>
<option value='20180611'>2018/06/11</option>
<option value='20180612'>2018/06/12</option>
<option value='20180613'>2018/06/13</option>

													</select>
												</div>
												<ul class="list-mainInfo1">
													<li>
														<ul>
															<li>- 이용가능시간 : 출발 48시간 전 ~ 1시간 전<BR>&nbsp;&nbsp;(단, 미주노선은 출발 24시간 전부터 가능)</li>
															<li>- 브라우저의 팝업 차단 해제 후 이용</li>
														</ul>
													</li>
												</ul>
												<div class="btn-login-wrap">
													<a href="http://flyasiana.com/I/ko/CheckInList.do" class="btn-linkType-1" name="btn_checkIn_List"> 로그인조회</a>
												</div>
												<div class="btn-inquiry-wrap"><span class="Sbtn_TType03_2" name="btn_checkIn_continue"><a href="#none">예약 조회</a></span></div>
												<!-- //160622 cwh 추가 -->
											</div>
										</div>
										<!-- //탑승권 발급 -->

									</div>								
								</div>
							</div>
						</div>
						<!-- //좌석배정 탑승권 -->
						<!-- //160622 cwh 사전좌석 수정 -->
						<!-- //체크인 -->
						
						<!-- 예약 확인 -->
						<div class="simple-each">
							<h3><a href="#none" onclick="moveReservationList();"><img src="/CW/images/btn/btn_simpleNav04_off.png" alt="예약 확인"></a></h3>
						</div>

						<!-- //예약 확인 -->
					</div>
				</div>
			</section>
			<input type="hidden" name="departureDateOfCalurate" id="departureDateOfCalurate">
			<input type="hidden" name="domIntTypeOfCalurate" id="domIntTypeOfCalurate">
			<input type="hidden" name="sessionUniqueKey" id="sessionUniqueKey">	
			<form id='selDepForm' name='selDepForm' method='post'>
				<input type='hidden' name='airportList'   id='airportList' value=''/>
				<input type='hidden' name='checkInData'   id='checkInData' value=''/>
				<input type='hidden' name='departureDate' id='departureDate' value=''/>
				<input type='hidden' name='pnrNo'   	  id='pnrNo' value=''/>
				<input type='hidden' name='interimFlag'   id='interimFlag' value=''/>
			</form>
			<form id='chkInform' name='chkInform' method='post'>
				<input type='hidden' name='checkIN'   id='checkIN' value=''/>
				<input type="hidden" name="selectBtn" id='selectBtn' value="pnrNumber"><!-- 티켓번호 -->
				<input type='hidden' name='langCode'  id='langCode' value=''/>
				<input type='hidden' name='type' 	  id='type' value='B'/>
				<input type='hidden' name='q' 		  id='q' value=''/>
			</form>
			<form id='ssciForm' name='ssciForm' method='post'>
				<input type='hidden' name='ln' 	  					id='ln' 					value=''/>
				<input type='hidden' name='IDepartureDate'   		id='IDepartureDate' 		value=''/>
				<input type='hidden' name='IIdentification'  		id='IIdentification' 		value=''/>
				<input type="hidden" name="IFormOfIdentification" 	id='IFormOfIdentification' 	value='PNR'/>
			</form>
			<form id="noLoginForm" name="noLoginForm" method="post">
				<input type="hidden" id="movePage" name="movePage" value="">
				<input type="hidden" id="hidPnrDetailData" name="hidPnrDetailData" value="">
				<input type="hidden" id="hidJsessionId" name="hidJsessionId" value="">
				<input type="hidden" id="loginType" name="loginType" value="0">
			</form>
			<!-- //20130830 수정 -->
			<!-- //액센츄어 개발 -->
			<!-- //main-simple-control -->
</body>
</html>