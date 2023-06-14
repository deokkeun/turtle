
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



var inputValue = document.querySelector(".inputValue");
var startDate = document.querySelector(".startDate");
var endDate = document.querySelector(".endDate");


var BgColor = "#1A73E8";

// 색상 추출
$(".BgColor").click(function() {
  BgColor = $(this).attr("value");
  alert(BgColor);
});



var calendar = null;

document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });



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
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      },
      locale: 'ko',
      dateClick: function(info) {
        // alert('Date: ' + info.dateStr);
        // alert('Resource ID: ' + info.resource.id);


        // 일정 추가,수정,삭제버튼 컨트롤
        visibilityBtn.style.display = "block";
        addEventBtn.style.display = "block";
        updateEventBtn.style.display = "none";
        deleteEventBtn.style.display = "none";


        startDate.value = info.dateStr;
        // 모달창 띄우기
        modal("calendar-modal");

      },eventClick: function(info) {
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

        // console.log(info);
        defId = info.event._instance.defId;

        console.log(info.event._instance.defId);
        // // 삭제 버튼
        // const deleteEventBtn = document.getElementById("deleteEvent-btn");

        deleteEventBtn.addEventListener("click", function () {

          if (info.event._instance.defId == defId) {
            if (confirm("'" + info.event.title + "' 일정을 삭제하시겠습니까?")) {
              // 확인 클릭 시
              info.event.remove();
              
              // 모달창 제거
              var modal = document.getElementById("calendar-modal");
              let removeBg = document.getElementById("bg");
              // 모달 div 뒤에 희끄무레한 레이어
              modal.style.display = 'none';
              removeBg.remove();

              // 초기화
              inputValue.value = "";
              startDate.value = "";
              endDate.value = "";
              BgColor = "#1A73E8";

            }
          }
        });

        console.log(info.event);

        // 선택한 이벤트(제목, 시작일, 종료일)
        inputValue.value = info.event.title;
        startDate.value = info.event.startStr;
        endDate.value = info.event.endStr;

        // 색상선택 불러오기

        modal("calendar-modal");

        // change the border color just for fun
        info.el.style.borderColor = '#d93025';
        // info.el.style.backgroundColor = '#d93025';

        // 이벤트 삭제 하기
        // info.event.remove();
       
      }
          
    });

    calendar.render();
  });



// ------------------------------------------------------------------------------------------


// const inputValue = document.querySelector(".inputValue");
function addEvent() {
  // if(inputValue.value == null) {
  //   return;
  // }

    var startDay = document.querySelector(".startDate");
    var endDay = document.querySelector(".endDate");

    if(startDay.value > endDay.value) {
      alert("종료일이 시작일보다 빠를수 없습니다.");
      startDay.focus();

      return false;
    }

  // 일정 추가 
  calendar.addEvent({
    title: inputValue.value,
    start: startDate.value,
    end: endDate.value,
    backgroundColor: BgColor});


    // 모달창 제거
    var modal = document.getElementById("calendar-modal");
    let removeBg = document.getElementById("bg");
    // 모달 div 뒤에 희끄무레한 레이어
    modal.style.display = 'none';
    removeBg.remove();


    $.ajax({
      url: 'addEvent', // 저장할 url
      data: {'title': inputValue.value,
              'start': startDate.value,
              'end': endDate.value,
              'backgroundColor': BgColor},
      type: 'POST',
      dataType: 'JSON',
      success: function(result) {
        alert("addEvent 성공");
      },
      error: function(error) {
        alert("addEvent 실패");

      }
    })


     // 초기화
    inputValue.value = "";
    startDate.value = "";
    endDate.value = "";
    BgColor = "#1A73E8";


}


// ------------------------------------------------------------------------------------------

// document.addEventListener('DOMContentLoaded', function() {
//     var calendarEl = document.getElementById('calendar');
//     var calendar = new FullCalendar.Calendar(calendarEl, {
//       initialView: 'dayGridMonth',
//       locale: 'ko'
//     });
//     calendar.render();
//   });


// 1. 전체 이벤트 데이터를 추출해야 한다.
function allSave() {
    var allEvent = calendar.getEvents();
    var events = new Array();
    for(var i = 0; i < allEvent.length; i++) {
      var obj = new Object();

      obj.title = allEvent[i]._def.title; // 이벤트 명칭
      // obj.allDay = allEvent[i]._def.allDay; // 하루종일의 이벤트인지 알려주는 boolean값 (true / false)
      obj.start = allEvent[i]._instance.range.start; // 시작날짜 및 시간
      obj.end = allEvent[i]._instance.range.end; // 마침날짜 및 시간

      events.push(obj);
    }
    var jsondata = JSON.stringify(events);

    console.log(jsondata);

    savedata(jsondata);
}

function savedata(jsondata) {
  $.ajax({
    data: {'allData': jsondata},
    type: 'POST',
    dataType: 'text',
    url: '', // 저장할 url
    async: false
  })
  .done(function(result) {

  })
  .fail(function(request, status, error) {
    alert("에러 발생 : " + error);
  })
}


// 2. ajax로 서버에 전송하여 DB에 저장해야 한다.




