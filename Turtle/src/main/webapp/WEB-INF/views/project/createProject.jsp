<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/createFroject.css">
    <script src="https://kit.fontawesome.com/0041fb1dcb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>프로젝트 생성</title>
</head>
<body>
    <nav>
        <div class="logo-wrapper">
            <a class="logo"><img src="${contextPath}/resources/images/createWorkspace/LogoMakr-4qQRS5.png"></a>
        </div>


        <ul class="nav-links">
            <li><a href="#">소개</a></li>
            <li><a href="#">요금제</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
        


        <ul class="nav-links2">
            <li><a href="#"><i class="fa-regular fa-bell"></i></a></li> 
            <li><a href="#"><i class="fa-regular fa-circle-user"></i></a></li> 
        </ul>
    
        <a href="#" class="bar">
            <i class="fa-solid fa-bars"></i>
        </a>
    </nav>


    <section>
        <div class="section1">
            <i class="fa-solid fa-users-between-lines">프로젝트 관리</i>
        </div>

        <div class="section2">
            <p>프로젝트명 입력</p>
            <input type="text" placeholder="프로젝트명을 입력해주세요.">
        </div>

        <div class="section3">
            <p>프로젝트멤버 관리</p>
            <button class="btn">초대하기<i class="fa-solid fa-user-plus"></i></button>
          
        </div>
        
        <div class="pop">
            <div class="pop-content">
                <div><i class="fa-solid fa-users">프로젝트멤버 초대하기</i></div>
                <div>
                    <div class="user-content">
                        <div class="select">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <input type="text" placeholder="이름/이메일을 입력해주세요."id="search-txt" class="searchmember">
                        </div>
                        <div class="search-mem">
                           
                        </div>
                    </div>

                    <div class="user-checked">
                       
                       
                    </div>
                    <a class="uc-btn">완료</a>
                </div>
            </div>
            
        </div>
        <form>
            <div class="invited-member">

            </div>
        </form>

        <div class="next-btn">
            <a class="next-btn" href="createWorkspace">다음</a>
        </div>

    </section>
    <script src="${contextPath}/resources/js/createFrofject.js"></script>
</body>
</html>