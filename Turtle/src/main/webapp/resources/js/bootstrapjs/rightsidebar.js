var sidebar = document.getElementById('rightSidebar');
var toggleButton = document.getElementById('toggleButton');

toggleButton.addEventListener('click', function() {
  sidebar.classList.toggle('sidebar-visible');
});

function toggleSubMenu(id) {
  var subMenu = document.getElementById(id);
  subMenu.classList.toggle("active");
}

var mainToggleButton = document.getElementById('toggleButton');
var rightSidebar = document.getElementById('rightSidebar');
var main = document.getElementById('main');

mainToggleButton.addEventListener('click', function() {
  rightSidebar.classList.toggle('active');
  main.classList.toggle('sidebar-active');

  if (rightSidebar.classList.contains('active')) {
    main.style.marginRight = '300px';
  } else {
    main.style.marginRight = '0';
  }
});

function toggleSidebar() {
  var sidebar = document.getElementById('rightSidebar');
  sidebar.classList.toggle('sidebar-visible');
}

function toggleSubMenu(id) {
  var subMenu = document.getElementById(id);
  subMenu.classList.toggle("active");
}
// createElement로 li생성후 ajax로 chatRoomList를 불러와서 append해주기


$('.sidebar-toggle').on('click', function() {

  $.ajax({
    
      url : contextPath + '/chat/chatRoomList/1?',
      type : 'get',
      datatype : 'html',

      success : function(data) {

        
        $('.right-sidebar').html(data);
          
         
      }

  })

 
});


$('.chatBtn').on('click', function() {

const projectNo = document.querySelector('#projectNo')
const roomNo = $(this).val();


$.ajax({

  url : contextPath + '/chat/chatRoom/1?',
  type : 'get',
  datatype : 'html',

  success : function(e) {
    
    $('.right-sidebar').html(e);

  }


})

});

