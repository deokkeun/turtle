<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
    <!-- payList -->
    <link href="${contextPath}/resources/css/payment/payList.css" rel="stylesheet">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
     <!-- Favicons -->
    <link href="${contextPath}/resources/favicon/favicon-16x16.png" rel="icon">
    <link href="${contextPath}/resources/favicon/apple-icon-60x60.png" rel="apple-touch-icon">
</head>
<body>

	<!-- header include -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main id="main" class="main">
    
        <section id="payList-content">

            <section>
                <div>결제 내역</div>
                <hr>
            </section>
    

            <section>
                <table id="payList-table">
                    <thead id="payList-table-head">
                        <tr>
                            <th>결제 번호</th>
                            <th>상품명</th>
                            <th>구매자</th>
                            <th>결제 금액</th>
                            <th>결제일</th>
                            <th>만료일</th>
                        </tr>
                    </thead>
                    <tbody id="payList-table-body">
                        <c:forEach var="pay" items="${payList}">
                            <tr>
                                <td>${pay.payNo}</td>
                                <td>${pay.expireType}</td>
                                <td>${pay.payName}</td>
                                <td>${pay.price}</td>
                                <td>${pay.payRegDate}</td>
                                <td>${pay.expireDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>

        </section>
            
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
    <!-- <script src="${contextPath}/resources/js/payment/pay.js"></script> -->
    <!-- chat js -->
    <!-- <script src="${contextPath}/resources/js/chat.js"></script> -->
</body>
</html>