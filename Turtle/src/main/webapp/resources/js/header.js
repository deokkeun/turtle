selectAlertList();
function selectAlertList() {    
    $.ajax({
        url : contextPath +"/alert/selectAlertList",
        data : {"pmNo" : pmNo,
                "projectNo" : projectNo,            
        },
        type : "get",

        dataType : "JSON",

        success : function(alertList) {
            let badgeNumber = document.querySelector(".badge-number");
            let notifications = document.getElementById("alert-area");
            
            notifications.innerHTML = "";
            count = 0;
            let dropDownHeader = document.createElement("li");
            dropDownHeader.classList.add("dropdown-header")
            notifications.append(dropDownHeader);
            let alertListArea = document.createElement("div");
            alertListArea.classList.add("alertListArea");
            alertListArea.style.overflow ="auto";
            alertListArea.style.maxHeight ="450px";

            for(let item of alertList) {
              if(item.memberNo != memberNo) {

              
                let dropDownDividerLi = document.createElement("li");
                let dropDownDividerHr = document.createElement("hr");
                dropDownDividerHr.classList.add("dropdown-divider");
                dropDownDividerLi.append(dropDownDividerHr);                
                alertListArea.append(dropDownDividerLi);

                let notificationItem = document.createElement("li");
                notificationItem.classList.add("notification-item");
                
                let i = document.createElement("i");
                i.classList.add("bi");
                i.classList.add("bi-info-circle");
                i.classList.add("text-primary");

                let div = document.createElement("div");
                div.classList.add("alert");
                div.dataset.alertno = item.alertNo;
                let a = document.createElement("a");
                a.href = item.link;
                let h4 = document.createElement("h4");
                h4.textContent = item.memberName;
                let p1 = document.createElement("p");
                p1.textContent = item.alertContent;
                //let p2 = document.createElement("p");
                //p2.textContent = item.alertRegDate;                
                let p2 = document.createElement("p");
                p2.textContent = formatTimeAgo(item.alertRegDate);
                a.append(h4, p1, p2);
                div.append(a);
                notificationItem.append(i, div);
                alertListArea.append(notificationItem);

                count ++;
              }
            }

            notifications.append(alertListArea);

            if(count == 0) {
                dropDownHeader.innerText = "새로운 알림이 없습니다.";
            } else {
                badgeNumber.innerHTML = count;
                dropDownHeader.innerText = count + "개의 새로운 알림이 있습니다";
            }
        },
        error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
}

let alerts = document.querySelector("#alert-area");
    alerts.addEventListener("click", function() {      
    $.ajax({
        url : contextPath +"/alert/updateAlertCheckFg",
        data : {"pmNo" : pmNo},
        type : "get",

        dataType : "JSON",

        success : function(result) {
            if(result > 0) {
                selectAlertList();
                let badgeNumber = document.querySelector(".badge-number");
                badgeNumber.innerHTML = "";
            }
        },
        error : function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
})

alertSock.onmessage = function(e) {
    let alert = JSON.parse(e.data);  // JSON -> JS Object
    if(alert.memberNo != memberNo) {
    
    let notifications = document.getElementById("alert-area");
    let dropDownHeader = notifications.querySelector(".dropdown-header");
    let alertListArea = document.querySelector(".alertListArea");

    let dropDownDividerLi = document.createElement("li");
    let dropDownDividerHr = document.createElement("hr");
    dropDownDividerHr.classList.add("dropdown-divider");
    dropDownDividerLi.append(dropDownDividerHr);                

    let notificationItem = document.createElement("li");
    notificationItem.classList.add("notification-item");
    
    let i = document.createElement("i");
    i.classList.add("bi");
    i.classList.add("bi-info-circle");
    i.classList.add("text-primary");

    let div = document.createElement("div");
    div.classList.add("alert");
    div.dataset.alertno = alert.alertNo;
    let a = document.createElement("a");
    a.href = alert.link;
    let h4 = document.createElement("h4");
    h4.textContent = alert.memberName;
    let p1 = document.createElement("p");
    p1.textContent = alert.alertContent;
    let p2 = document.createElement("p");
    p2.textContent = "방금 전";
    
    a.append(h4, p1, p2);
    div.append(a);
    notificationItem.append(i, div);

    alertListArea.prepend(dropDownDividerLi, notificationItem);

//    dropDownHeader.after(dropDownDividerLi, notificationItem);

    let badgeNumber = document.querySelector(".badge-number");

    badgeNumber.innerText = ((Number)(badgeNumber.innerText) + 1);
    dropDownHeader.innerText = badgeNumber.innerText + "개의 새로운 알림이 있습니다";
    }
}


// 시간설정
function formatTimeAgo(timestamp) {
    const currentDate = new Date();
    const alertDate = new Date(timestamp);
  
    const minutes = Math.floor((currentDate - alertDate) / 60000);
  
    if (minutes < 1) {
      return "방금 전";
    } else if (minutes < 60) {
      return `${minutes}분 전`;
    } else if (minutes < 1440) {
      const hours = Math.floor(minutes / 60);
      return `${hours}시간 전`;
    } else {
      const days = Math.floor(minutes / 1440);
      return `${days}일 전`;
    }
}

function join() {
    var url = contextPath + "/chat/chatRoomList/"+ projectNo;		
    var title = "popup";
    var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400,location=no, height=400, top=1000,left=1500"; 
  
  window.open(url,title,status); 
};



function deleteProject(projectNo) {
  console.log("deleteProject");
  console.log(projectNo);
  $.ajax({
    url: 'deleteProject', 
    type: 'POST',
    data: { "projectNo": projectNo },
    success: function(result) {
    	console.log(result);
      if(result == 1){
        alert("삭제되었습니다.");
        location.href = contextPath;
      }else if (result == 2){
        alert("관리자만 삭제할 수 있습니다.")
        location.href = contextPath + "/project/" + projectNo;
      }else{
        alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요.");
        location.href = contextPath + "/project/" + projectNo;
      }
    },
    error: function() {
      console.log('프로젝트 삭제 중 오류가 발생.');
    }
  });
}

function deleteWorkspace(workspaceNo) {
  console.log("워크스페이스 삭제");
  
  $.ajax({
    url: 'deleteWorkspace', 
    type: 'POST',
    data: { "workspaceNo": workspaceNo },
    success: function(result) {
      if(result == 1){
        alert("삭제되었습니다.");
        location.href = contextPath + "/project/" + projectNo;
      }else if (result == 2){
        alert("관리자만 삭제할 수 있습니다.")
        location.href = contextPath + "/project/" + projectNo + "/" + workspaceNo;
      }else{
        alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요.");
        location.href = contextPath + "/project/" + projectNo + "/" + workspaceNo;
      }
    },
    error: function() {
      console.log('워크스페이스 삭제 중 오류가 발생.');
    }
  });
}

  
function renameProject(projectNo) {
    var projectName = prompt("변경할 프로젝트 이름을 입력하세요:");
  
    if (projectName === null) {
      return;
    }
  
    $.ajax({
      url: 'renameProject',
      type: 'POST',
      data: {
        "projectNo": projectNo,
        "projectName": projectName
      },
      success: function(result) {
        console.log(result);
        if (result == 1) {
          alert("프로젝트 이름이 변경되었습니다.");
        } else if (result == 2) {
          alert("관리자만 이름을 변경할 수 있습니다.");
        } else {
          alert("프로젝트 이름 변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
        }
        location.href = contextPath + "/project/" + projectNo;
      },
      error: function() {
        console.log('프로젝트 이름 변경 중 오류가 발생.');
      }
    });
  }
  
  function renameWorkspace(workspaceNo) {
    var workspaceName = prompt("변경할 워크스페이스 이름을 입력하세요:");
  
    if (workspaceName === null) {
      return;
    }
    console.log(workspaceName);
    $.ajax({
      url: 'renameWorkspace',
      type: 'POST',
      data: {
        "workspaceNo": workspaceNo,
        "workspaceName": workspaceName
      },
      success: function(result) {
        console.log(result);
        if (result == 1) {
          alert("워크스페이스 이름이 변경되었습니다.");
        } else if (result == 2) {
          alert("관리자만 이름을 변경할 수 있습니다.");
        } else {
          alert("워크스페이스 이름 변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
        }
        location.href = contextPath + "/project/" + projectNo;
      },
      error: function() {
        console.log('워크스페이스 이름 변경 중 오류가 발생.');
      }
    });
  }


  function redirectToCreateWorkspace(project) {
    
    $.ajax({
      url: 'createWorkspace',
      type: 'POST',
      data: { "project": JSON.stringify(project)},
      success: function(result) {
        console.log(result);
        window.location.href = contextPath + '/project/createWorkspace';
        
      },
      error: function() {
        console.log('Ajax 요청 중 오류가 발생');
      }
    });

  }

