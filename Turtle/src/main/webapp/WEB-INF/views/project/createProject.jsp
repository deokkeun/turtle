<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" class="h">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta content="" name="description">
    <meta content="" name="keywords">
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
    
    <link rel="stylesheet" href="${contextPath}/resources/css/createProject.css">
    <script src="https://kit.fontawesome.com/0041fb1dcb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
     <!--섬머노트 전용 css-->
     <link rel="stylesheet" href="${contextPath}/resources/css/summernote/summernote-lite.css">
    
     
    <title>프로젝트 생성</title>
</head>
<body>
   
   <main>
    <jsp:include page="/WEB-INF/views/common/landing-header.jsp" />     
   
    

    <section>
        <div class="section1">
            <i class="fa-solid fa-users-between-lines">프로젝트 관리</i>
        </div>
        <form action="createProject" method="post" enctype="multipart/form-data">
            <div class="section2">
                <p>프로젝트명 입력</p>
                <div>
                    <span id="emoji_btn2" class="projectEmoji"><i class="fa-regular fa-face-smile"></i></span>
                    <script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script>
                    <input type="text" id="projectName" name="projectName" placeholder="프로젝트명을 입력해주세요.">
                </div>
            </div>
            <div class="section2">
            	<p>프로젝트 설명</p>
            </div>
            <textarea id="summernote" name="projectDescription"></textarea>
             <div class="next-btn">
                <button type="submit">다음</button>
       		 </div>     

            <input type="hidden" id="emoji_value" name="projectEmoji" value="">
        </form>
        
  
        


    </section>
    
</main>
   
    <script>
            const contextPath = "${contextPath}";
    </script>
    <script src="${contextPath}/resources/js/createProject.js"></script>
    <!-- 섬머노트 -->
    <script src="${contextPath}/resources/js/summernote/summernote-lite.js"></script>
    <script src="${contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

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