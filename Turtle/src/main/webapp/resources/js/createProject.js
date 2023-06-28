
// const bar = document.querySelector('.bar');
// const menu = document.querySelector('.nav-links');
// const icons = document.querySelector('.nav-links2');

// /*반응형 햄버거 클릭시 nav바 내려오기*/
// bar.addEventListener('click', ()=> {
//     menu.classList.toggle('active');
//     icons.classList.toggle('active');
    
// });



/*초대버튼 클릭시 팝업창 띄우기 */
$('.btnt').click(function() {
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

        res = "<div class='checkeduser active' id="+$(this).siblings('.user-email').text()+"><i class='fa-solid fa-circle-user'></i><span class='user-checked-name' name="+$(this).siblings('.user-name').text()+" id="+$(this).siblings('.user-email').text()+ " data-email="+$(this).siblings('.user-email').text()+">"+$(this).siblings('.user-name').text()+"</span><a class='checked-btn'><i class='fa-solid fa-xmark'></i></a><input class='userimg' id='"+$(this).siblings('.user-img').attr('id')+"' type='hidden'></div>";

        
        const t = document.querySelectorAll('.user');
        const y = document.querySelectorAll('.checkeduser');
        
        console.log($(this).siblings('.user-email').data('email'));

        if(y.length >0) {

            for(let i=0; i<y.length; i++) {

                if($(this).parents('.user').attr('id') == y[i].getAttribute('id')) {
                    y[i].remove();
                }
            }
        
        }



        $('.user-checked').append(res); 
        /* 수정중
        $(this).parents('.user').addClass('active');
       const u =  $(this).parents('.user').attr('class');
        localStorage.setItem('c', u);
        const u2 = localStorage.getItem('c');
        console.log(u2);        
        */


        $(this).parents('.user').remove();


        // for(let i=0; i<t.length; i++) {

        //     for(let x=0; x<y.length; x++) {
        //         if($(this).parents('.user').attr('id') != y[x].getAttribute('id')) {
        //             console.log($(this).parents('.user').attr('id'));
        //             console.log('6');
        //            //클릭한거 id값이랑 오른쪽 div 안에 id값이랑 같으면 삭제
        //             y[x].remove();
        //         }
        //     }
        // }

    });
    
    $('.user-checked').on('click','.checked-btn',function() {

        res2= "<div class='user'><div type='button' class='btn'><a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+$(this).siblings('.user-checked-name').text()+"</span><span class='user-email'>"+$(this).siblings('.user-checked-name').data('email')+"</span></div></div>";

        const y = document.querySelectorAll('.user');
        const t = document.querySelectorAll('.checkeduser');
        
        console.log($(this).siblings('.user-email').data('email'));

        if(y.length >0) {

            for(let i=0; i<y.length; i++) {

                if($(this).parents('.checkeduser').attr('id') == y[i].getAttribute('id')) {
                    y[i].remove();
                }
            }
        
        }


        $('.search-mem').append(res2);

        console.log($(this).siblings(".user-checked-name").text());
        $(this).parents('.checkeduser').remove();

        

    
    });
    
//초대멤버 div에 넣기
    $('.uc-btn').on('click', function() {

        const invitedUser = document.querySelectorAll('.user-checked-name');
        const invitedmem = document.querySelector('.invited-member');
        const img = document.querySelectorAll('.userimg');
    
        invitedmem.innerHTML = "";
     

        for(let i=0; i<invitedUser.length; i++) {
            console.log(invitedUser[i].getAttribute('id'));
            console.log(invitedUser[i].getAttribute('name'));
            res3 = "<div class='user2'><img class='user-img2' src= "+contextPath+img[i].getAttribute('id')+" width='30px'><span class='user-name2' id='"+invitedUser[i].getAttribute('name')+"'>"+invitedUser[i].getAttribute('name')+"</span><span class='user-email2' id="+invitedUser[i].getAttribute('id')+">"+invitedUser[i].getAttribute('id')+"</span></div>";
  
            $('.invited-member').append(res3);
            
        }
        // 
        $.ajax({

            url : "inviteMember",
            data : {"selectEmail" : $('.user-checked-name').attr('id')},
            type : "POST",
            error : function(request, status, error) {
            
                console.log("ajax 에러발생");
                console.log("상태코드 : " + request.status); // 404, 500
            }
        })

       

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
            const em = document.querySelectorAll('.checkeduser');
            let rex2 = "";
            const sm = document.querySelector('.search-mem');
            const ee = document.querySelectorAll('.user');
            if($('.searchmember').val().length > 0 ) {

                for(let i=0; i<str.length; i++) {
                    let contextPath = "${contextPath}";

                    rex +="<div class='user' id="+str[i].memberEmail+"><div type='button' class='btn'> <a class='user-plus'><i class='fa-solid fa-circle-plus'></i></a><span class='user-name'>"+str[i].memberName+"</span><span class='user-email' data-email='"+str[i].memberEmail+"'>"+str[i].memberEmail+"</span><input class='user-img' id="+str[i].profileImage+" type='hidden'></div></div>";
                    $('.search-mem').html(rex);
            
                    for(let v=0; v<em.length; v++) {
                        console.log('1');
                        if(em[v].classList.contains('active')) {
                            console.log('2');

                            for(let x=0; x<ee.length; x++) {
                                console.log('3');
                                if(ee[x].getAttribute('id') == em[v].getAttribute('id')) {
                                    console.log('4');
                                    console.log(ee[x]);
                                    ee[x].classList.add('active');
                                }
                            }
                        }
                    }
                }

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

//이모티콘
let button3 = document.querySelector("#emoji_btn2");
const picker2 = new EmojiButton({
  position: 'bottom-start'
});

button3.addEventListener('click', () => {
  picker2.togglePicker(button3);
});

picker2.on('emoji', emoji => {
  const text_box2 = document.querySelector('#emoji_btn2');
  text_box2.innerHTML = emoji;
});

//섬머노트
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 200,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '프로젝트를 소개해주세요.'	//placeholder 설정
         
        
    
	});
});

