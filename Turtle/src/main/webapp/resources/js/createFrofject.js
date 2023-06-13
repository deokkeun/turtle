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
    }
});
$('.uc-btn').click(function() {
    $('.pop').fadeOut();
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

        res = "<div class='checkeduser'><i class='fa-solid fa-circle-user'></i><span class='user-checked-name' data-email="+$(this).siblings('.user-email').text()+">"+$(this).siblings('.user-name').text()+"</span><a class='checked-btn'><i class='fa-solid fa-circle-xmark'></i></a></div>";

    
        console.log($(this).siblings('.user-email').data('email'));

        $('.user-checked').append(res); 
        $(this).parents('.user').remove();
      


    });
    
    $('.user-checked').on('click','.checked-btn',function() {

        res2= "<div class='user'><div type='button' class='btn'><a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+$(this).siblings('.user-checked-name').text()+"</span><span class='user-email'>"+$(this).siblings('.user-checked-name').data('email')+"</span></div></div>";


        $('.user-content').append(res2);

        console.log($(this).siblings(".user-checked-name").text());
        $(this).parents('.checkeduser').remove();

        

    
    });
    



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
            for(let i=0; i<str.length; i++) {
                rex += "<div class='user'><div type='button' class='btn'> <a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+str[i].memberName+"</span><span class='user-email' data-email='"+str[i].memberEmail+"'>"+str[i].memberEmail+"</span></div></div>";
            }

            $('.search-mem').html(rex);


        },

        error : function(request, status, error) {
        
            console.log("ajax 에러발생");

            console.log("상태코드 : " + request.status); // 404, 500

        }

    })
});

