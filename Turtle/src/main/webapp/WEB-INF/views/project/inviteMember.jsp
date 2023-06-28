<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/inviteMember.css">
    <!-- Favicons -->
  	<link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
  	<link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
  	<!-- Vendor CSS Files -->
	<link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/landing-header.css" />

    <script src="https://kit.fontawesome.com/0041fb1dcb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    <title>Document</title>
</head>
<body>
    <main>  
        <jsp:include page="/WEB-INF/views/common/landing-header.jsp" />   
        <section>
            <div class="section1">
                <i class="fa-solid fa-user-plus">프로젝트 초대</i>
            </div>

            <div class="pop">
                <div class="pop-content">
                    
                    <div>
                        <div class="user-content">
                            <div class="select">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <input type="text" placeholder="이름/이메일을 입력해주세요."id="search-txt" class="searchmember">
                            </div>
                            <div class="search-mem">
                               
                            </div>
                        </div>
                        
                        <form action="invitedMember" method="post">
                            <div class="user-checked">
                            
                            
                            </div>
                            <button class="uc-btn">초대하기</button>
                        </form>
                        
                    </div>
                </div>
                
            </div>
            
           

        </section>


        <a class="next-btn" href="createWorkspace">다음</a>
    </main>
    
    <script>
        const contextPath = "${contextPath}";
    </script>

    <script src="${contextPath}/resources/js/inviteMember.js"></script>
    
    <!-- Vendor JS Files -->	  
	<script src="${contextPath}/resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>
    <!-- landing2.js (프론트 최종작업용) 연결 -->
    <script src="${contextPath}/resources/js/landing2.js"></script>
</body>
</html>