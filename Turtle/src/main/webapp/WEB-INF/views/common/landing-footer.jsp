<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<c:if test="${ !empty message }">
    <script>
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
</c:if> 


<!-- ====================== 최종작업용 footer ====================== -->
<footer id="footer" class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-md-12 footer-info">
                    <!-- 로고 및 글씨 -->
                    <a href="${contextPath}" class="logo align-items-center">
                        <img src="${contextPath}/resources/images/logo/turtleLogo.png" alt="안보여요">
                        <div class="footerLogo">TURTLE</div>
                    </a>
                    <!-- 회사정보 (주소.대표자.전화.이메일 등등) -->
                    <div class="footer-info">
                        <p><b>주소</b>&nbsp;&nbsp;서울특별시 강남구 테헤란로14길 6 남도빌딩 2F</p>
                        <h6></h6>
                        <p><b>대표자</b>&nbsp;&nbsp;조미현&nbsp;&nbsp;&nbsp;&nbsp;<b>전화</b>&nbsp;&nbsp;1588-8181&nbsp;&nbsp;&nbsp;&nbsp;<b>이메일</b>&nbsp;&nbsp;turtle@turtle.com</p>
                        <h6></h6>
                        <p><b>사업자등록번호</b>&nbsp;&nbsp;123-81-45678&nbsp;&nbsp;&nbsp;&nbsp;<b>통신판매업신고번호</b>&nbsp;&nbsp;2023-서울강남-0081</p>
                    </div>
                    
                    <!-- 이용약관 링크 -->
                    <div class="copyright">
                        <a href="${contextPath}/etc/terms"><span><b>서비스 이용약관</b></span></a>&nbsp;&nbsp;&nbsp;
                        <a href="${contextPath}/etc/terms"><span><b>개인정보 처리방침</b></span></a>&nbsp;&nbsp;&nbsp;
                        <a href="${contextPath}/etc/terms"><span><b>전자금융거래 이용약관</b></span></a>&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        &copy; Copyright <strong>TURTLE</strong>. All Rights Reserved
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
 