/**
* Template Name: NiceAdmin
* Updated: May 30 2023 with Bootstrap v5.3.0
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
(function() {
  "use strict";

  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    if (all) {
      select(el, all).forEach(e => e.addEventListener(type, listener))
    } else {
      select(el, all).addEventListener(type, listener)
    }
  }

  /**
   * Easy on scroll event listener 
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener)
  }

  /**
   * Sidebar toggle (사이드바 토글)
   */
  if (select('.toggle-sidebar-btn')) {
    on('click', '.toggle-sidebar-btn', function(e) {
      select('body').classList.toggle('toggle-sidebar')
    })
  }
  

  /**
   * Search bar toggle
   */
  if (select('.search-bar-toggle')) {
    on('click', '.search-bar-toggle', function(e) {
      select('.search-bar').classList.toggle('search-bar-show')
    })
  }

/**
   * Sidebar toggle (사이드바 토글)
   */
if (select('.toggle-sidebar2-btn')) {
  on('click', '.toggle-sidebar2-btn', function(e) {
    select('body').classList.toggle('toggle-sidebar2')
  })
}



  

  /**
   * Navbar links active state on scroll
   */
  let navbarlinks = select('#navbar .scrollto', true)
  const navbarlinksActive = () => {
    let position = window.scrollY + 200
    navbarlinks.forEach(navbarlink => {
      if (!navbarlink.hash) return
      let section = select(navbarlink.hash)
      if (!section) return
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        navbarlink.classList.add('active')
      } else {
        navbarlink.classList.remove('active')
      }
    })
  }
  window.addEventListener('load', navbarlinksActive)
  onscroll(document, navbarlinksActive)

  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
      } else {
        selectHeader.classList.remove('header-scrolled')
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }

  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
  }

  /**
   * Initiate tooltips
   */
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  /**
   * Initiate quill editors
   */
  if (select('.quill-editor-default')) {
    new Quill('.quill-editor-default', {
      theme: 'snow'
    });
  }

  if (select('.quill-editor-bubble')) {
    new Quill('.quill-editor-bubble', {
      theme: 'bubble'
    });
  }

  if (select('.quill-editor-full')) {
    new Quill(".quill-editor-full", {
      modules: {
        toolbar: [
          [{
            font: []
          }, {
            size: []
          }],
          ["bold", "italic", "underline", "strike"],
          [{
              color: []
            },
            {
              background: []
            }
          ],
          [{
              script: "super"
            },
            {
              script: "sub"
            }
          ],
          [{
              list: "ordered"
            },
            {
              list: "bullet"
            },
            {
              indent: "-1"
            },
            {
              indent: "+1"
            }
          ],
          ["direction", {
            align: []
          }],
          ["link", "image", "video"],
          ["clean"]
        ]
      },
      theme: "snow"
    });
  }

  /**
   * Initiate TinyMCE Editor
   */
  const useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
  const isSmallScreen = window.matchMedia('(max-width: 1023.5px)').matches;



  /**
   * Initiate Bootstrap validation check
   */
  var needsValidation = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(needsValidation)
    .forEach(function(form) {
      form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })

  /**
   * Initiate Datatables
   */
  const datatables = select('.datatable', true)
  datatables.forEach(datatable => {
    new simpleDatatables.DataTable(datatable);
  })

  /**
   * Autoresize echart charts
   */
  const mainContainer = select('#main');
  if (mainContainer) {
    setTimeout(() => {
      new ResizeObserver(function() {
        select('.echart', true).forEach(getEchart => {
          echarts.getInstanceByDom(getEchart).resize();
        })
      }).observe(mainContainer);
    }, 200);
  }

})();

//프로젝트 내용 추가
function addFile(menuId, event) {
  if (event) {
    event.stopPropagation();
  }

  var projectName = prompt("프로젝트 이름을 입력하세요:");
  if (projectName) {
    var fileLink = menuId.split('-')[0] + "-projects/" + projectName.toLowerCase() + ".html";

    var newFile = document.createElement("li");

    var fileLinkElement = document.createElement("a");
    fileLinkElement.className = "nav-link";
    fileLinkElement.innerHTML = '<span>' + projectName + '</span>';

    var fileMenu = document.createElement("div");
    fileMenu.className = "file-menu dropdown ms-auto";
    fileMenu.oncontextmenu = function () {
      return false;
    };

    var dropdownToggle = document.createElement("button");
    dropdownToggle.className = "dropdown-nev";
    dropdownToggle.type = "button";
    dropdownToggle.dataset.bsToggle = "dropdown";
    dropdownToggle.setAttribute("aria-haspopup", "true");
    dropdownToggle.setAttribute("aria-expanded", "false");
    dropdownToggle.innerHTML = '<i class="bi bi-three-dots-vertical"></i>';

    var dropdownMenu = document.createElement("div");
    dropdownMenu.className = "dropdown-menu";

    var renameButton = document.createElement("button");
    renameButton.className = "dropdown-item rename-button";
    renameButton.innerHTML = '<i class="bi bi-pencil"></i> 이름 바꾸기';
    renameButton.onclick = function (event) {
      event.stopPropagation();
      renameFile(this);
    };

    var deleteButton = document.createElement("button");
    deleteButton.className = "dropdown-item delete-button";
    deleteButton.innerHTML = '<i class="bi bi-trash"></i> 삭제하기';
    deleteButton.onclick = function (event) {
      event.stopPropagation();
      deleteFile(this);
      showAddButton(menuId); // 삭제 후 추가 버튼 보이기
    };

  

    dropdownMenu.appendChild(renameButton);
    dropdownMenu.appendChild(deleteButton);
  

    fileMenu.appendChild(dropdownToggle);
    fileMenu.appendChild(dropdownMenu);

    fileLinkElement.appendChild(fileMenu);

    newFile.appendChild(fileLinkElement);

    var menuNav = document.getElementById(menuId);
    menuNav.appendChild(newFile);

    if (menuId !== "workspace-nav") {
      hideAddButton(menuId); // 추가 버튼 숨기기
    }
  }
}

function hideAddButton(menuId) {
  var addButton = document.querySelector('button.add-file-button[onclick="addFile(\'' + menuId + '\', event)"]');
  if (addButton) {
    addButton.style.display = 'none';
  }
}

function showAddButton(menuId) {
  var addButton = document.querySelector('button.add-file-button[onclick="addFile(\'' + menuId + '\', event)"]');
  if (addButton) {
    addButton.style.display = 'inline-block';
  }
}


function renameFile(button) {
  var fileItem = button.closest(".file-menu");
  var fileSpan = fileItem.previousElementSibling;
  var newFileName = prompt("새로운 파일 이름을 입력하세요:", fileSpan.innerText);
  if (newFileName) {
    fileSpan.innerText = newFileName;
  }
}

function deleteFile(button) {
  var fileItem = button.parentNode.parentNode.parentNode;
  var menuNav = fileItem.parentNode;
  menuNav.removeChild(fileItem);
}

const navLink = document.querySelector('.nav-link');

if (navLink) {
  navLink.addEventListener('click', (e) => {
    e.preventDefault();
    return false;
  });

  navLink.classList.remove('collapsed');
}
