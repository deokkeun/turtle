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
<body>

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
                    <!-- <h2>규모에 따라 다양한 요금제로</h2> -->

                    <div>workspaceCount = ${workspaceCount}</div>
                    <div>projectMemberCount =  ${projectMemberCount}</div>
                    <div>paymentType =  ${paymentType}</div>
                    <div>${paymentType.payNo}</div>
                    <div>${paymentType.projectNo}</div>
                    <div>${paymentType.payType}</div>
                    <div>${paymentType.payRegDate}</div>
                    <div>${paymentType.payName}</div>
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

                    <!-- Standard 요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="200">
                        <div class="box">
                            <span class="featured">best</span>
                            <h3 style="color: #65c600;" class="pay-type" value="Standard">Standard</h3>
                            <div class="price" value="8900"><sup>￦</sup>8,900<span> / 월</span></div>
                            
                            <c:choose>
                                <c:when test="${paymentType.payType == 'Standard' || paymentType.payType == 'Pro'}">
                                    <button class="btn-buy-using" disabled>사용중</button>
                                </c:when>
                                <c:otherwise>
                                    <button onclick="requestPay()" class="btn-buy">가입하기</button>
                                </c:otherwise>
                            </c:choose>

                            <div class="intro">
                                <p>프로젝트를 여러팀과 진행하는</p>
                                <p><b>중간 규모팀에 추천</b>합니다</p>
                            </div>
                            <ul>
                                <!-- <li><i class="fa-solid fa-check"></i>프로젝트 <span>5</span>개 생성</li> -->
                                <li><i class="fa-solid fa-check"></i>워크스페이스 최대 5개 생성</li>
                                <li><i class="fa-solid fa-check"></i>멤버 초대 최대 10명</li>
                                <!-- <li><i class="fa-solid fa-check"></i>Basic + 그룹별 채팅방 5개 생성 가능</li> -->
                            </ul>
                        </div>
                        <input type="hidden" name="memberName" value="${loginMember.memberName}">
                    </div>

                    <!-- Pro요금제 -->
                    <div class="col-sm-4" data-aos="zoom-in" data-aos-delay="400">
                        <div class="box">
                            <h3 style="color: #ff0071;" class="pay-type" value="Standard">Pro</h3>
                            <div class="price" value="12900"><sup>￦</sup>12,900<span> / 월</span></div>

                            <c:choose>
                                <c:when test="${paymentType.payType != 'Pro'}">
                                    <button onclick="requestPay()" class="btn-buy">가입하기</button>
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
                                <!-- <li><i class="fa-solid fa-check"></i> 프로젝트 <span></span>무제한 생성</li> -->
                                <li><i class="fa-solid fa-check"></i> 워크스페이스 무제한 생성</li>
                                <li><i class="fa-solid fa-check"></i> 멤버 초대 제한 없음</li>
                                <!-- <li><i class="fa-solid fa-check"></i> Basic + 그룹별 채팅방 무제한 생성</li> -->
                            </ul>
                        </div>
                    </div>

                </section>

            </div>
        </section>
        <!-- End Pricing Section -->

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
    <!-- iamport -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- chat js -->
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
</body>
</html>