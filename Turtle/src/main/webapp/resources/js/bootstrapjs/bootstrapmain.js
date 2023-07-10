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
  
    tinymce.init({
      selector: 'textarea.tinymce-editor',
      plugins: 'preview importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap pagebreak nonbreaking anchor insertdatetime advlist lists wordcount help charmap quickbars emoticons',
      editimage_cors_hosts: ['picsum.photos'],
      menubar: 'file edit view insert format tools table help',
      toolbar: 'undo redo | bold italic underline strikethrough | fontfamily fontsize blocks | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
      toolbar_sticky: true,
      toolbar_sticky_offset: isSmallScreen ? 102 : 108,
      autosave_ask_before_unload: true,
      autosave_interval: '30s',
      autosave_prefix: '{path}{query}-{id}-',
      autosave_restore_when_empty: false,
      autosave_retention: '2m',
      image_advtab: true,
      link_list: [{
          title: 'My page 1',
          value: 'https://www.tiny.cloud'
        },
        {
          title: 'My page 2',
          value: 'http://www.moxiecode.com'
        }
      ],
      image_list: [{
          title: 'My page 1',
          value: 'https://www.tiny.cloud'
        },
        {
          title: 'My page 2',
          value: 'http://www.moxiecode.com'
        }
      ],
      image_class_list: [{
          title: 'None',
          value: ''
        },
        {
          title: 'Some class',
          value: 'class-name'
        }
      ],
      importcss_append: true,
      file_picker_callback: (callback, value, meta) => {
        /* Provide file and text for the link dialog */
        if (meta.filetype === 'file') {
          callback('https://www.google.com/logos/google.jpg', {
            text: 'My text'
          });
        }
  
        /* Provide image and alt text for the image dialog */
        if (meta.filetype === 'image') {
          callback('https://www.google.com/logos/google.jpg', {
            alt: 'My alt text'
          });
        }
  
        /* Provide alternative source and posted for the media dialog */
        if (meta.filetype === 'media') {
          callback('movie.mp4', {
            source2: 'alt.ogg',
            poster: 'https://www.google.com/logos/google.jpg'
          });
        }
      },
      templates: [{
          title: 'New Table',
          description: 'creates a new table',
          content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
        },
        {
          title: 'Starting my story',
          description: 'A cure for writers block',
          content: 'Once upon a time...'
        },
        {
          title: 'New list with dates',
          description: 'New List with dates',
          content: '<div class="mceTmpl"><span class="cdate">cdate</span><br><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
        }
      ],
      template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
      template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
      height: 600,
      image_caption: true,
      quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
      noneditable_class: 'mceNonEditable',
      toolbar_mode: 'sliding',
      contextmenu: 'link image table',
      skin: useDarkMode ? 'oxide-dark' : 'oxide',
      content_css: useDarkMode ? 'dark' : 'default',
      content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
    });
  
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
// function addFile(menuId, event) {
//     if (event) {
//       event.stopPropagation();
//     }
  
//     var projectName = prompt("제목을 입력하세요:");
//     if (projectName) {
//       var fileLink = menuId.split('-')[0] + "-projects/" + projectName.toLowerCase() + ".html";
  
//       var newFile = document.createElement("li");
  
//       var fileLinkElement = document.createElement("a");
//       fileLinkElement.className = "nav-link";
//       fileLinkElement.innerHTML = '<span>' + projectName + '</span>';
  
//       var fileMenu = document.createElement("div");
//       fileMenu.className = "file-menu dropdown ms-auto";
//       fileMenu.oncontextmenu = function () {
//         return false;
//       };
  
//       var dropdownToggle = document.createElement("button");
//       dropdownToggle.className = "dropdown-nev";
//       dropdownToggle.type = "button";
//       dropdownToggle.dataset.bsToggle = "dropdown";
//       dropdownToggle.setAttribute("aria-haspopup", "true");
//       dropdownToggle.setAttribute("aria-expanded", "false");
//       dropdownToggle.innerHTML = '<i class="bi bi-three-dots-vertical"></i>';
  
//       var dropdownMenu = document.createElement("div");
//       dropdownMenu.className = "dropdown-menu";
  
//       var renameButton = document.createElement("button");
//       renameButton.className = "dropdown-item rename-button";
//       renameButton.innerHTML = '<i class="bi bi-pencil"></i> 이름 바꾸기';
//       renameButton.onclick = function (event) {
//         event.stopPropagation();
//         renameFile(this);
//       };
  
//       var deleteButton = document.createElement("button");
//       deleteButton.className = "dropdown-item delete-button";
//       deleteButton.innerHTML = '<i class="bi bi-trash"></i> 삭제하기';
//       deleteButton.onclick = function (event) {
//         event.stopPropagation();
//         deleteFile(this);
//         showAddButton(menuId); // 삭제 후 추가 버튼 보이기
//       };
  
    
  
//       dropdownMenu.appendChild(renameButton);
//       dropdownMenu.appendChild(deleteButton);
    
  
//       fileMenu.appendChild(dropdownToggle);
//       fileMenu.appendChild(dropdownMenu);
  
//       fileLinkElement.appendChild(fileMenu);
  
//       newFile.appendChild(fileLinkElement);
  
//       var menuNav = document.getElementById(menuId);
//       menuNav.appendChild(newFile);
  
//       if (menuId !== "workspace-nav") {
//         hideAddButton(menuId); // 추가 버튼 숨기기
//       }
//     }
//   }
//   var projectNavLink = document.querySelector('[data-bs-target="#project-nav"]');
// projectNavLink.addEventListener('click', function (event) {
//   event.stopPropagation();
// });

// // SHARED PROJECT Nav
// var sharedProjectNavLink = document.querySelector('[data-bs-target="#shared-project-nav"]');
// sharedProjectNavLink.addEventListener('click', function (event) {
//   event.stopPropagation();
// });

// // WORKSPACE Nav
// var workspaceNavLink = document.querySelector('[data-bs-target="#workspace-nav"]');
// workspaceNavLink.addEventListener('click', function (event) {
//   event.stopPropagation();
// });
//   function addFileAndToggle(menuId, event) {
//     if (event) {
//       event.stopPropagation();
//     }
  
//     // addFile 함수 호출
//     addFile(menuId, event);
  
//     // 해당 메뉴의 a.nav-link.collapsed 요소를 찾아서 클릭 이벤트 수행
//     var linkElement = document.querySelector(`a.nav-link.collapsed[data-bs-target="#${menuId}"]`);
//     if (linkElement) {
//       linkElement.click();
//     }
//   }
  
//   function hideAddButton(menuId) {
//     var addButton = document.querySelector('button.add-file-button[onclick="addFileAndToggle(\'' + menuId + '\', event)"]');
//     if (addButton) {
//       addButton.style.display = 'none';
//     }
//   }
  
//   function showAddButton(menuId) {
//     var addButton = document.querySelector('button.add-file-button[onclick="addFileAndToggle(\'' + menuId + '\', event)"]');
//     if (addButton) {
//       addButton.style.display = 'inline-block';
//     }
//   }
  
  
//   function renameFile(button) {
//     var fileItem = button.closest(".file-menu");
//     var fileSpan = fileItem.previousElementSibling;
//     var newFileName = prompt("새로운 파일 이름을 입력하세요:", fileSpan.innerText);
//     if (newFileName) {
//       fileSpan.innerText = newFileName;
//     }
//   }
  
//   function deleteFile(button) {
//     var fileItem = button.parentNode.parentNode.parentNode;
//     var menuNav = fileItem.parentNode;
//     menuNav.removeChild(fileItem);
//   }
  
//   const navLink = document.querySelector('.nav-link');
  
//   if (navLink) {
//     navLink.addEventListener('click', (e) => {
//       e.preventDefault();
//       return false;
//     });
  
//     navLink.classList.remove('collapsed');
//   }
  
  
//   var addButton = document.getElementById('add-file-button');
//   addButton.addEventListener('click', function(event) {
//     if (this.classList.contains('disabled')) {
//       event.preventDefault();
//       return false;
//     }
    
//     this.classList.add('disabled');
//     addFile('shared-project-nav');
    
//     setTimeout(function() {
//       addButton.classList.remove('disabled');
//     }, 1000);
//   });
  
  
  

//   const projectNav = document.querySelector('#project-nav');
//   const menuBoard = document.querySelector('#menu-board');
  
//   function showMenuBoard() {
//     const content = projectNav.innerHTML;
//     menuBoard.innerHTML = content;
//     menuBoard.style.display = 'block';
//   }
  
//   function hideMenuBoard() {
//     menuBoard.innerHTML = '';
//     menuBoard.style.display = 'none';
//   }
  
//   // 사이드바 토글 버튼 클릭 시 메뉴판 보이기/감추기
//   const toggleSidebarBtn = document.querySelector('.toggle-sidebar-btn');
//   toggleSidebarBtn.addEventListener('click', function() {
//     const isSidebarVisible = document.body.classList.contains('toggle-sidebar');
//     if (isSidebarVisible) {
//       hideMenuBoard();
//     } else {
//       showMenuBoard();
//     }
//   });
  
  
  
//   function toggleCustomSidebar() {
//   var sidebar = document.querySelector('.sidebar');
//   var arrow = document.getElementById('custom-arrow');

//   sidebar.classList.toggle('collapsed');

//   if (sidebar.classList.contains('collapsed')) {
//     arrow.innerHTML = '▶'; // 축소된 상태에서 보여질 아이콘 설정
//   } else {
//     arrow.innerHTML = '◀'; // 확장된 상태에서 보여질 아이콘 설정
//   }
// }

// function toggleSidebar() {
//   const sidebar = document.querySelector('.sidebar');
//   const arrow = documaent.querySelector('#arrow');
//   const sidebarNav = document.querySelector('.sidebar-nav');

//   sidebar.classList.toggle('collapsed');
//   arrow.classList.toggle('collapsed');
//   sidebarNav.classList.toggle('collapsed');
// }

// function toggleSidebar() {
//   var sidebar = document.getElementsByClassName('sidebar')[0];
//   var arrow = document.getElementById('arrow');
//   var addButton = document.getElementsByClassName('add-file-button');

//   sidebar.classList.toggle('collapsed');

//   if (sidebar.classList.contains('collapsed')) {
//     arrow.style.display = 'none';
//     for (var i = 0; i < addButton.length; i++) {
//       addButton[i].style.display = 'none';
//     }
//   } else {
//     arrow.style.display = 'inline-block';
//     for (var i = 0; i < addButton.length; i++) {
//       addButton[i].style.display = 'inline-block';
//     }
//   }
// }

// function toggleProjectMenu() {
//   var projectNav = document.getElementById("project-nav");
//   if (projectNav.classList.contains("show")) {
//     projectNav.classList.remove("show");
//   } else {
//     projectNav.classList.add("show");
//   }
// }
  