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
                let p2 = document.createElement("p");
                p2.textContent = item.alertRegDate;
                a.append(h4, p1, p2);
                div.append(a);
                notificationItem.append(i, div);
                alertListArea.append(notificationItem);

                count ++;
                
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
    p2.textContent = alert.alertRegDate;
    a.append(h4, p1, p2);
    div.append(a);
    notificationItem.append(i, div);

    alertListArea.prepend(dropDownDividerLi, notificationItem);

//    dropDownHeader.after(dropDownDividerLi, notificationItem);

    let badgeNumber = document.querySelector(".badge-number");

    badgeNumber.innerText = ((Number)(badgeNumber.innerText) + 1);
    dropDownHeader.innerText = badgeNumber.innerText + "개의 새로운 알림이 있습니다";
}
function join() {
    var url = contextPath + "/chat/chatRoomList/"+ projectNo;		
    var title = "popup";
    var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400,location=no, height=400, top=1000,left=1500"; 
  
  window.open(url,title,status); 
};
