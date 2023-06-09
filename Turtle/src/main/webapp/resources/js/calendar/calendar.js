
//-----------------------------------------------------------

// 로그인 모달 테스트
function modal(id) {
  var zIndex = 9999;
  var modal = document.getElementById(id);


  // 모달 div 뒤에 희끄무레한 레이어
  var bg = document.createElement('div');
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



//-------------------------------------------------------



const startDate = document.querySelector(".startDate");

console.log(startDate.value);

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
        startDate.value = info.dateStr;




          // 모달창 띄우기
        modal("calendar-modal");





      }
    });

    calendar.render();
  });


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
      obj.allDay = allEvent[i]._def.allDay; // 하루종일의 이벤트인지 알려주는 boolean값 (true / false)
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
// const inputValue = document.querySelector(".inputValue");
function addEvent() {
  // if(inputValue.value == null) {
  //   return;
  // }
const inputValue = document.querySelector(".inputValue").value;
const startDate = document.querySelector(".startDate").value;
const endDate = document.querySelector(".endDate").value;

  calendar.addEvent({
    title: inputValue,
    start: startDate,
    end: endDate});
}






// 2. ajax로 서버에 전송하여 DB에 저장해야 한다.




