// var sidebar = document.getElementById('rightSidebar');
// var toggleButton = document.getElementById('toggleButton');

// toggleButton.addEventListener('click', function() {
//   sidebar.classList.toggle('sidebar-visible');
// });

// function toggleSubMenu(id) {
//   var subMenu = document.getElementById(id);
//   subMenu.classList.toggle("active");
// }

// //rightsidebar 열고 닫기 기능 
// var mainToggleButton = document.getElementById('toggleButton');
// var rightSidebar = document.getElementById('rightSidebar');
// var main = document.getElementById('main');

// mainToggleButton.addEventListener('click', function() {
//   rightSidebar.classList.toggle('active');
//   main.classList.toggle('sidebar-active');

// });

// document.addEventListener('click', function(event) {
//   var sidebar = document.getElementById('rightSidebar');
//   var toggleButton = document.getElementById('toggleButton');
  
//   if (sidebar.classList.contains('sidebar-visible') && !toggleButton.contains(event.target) && !sidebar.contains(event.target)) {
//     // 오른쪽 사이드바가 열려 있고 토글 버튼과 사이드바 외의 영역을 클릭하면 사이드바 닫기
//     sidebar.classList.remove('sidebar-visible');
//     main.classList.remove('sidebar-active');
//     main.style.marginRight = '0px';
//   }
// });

// // 초기 로드 시 우측 사이드바 상태에 따라 마진 라이트 값을 설정
// window.addEventListener('DOMContentLoaded', function() {
//   var sidebar = document.getElementById('rightSidebar');
  
//   if (sidebar.classList.contains('active')) {
//     main.style.marginRight = '300px';
//   } else {
//     main.style.marginRight = '0px';
//   }
// });

// var mainToggleButton = document.getElementById('toggleButton');
// var main = document.getElementById('main');

// mainToggleButton.addEventListener('click', function() {
//   main.style.marginRight = main.style.marginRight === '300px' ? '0px' : '300px';
// });
// function toggleSidebar() {
//   var sidebar = document.getElementById('rightSidebar');
//   sidebar.classList.toggle('sidebar-visible');
// }


function toggleSide() {
  // main.setAttribute('style','margin-right:300px');
  rightSidebar.classList.toggle('active');
  if (rightSidebar.classList.contains('active')) {
    main.style.marginRight = '600px';
  } else {
    main.style.marginRight = '0px';
  }
  
  rightSidebar.classList.toggle('sidebar-visible');
 
}

document.addEventListener('click', function(event) {
  var sidebar = document.getElementById('rightSidebar');
  var toggleButton = document.getElementById('toggleButton');
  var selectBoardDetail = document.getElementsByClassName('select-board-detail');
  
  if (rightSidebar.classList.contains('active') && !sidebar.contains(event.target) && !isDescendant(event.target, selectBoardDetail)) {
    toggleSide();
  }
});

function isDescendant(child, parentArray) {
  for (var i = 0; i < parentArray.length; i++) {
    var parent = parentArray[i];
    if (parent.contains(child)) {
      return true;
    }
  }
  return false;
}

// createElement로 li생성후 ajax로 chatRoomList를 불러와서 append해주기


// $('.sidebar-toggle').on('click', function() {

//   $.ajax({
    
//       url : contextPath + '/chat/chatRoom/1/3?',
//       type : 'get',
//       datatype : 'html',

//       success : function(data) {

        
//         $('.right-sidebar').html(data);
          
         
//       }

//   })

 
// });


// $('.chatBtn').on('click', function() {

// const projectNo = document.querySelector('#projectNo')
// const roomNo = $(this).val();


// $.ajax({

//   url : contextPath + '/chat/chatRoom/1?',
//   type : 'get',
//   datatype : 'html',

//   success : function(e) {
    
//     $('.right-sidebar').html(e);

//   }


// })

// });

