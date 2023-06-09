<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turtle</title>
	<!-- main-style.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
	<!-- calendar.css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/calendar/calendar.css">
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/881d1deef7.js" crossorigin="anonymous"></script>
	<!-- fullcalendar -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script src="${contextPath}/resources/js/calendar/ko.global.js"></script>
</head>
<body>
    <main>
 		<!-- header include -->
       	<jsp:include page="/WEB-INF/views/common/header.jsp" />

        <section>
          <div id='external-events'>
            <p>
              <strong>아래 일정을 드래그하여 배정하세요.</strong>
            </p>
            
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
              <div class='fc-event-main'>일정 1</div>
            </div>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
              <div class='fc-event-main'>일정 2</div>
            </div>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
              <div class='fc-event-main'>일정 3</div>
            </div>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
              <div class='fc-event-main'>일정 4</div>
            </div>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
              <div class='fc-event-main'>일정 5</div>
            </div>
            
            <p>
              <input type='checkbox' id='drop-remove' />
              <label for='drop-remove'>드래그 앤 드롭 후 제거</label>
            </p>
          </div>
        </section>
          
          <section>
            <button onclick="allSave()">전체 저장</button>
          </section>
          
          <!-- calendar -->
          <section id="calendar-box">
            <div id='calendar'></div>
          </section>
          




        <!-- 일정 추가 모달창 -->
        <section id="calendar-modal">
          <div>
            일정
            <input type="text" class="inputValue" placeholder="Enter new To-do">
            시작일
            <input type="date" class="startDate">
            종료일
            <input type="date" class="endDate">
            <button onclick="addEvent()">일정 추가</button>
          </div>
          <!-- 일정 추가 모달 닫기 -->
          <a class="calendar-modal-close fa-solid fa-xmark"></a>
        </section>




    </main>

    <!-- footer include -->
   	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <!-- calendar.js 연결 -->
    <script src="${contextPath}/resources/js/calendar/calendar.js"></script>
</body>
</html>