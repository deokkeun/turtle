
//-----------------------------------------------------------

// 모달
function modal(id) {
  var zIndex = 9999;
  var modal = document.getElementById(id);

  // 모달 div 뒤에 희끄무레한 레이어
  var bg = document.createElement('div');
  bg.setAttribute("id", "bg");
  bg.setStyle({
      position: 'fixed',
      zIndex: zIndex,
      left: '0px',
      top: '0px',
      width: '100%',
      height: '100%',
      overflow: 'auto',
      // 레이어 색갈은 여기서 바꾸면 됨
      backgroundColor: 'rgba(0,0,0,0.4)'
  });
  document.body.append(bg);


  // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
  modal.querySelector('.calendar-modal-close').addEventListener('click', function() {
    bg.remove();
    modal.style.display = 'none';
  });

  // 배경 레이어 클릭 시 모달 닫기
  bg.addEventListener('click', function() {
    bg.remove();
    modal.style.display = 'none';
  });

  modal.setStyle({
      position: 'fixed',
      display: 'block',
      boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

      // 시꺼먼 레이어 보다 한칸 위에 보이기
      zIndex: zIndex + 1,

      // div center 정렬
      top: '50%',
      left: '50%',
      transform: 'translate(-50%, -50%)',
      msTransform: 'translate(-50%, -50%)',
      webkitTransform: 'translate(-50%, -50%)'
  });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
  for (var k in styles) this.style[k] = styles[k];
  return this;
};


// ------------------------------------------------------------------------------------------

const memberNo = document.getElementById("memberNo");
var inputValue = document.querySelector(".inputValue");
var startDate = document.querySelector(".startDate");
var endDate = document.querySelector(".endDate");
var textarea = document.querySelector("#textarea");
var BgColor = "#1A73E8";

// 색상 추출
$(".BgColor").click(function() {
  BgColor = $(this).attr("value");
  $(this).siblings().css("border", "2px solid #939597");
  $(this).css("border", "2px solid red");
});


const calNo = document.getElementById("calNo");
const projectNo = document.getElementById("projectNo");
const workspaceNo = document.getElementById("workspaceNo");

var calendar = null;

document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    // var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');

    // initialize the external events
    // -----------------------------------------------------------------

   
   console.log(projectNo.value);
   console.log(workspaceNo.value);
   

   var all_events = null;
   all_events = loadingEvents(); // 함수 호출

  // alert("all_events 호출" + all_events);
  console.log(all_events);


// all_events 배열 순회(날짜 형식 변환)
for (let i = 0; i < all_events.length; i++) {
  const event = all_events[i];
  
  // start 날짜 형식 변경
  const startDate = parseDate(event.start);
  const formattedStartDate = formatDate(startDate);
  event.start = formattedStartDate;

  // end 날짜 형식 변경
  const endDate = parseDate(event.end);
  const formattedEndDate = formatDate(endDate);
  event.end = formattedEndDate;
}

console.log(all_events);

// 날짜 문자열을 파싱하여 Date 객체 반환
function parseDate(dateString) {
  const parts = dateString.split(' ');
  const month = parseMonth(parts[0]);
  const day = parseInt(parts[1].replace(',', ''));
  const year = parseInt(parts[2]);
  return new Date(year, month, day);
}

// 월 문자열을 해당하는 숫자로 파싱하여 반환
function parseMonth(monthString) {
  const months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  return months.findIndex(month => month === monthString);
}

// 날짜 객체를 yyyy-mm-dd 형식의 문자열로 변환하여 반환
function formatDate(date) {
  const year = date.getFullYear();
  const month = padZero(date.getMonth() + 1);
  const day = padZero(date.getDate());
  return `${year}-${month}-${day}`;
}

// 숫자를 2자리로 패딩하여 반환
function padZero(number) {
  return number.toString().padStart(2, '0');
}


    // new Draggable(containerEl, {
    //   itemSelector: '.fc-event',
    //   eventData: function(eventEl) {
    //     return {
    //       title: eventEl.innerText
    //     };
    //   }
    // });


    // initialize the calendar
    // -----------------------------------------------------------------

    // 삭제 시 id값 사용
    var defId = 0;

    // 버튼 컨트롤
    const visibilityBtn = document.getElementById("visibility-btn");
    const addEventBtn = document.getElementById("addEvent-btn");
    const updateEventBtn = document.getElementById("updateEvent-btn");
    const deleteEventBtn = document.getElementById("deleteEvent-btn");


    calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'  // ,timeGridWeek,timeGridDay 주, 일 (시간)
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      // events: all_events,
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }

        alert('ok');
        setTimeout(function() {
          addEvent();

        }, 1000);


      },
      locale: 'ko',
      dateClick: function(info) {
        // alert('Date: ' + info.dateStr);
        // alert('Resource ID: ' + info.resource.id);

        console.log(info);

        // 일정 추가,수정,삭제버튼 컨트롤
        visibilityBtn.style.display = "block";
        addEventBtn.style.display = "block";
        updateEventBtn.style.display = "none";
        deleteEventBtn.style.display = "none";

        // 초기화
        reset();


        startDate.value = info.dateStr;
        // 모달창 띄우기
        modal("calendar-modal");

      
      },eventClick: function(info) {

        // 선택된 일정 아이디 저장
        defId = info.event._instance.defId;

        // alert('Event: ' + info.event.title);
        // alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
        // alert('View: ' + info.view.type);
        // alert('startDate: ' + info.event.startStr);
        // alert('endDate: ' + info.event.endStr);

        // 일정 추가,수정,삭제버튼 컨트롤
        visibilityBtn.style.display = "none";
        addEventBtn.style.display = "none";
        updateEventBtn.style.display = "block";
        deleteEventBtn.style.display = "block";

        // 일정 수정
        updateEventBtn.addEventListener("click", function() {
          if (info.event._instance.defId == defId) {

            if(confirm("'" + info.event.title + "' 일정을 수정하시겠습니까?")) {
              
              const updateEvent = {
                "calNo" : info.event.id, // 일정 ID 번호
                "pmNo" : projectNo.value,// 프로젝트 멤버 번호
                "workspaceNo" : workspaceNo.value,// 워크스페이스 번호
                "calTitle" : inputValue.value,// 캘린더 제목
                "calContent" : textarea.value, // 캘린더 내용
                "calColor" : BgColor,// 배경 색상
                "startDate" : startDate.value, // 일정 시작일
                "endDate" : endDate.value,// 일정 종료일
                "calSt" : "N" // 일정 삭제 여부
              }

            // 모달창 제거
            var modal = document.getElementById("calendar-modal");
            let removeBg = document.getElementById("bg");
            // 모달 div 뒤에 희끄무레한 레이어
            modal.style.display = 'none';
            removeBg.remove();


            console.log(updateEvent);
            // JSON.stringify(객체) : JS Object -> JSON
            console.log(JSON.stringify(updateEvent));

            calendarSock.send(JSON.stringify(updateEvent));

            // 초기화
            reset()

            }
          }
        })
        

        // 일정 삭제
        deleteEventBtn.addEventListener("click", function () {

          if (info.event._instance.defId == defId) {
            if (confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")) {

              const deleteEvent = {
                "calNo" : info.event.id, // 일정 ID 번호
                "pmNo" : projectNo.value,// 프로젝트 멤버 번호
                "workspaceNo" : workspaceNo.value,// 워크스페이스 번호
                "calTitle" : info.event.title, // 일정 제목
                "calSt" : "Y" // 일정 삭제 여부
              }
              console.log(deleteEvent);

              // 확인 클릭 시 일정 화면에서 제거
              info.event.remove();
              
              // 모달창 제거
              var modal = document.getElementById("calendar-modal");
              let removeBg = document.getElementById("bg");
              // 모달 div 뒤에 희끄무레한 레이어
              modal.style.display = 'none';
              removeBg.remove();


              // DB 일정 상태 변경 삭제하기
              console.log(JSON.stringify(deleteEvent));
              calendarSock.send(JSON.stringify(deleteEvent));


              // 초기화
              reset();

            }
            return true;
          }
        });

        console.log(info.event);

        // 캘린더 번호로 확인 하기

        // 선택한 이벤트(제목, 시작일, 종료일)
        calNo.value = info.event.id;
        inputValue.value = info.event.title;
        startDate.value = info.event.startStr;
        endDate.value = info.event.endStr;
        textarea.value = info.event._def.extendedProps.content;
        BgColor = info.event._def.ui.backgroundColor;

        const selectColor = document.getElementsByClassName("BgColor");
        for(let i = 0; i < selectColor.length; i++) {
          if(BgColor == selectColor[i].getAttribute("value")) {
            const siblings = Array.from(selectColor[i].parentNode.children);
            siblings.forEach((sibling) => {
              sibling.style.border = "2px solid #939597";
            });
            selectColor[i].style.border = "2px solid red";
          }
        }

        // 모달창 열기
        modal("calendar-modal");

        // change the border color just for fun
        // info.el.style.borderColor = '#d93025';
        // info.el.style.backgroundColor = '#d93025';
       
      }, 
      events: all_events

    });

    calendar.render();
  });



  
  // 모든 일정 데이터 가져오기
function loadingEvents() {

  $.ajax({
    url: contextPath + '/calendar/calendar/' + projectNo.value + '/' + workspaceNo.value,
    data: {},
    type: 'POST',
    dataType: 'JSON',
    async: false,
    success: function(result) {
      console.log(result);

      // alert("loadingEvents 성공" + result);

      all_events = result; // 결과를 변수에 할당
    },
    error: function(error) {
      alert("loadingEvents 실패");
    }
  });
  

  return all_events;
  
}




// ------------------------------------------------------------------------------------------


// 캘린더 일정 추가
function addEvent() {
 
    const addEvent = {
      "pmNo" : projectNo.value,// 프로젝트 멤버 번호
      "workspaceNo" : workspaceNo.value,// 워크스페이스 번호
      "calTitle" : inputValue.value,// 캘린더 제목
      "calContent" : textarea.value, // 캘린더 내용
      "calColor" : BgColor,// 배경 색상
      "startDate" : startDate.value, // 일정 시작일
      "endDate" : endDate.value,// 일정 종료일
      "calSt" : "N" // 일정 삭제 여부
    }

    console.log(addEvent);


    // 종료일정이 시작일정보다 빠른 경우
    if(addEvent.startDate > addEvent.endDate) {
      const endDate = document.querySelector(".endDate");
      alert("종료일이 시작일보다 빠를수 없습니다.");
      endDate.focus();
      return false;
    }

    console.log(calendar);

  // 캘린더에 바로 추가
  calendar.addEvent({
    title: inputValue.value,
    content: textarea.value,
    start: startDate.value,
    end: endDate.value,
    backgroundColor: BgColor
  });


    // 모달창 제거
    var modal = document.getElementById("calendar-modal");
    let removeBg = document.getElementById("bg");
    // 모달 div 뒤에 희끄무레한 레이어
    modal.style.display = 'none';
    removeBg.remove();


    console.log(addEvent);
    // JSON.stringify(객체) : JS Object -> JSON
    console.log(JSON.stringify(addEvent));

    calendarSock.send(JSON.stringify(addEvent));

    // 초기화
    reset()

}


// 웹소캣
calendarSock.onmessage = function(e) {
  const calendar = JSON.parse(e.data);

  console.log("calSt = " + calendar.calSt);
  if(calendar.calSt == 'Y') {
    alert("'" + calendar.calTitle + "' 일정이 삭제되었습니다!");
  }

  if(calendar.calSt == 'N' && calendar.calNo == 0) {
    alert("'" + calendar.calTitle + "' 일정이 추가되었습니다!");
  } else if (calendar.calSt == 'N' && calendar.calNo != 0) {
    alert("'" + calendar.calTitle + "' 일정이 수정되었습니다!");
  }

  // 데이터 가져오기
  loadingEvents();
  // 화면에 출력하기(새로고침)
  location.reload();

  // console.log("calendarSock = " + calendarSock);

}



// 초기화
function reset() {
  inputValue.value = "";
  startDate.value = "";
  endDate.value = "";
  textarea.value = "";
  BgColor = "#1A73E8";
} 



// ------------------------------------------------------------------------------------------





