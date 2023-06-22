<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
    <!-- pay -->
	<link rel="stylesheet" href="${contextPath}/resources/css/payment/pay.css" />
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
</head>
<body id="body">

	<!-- header include -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main id="main" class="main">


        <input type="hidden" id="projectNo" value="1">

        <!-- ======= pricing Section ======= -->
        <section id="pricing" class="pricing">

            <div class="container" data-aos="fade-up">

                <header class="section-header">
                    <p>팀 규모에 따라</p>
                    <p>다양한 <span>요금제</span>로 사용해보세요</p>
                </header>

                <section class="row gy-4" data-aos="fade-left">

                    <!-- 무료요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="100">
                        <div class="box">
                            <h3 style="color: #07d5c0;">Basic</h3>
                            <div class="price"><sup></sup>무료<span></span></div>
                            <button onclick="test()" class="btn-buy-using" disabled>사용중</button>
                            <div class="intro">
                                <p>협업툴을 처음으로 사용해보는</p>
                                <p class="intro2"><b>소규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <!-- <li><i class="fa-solid fa-check"></i>프로젝트 1개 생성</li> -->
                                <li><i class="fa-solid fa-check"></i>워크스페이스 최대 3개 생성</li>
                                <li><i class="fa-solid fa-check"></i>멤버 초대 최대 5명</li>
                                <!-- <li><i class="fa-solid fa-check"></i>기초 단체 채팅방, 개인 채팅방 제공 </li> -->
                            </ul>
                        </div>
                    </div>

                    <c:if test="${workspaceCount <= 3 && projectMemberCount <= 5}"></c:if>
                    <!-- Standard 요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="200">
                        <div class="box">
                            <span class="featured">best</span>
                            <h3 style="color: #65c600;">Standard</h3>
                            <div class="price"><sup>￦</sup>8,900<span> / 월</span></div>
                            
                            <c:choose>
                                <c:when test="${paymentType.payType == 'Standard' || paymentType.payType == 'Pro'}">
                                    <button class="btn-buy-using" disabled>사용중</button>
                                </c:when>
                                <c:otherwise>
                                        <button onclick="requestPay('Standard')" class="btn-buy">가입하기</button>
                                </c:otherwise>
                            </c:choose>

                            <div class="intro">
                                <p>프로젝트를 여러팀과 진행하는</p>
                                <p><b>중간 규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <li><i class="fa-solid fa-check"></i>워크스페이스 최대 5개 생성</li>
                                <li><i class="fa-solid fa-check"></i>멤버 초대 최대 10명</li>
                            </ul>
                        </div>
                        <input type="hidden" name="memberName" value="${loginMember.memberName}">
                    </div>

                    <c:if test="${workspaceCount > 5 && projectMemberCount > 10}"></c:if>
                    <!-- Pro요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="400">
                        <div class="box">
                            <h3 style="color: #ff0071;">Pro</h3>
                            <div class="price"><sup>￦</sup>12,900<span> / 월</span></div>

                            <c:choose>
                                <c:when test="${paymentType.payType != 'Pro'}">
                                    <button onclick="requestPay('Pro')" class="btn-buy">가입하기</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn-buy-using" disabled>사용중</button>
                                </c:otherwise>
                            </c:choose>
                            <div class="intro">
                                <p>조직을 운영하는</p>
                                <p><b>대규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <li><i class="fa-solid fa-check"></i> 워크스페이스 무제한 생성</li>
                                <li><i class="fa-solid fa-check"></i> 멤버 초대 제한 없음</li>
                            </ul>
                        </div>
                    </div>

                </section>
            </div>
        </section>
        <!-- End Pricing Section -->




         <!-- 결제 모달창 -->
        <article id="pay-modal">
            
                <div class="modal__container">
                  <div class="modal__featured">
                    <div class="modal__circle">

                            <div class="modal__circle_box">
                                <h2 id="pay-modal-type" style="color: #1A73E8;">결제타입</h2>
                                <div class="pricing">
                                    <span><sup>￦</sup><div id="pay-modal-price" class="price"></div> / 월</span>
                                </div>

                                <div id="fromTo">
                                    <c:if test="${paymentType.payType == 'Standard' || paymentType.payType == 'Pro'}">
                                        <span id="from-date"></span><span id="to-date"></span>
                                    </c:if>
                                </div>
    
                                <div id="pay-modal-intro" class="intro">
                                    <p>프로젝트를 여러팀과 진행하는</p>
                                    <p><b>중간 규모팀에 추천</b>합니다</p>
                                </div>
                                <div>
                                    <div>
                                        <i class="fa-solid fa-check"></i><span id="pay-modal-workspace"> 워크스페이스 최대 5개</span>
                                    </div>
                                    <div>
                                        <i class="fa-solid fa-check"></i><span id="pay-modal-member"> 멤버 초대 최대 10명</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    


                  <div class="modal__content">
                    <h2>Your payment details</h2>
            
                        <ul class="form-list">
                            
                            <li class="form-list__row">
                                <label id="emailMessage">이메일</label>
                                <input id="memberEmail" type="email" autocomplete="false"/>
                            </li>
                            <li class="form-list__row">
                                <label id="nameMessage">이름</label>
                                <input id="memberName" type="text" autocomplete="false"/>
                            </li>
                            <li class="form-list__row">
                                <label id="telMessage">전화번호</label>
                                <div>
                                    <input id="memberTel" type="tel" autocomplete="false"/>
                                </div>
                            </li>
                            <li class="pay-btn-box">
                                <button class="pay-btn" onclick="pay()">결제</button>
                            </li>
                        </ul>
                  </div> <!-- END: .modal__content -->
                </div> <!-- END: .modal__container -->

            <!-- 결제 모달 닫기 -->
            <a class="pay-modal-close fa-solid fa-xmark"></a>
        </article> 



        <input type="text" id="memberNo" value="${loginMember.memberNo}">
        <input type="text" id="projectNo" value="${projectNo}">
        <div>workspaceCount = ${workspaceCount}</div>
        <div>projectMemberCount =  ${projectMemberCount}</div>
        <div>paymentType =  ${paymentType}</div>
        <div>${paymentType.payNo}</div>
        <div>${paymentType.projectNo}</div>
        <div>${paymentType.payType}</div>
        <div>${paymentType.payRegDate}</div>
        <div>${paymentType.payName}</div>
        <input id="loginMember" type="hidden" value="${loginMember}">


    </main>
    <script>
      const contextPath = "${contextPath}";
    </script>
    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- pay.js 연결 -->
    <script src="${contextPath}/resources/js/payment/pay.js"></script>
    <!-- post -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- iamport -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- chat js -->
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
</body>
</html>