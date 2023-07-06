package snippet;

public class Snippet {
	var mainToggleButton = document.getElementById('toggleButton');
	var rightSidebar = document.getElementById('rightSidebar');
	var main = document.getElementById('main');
	
	mainToggleButton.addEventListener('click', function() {
	  rightSidebar.classList.toggle('active');
	  main.classList.toggle('sidebar-active');
	
	  if (main.style.marginRight === '0px') {
	    main.style.marginRight = '300px';
	  } else {
	    main.style.marginRight = '0px';
	  }
	});
	
	document.addEventListener('click', function(event) {
	  var sidebar = document.getElementById('rightSidebar');
	  var toggleButton = document.getElementById('toggleButton');
	
	  if (sidebar.classList.contains('active') && !toggleButton.contains(event.target) && !sidebar.contains(event.target)) {
	    sidebar.classList.remove('active');
	    main.style.marginRight = '0px';
	  } else if (!sidebar.classList.contains('active') && !toggleButton.contains(event.target) && !main.contains(event.target) && !sidebar.contains(event.target)) {
	    main.style.marginRight = '0px';
	  }
	});
	
	// 초기 로드 시 우측 사이드바 상태에 따라 마진 라이트 값을 설정
	window.addEventListener('DOMContentLoaded', function() {
	  var sidebar = document.getElementById('rightSidebar');
	
	  if (sidebar.classList.contains('active')) {
	    main.style.marginRight = '300px';
	  } else {
	    main.style.marginRight = '0px';
	  }
	});
}

