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

$(document).ready(function() {
//버튼 클릭시 이동

    $('.pop').on('click','.user-plus',function() {
        
        
        var name1 = $(this).siblings('.user-name').text();
        console.log(name1);


        let res = "";

        res = "<div class='checkeduser active' id="+$(this).siblings('.user-email').text()+"><img src='"+contextPath+$(this).siblings('.user-img').attr('id')+"' width='30px'><span class='user-checked-name' name="+$(this).siblings('.user-name').text()+" id="+$(this).siblings('.user-email').text()+ " data-email="+$(this).siblings('.user-email').text()+">"+$(this).siblings('.user-name').text()+"</span><a class='checked-btn'><i class='fa-solid fa-xmark'></i></a><input class='userimg' id='"+$(this).siblings('.user-img').attr('id')+"' type='hidden'></div>";

        
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
    

        $(this).parents('.user').remove();


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
});