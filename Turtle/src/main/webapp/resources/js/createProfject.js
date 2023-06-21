const bar = document.querySelector('.bar');
const menu = document.querySelector('.nav-links');
const icons = document.querySelector('.nav-links2');

/*반응형 햄버거 클릭시 nav바 내려오기*/
bar.addEventListener('click', ()=> {
    menu.classList.toggle('active');
    icons.classList.toggle('active');
    
});


/*초대버튼 클릭시 팝업창 띄우기 */
$('.btn').click(function() {
    $('.pop').fadeIn();
    $('.pop').addClass('black');
    

});
$('.pop').click(function(e) {
    if($(e.target).hasClass('black')){
    $('.pop').fadeOut();
    $('.searchmember').val('');
    $('.search-mem').html("");
    }
});
$('.uc-btn').click(function() {
    $('.pop').fadeOut();
    $('.searchmember').val('');
    $('.search-mem').html("");
})


let user = document.querySelectorAll('.user');
let usercheck = document.querySelectorAll('.user-check');
let userchecked = document.querySelectorAll('.user-checked-name > div >span');


user.forEach((user)=>{
   
    user.addEventListener('click', ()=> {
        if(user.classList.contains('active')) {
            user.classList.remove('active');                   
        }else {
            user.classList.add('active');      
                    
        }
        
       


    })
    

});

const username = document.getElementsByClassName('user-name').value;

$(document).ready(function() {


    $('.pop').on('click','.user-plus',function() {
    
     
        var name1 = $(this).siblings('.user-name').text();
        console.log(name1);
    /*  console.log(target.querySelector('.user-name').innerText);*/

        let res = "";

        res = "<div class='checkeduser active'><i class='fa-solid fa-circle-user'></i><span class='user-checked-name' name="+$(this).siblings('.user-name').text()+" id="+$(this).siblings('.user-email').text()+ " data-email="+$(this).siblings('.user-email').text()+">"+$(this).siblings('.user-name').text()+"</span><a class='checked-btn'><i class='fa-solid fa-circle-xmark'></i></a></div>";

        
        console.log($(this).siblings('.user-email').data('email'));

        $('.user-checked').append(res); 
        /* 수정중
        $(this).parents('.user').addClass('active');
       const u =  $(this).parents('.user').attr('class');
        localStorage.setItem('c', u);
        const u2 = localStorage.getItem('c');
        console.log(u2);        
        */
        $(this).parents('.user').remove();

    });
    
    $('.user-checked').on('click','.checked-btn',function() {

        res2= "<div class='user'><div type='button' class='btn'><a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+$(this).siblings('.user-checked-name').text()+"</span><span class='user-email'>"+$(this).siblings('.user-checked-name').data('email')+"</span></div></div>";


        $('.search-mem').append(res2);

        console.log($(this).siblings(".user-checked-name").text());
        $(this).parents('.checkeduser').remove();

        

    
    });
    
//초대멤버 div에 넣기
    $('.uc-btn').on('click', function() {

        const invitedUser = document.querySelectorAll('.user-checked-name');
        const invitedmem = document.querySelector('.invited-member');

        invitedmem.innerHTML = "";
     

        for(let i=0; i<invitedUser.length; i++) {
            console.log(invitedUser[i].getAttribute('id'));
            console.log(invitedUser[i].getAttribute('name'));
            res3 = "<div class='user'><a class='invited-user'><i class='fa-solid fa-circle-user'></i></a><span class='user-name2'>"+invitedUser[i].getAttribute('name')+"</span><span class='user-email2' id="+invitedUser[i].getAttribute('id')+">"+invitedUser[i].getAttribute('id')+"</span></div>";
  
            $('.invited-member').append(res3);
            
        }
       

    })

});



/*회원검색 */

$('#search-txt').keyup(function() { 
    $.ajax({

        url : "searchmember",
        data : {"input" : $('.searchmember').val()},
        type : "GET",


        success : function(mlist) {

            let str = JSON.parse(mlist);
            console.log(str);
            let rex = "";
            const d = localStorage.getItem('c');
            if($('.searchmember').val().length > 0 ) {

                for(let i=0; i<str.length; i++) {
                    
                    rex += "<div class='user'><div type='button' class='btn'> <a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+str[i].memberName+"</span><span class='user-email' data-email='"+str[i].memberEmail+"'>"+str[i].memberEmail+"</span></div></div>";
                }

                $('.search-mem').html(rex);

            }else {
                $('.search-mem').html("");
            }
        },

        error : function(request, status, error) {
        
            console.log("ajax 에러발생");

            console.log("상태코드 : " + request.status); // 404, 500

        }

    })
});

