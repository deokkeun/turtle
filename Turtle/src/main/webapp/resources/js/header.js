selectAlertList();
function selectAlertList() {    
    $.ajax({
        url : contextPath +"/alert/selectAlertList",
        data : {"pmNo" : 4,
                "projectNo" : 1,            
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
            
            for(let item of alertList) {

                let dropDownDividerLi = document.createElement("li");
                let dropDownDividerHr = document.createElement("hr");
                dropDownDividerHr.classList.add("dropdown-divider");
                dropDownDividerLi.append(dropDownDividerHr);                
                notifications.append(dropDownDividerLi);

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
                notifications.append(notificationItem);

                count ++;
                
            }

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

let alerts = document.querySelectorAll(".alert");
alerts.forEach((alert) => {
    alert.querySelector('a').addEventListener("click", function() {        
        $.ajax({
            url : contextPath +"/alert/updateAlertCheckFg",
            data : {"alertNo" : alert.dataset.alertno},
            type : "get",
    
            dataType : "JSON",
    
            success : function(result) {
            if(result > 0) {
                alert.parentElement.previousSibling.remove();    
                alert.parentElement.remove();

                let badgeNumber = document.querySelector(".badge-number");
                let dropDownHeader = notifications.querySelector(".dropdown-header");

                badgeNumber.innerText = ((Number)(badgeNumber.innerText) - 1);
                dropDownHeader.innerText = badgeNumber.innerText + "개의 새로운 알림이 있습니다";
                if((Number)(badgeNumber.innerText) == 0) {
                    badgeNumber.innerText = '';
                    dropDownHeader.innerText = '새로운 알림이 없습니다.';
                }
            }
            
                
                
    
            },
            error : function(request, status, error){
                console.log("AJAX 에러 발생");
                console.log("상태코드 : " + request.status); // 404, 500
            }
        });
    })
})

alertSock.onmessage = function(e) {
    let alert = JSON.parse(e.data);  // JSON -> JS Object
    
    let notifications = document.getElementById("alert-area");
    let dropDownHeader = notifications.querySelector(".dropdown-header");

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

    dropDownHeader.after(dropDownDividerLi, notificationItem);

    let badgeNumber = document.querySelector(".badge-number");

    badgeNumber.innerText = ((Number)(badgeNumber.innerText) + 1);
    dropDownHeader.innerText = badgeNumber.innerText + "개의 새로운 알림이 있습니다";
}
