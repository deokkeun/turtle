
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
      locale: 'ko'
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

function addEvent() {
const inputValue = document.querySelector(".inputValue").value;
const startDate = document.querySelector(".startDate").value;
const endDate = document.querySelector(".endDate").value;

  calendar.addEvent({
    title: inputValue,
    start: startDate,
    end: endDate});
}

// 2. ajax로 서버에 전송하여 DB에 저장해야 한다.

