

const plus = document.querySelector('.plus-btn');
const pop = document.querySelector('.pop');


/*플러스 버튼 클릭시 팝업창 띄우기 */
$('.plus-btn').click(function() {
    $('.pop').fadeIn();
    $('.pop').addClass('black');
    
    

});
$('.pop').click(function(e) {
    if($(e.target).hasClass('black')){
    $('.pop').fadeOut();
    }
});


$(document).ready(function() {
    /*워크스페이스 추가하기*/
    // $('.pop-content2').on('click', function() {

    //     var target = this;
    //     var name = target.querySelector('.content-name > div:nth-child(1)').innerText;

    //     console.log(name);

    //     let res = "";

    //     res = " <div class='wor'><div><a><i class='fa-solid fa-bars'></i></a></div><div class='workspace-name'><span id="+name+">" + name +"</span><a class='change-text'><i class='fa-regular fa-pen-to-square' style='color : black;'></i></a></div><div class='remove-btn'><span>삭제</span></div></div>"

    //     $('.workspace').append(res);


    //     $('.pop').fadeOut();
    // })
    
    //   /*추가한 워크스페이스 삭제하기*/
    // $(document).on('click','.remove-btn',function() {
    //      console.log($(this).siblings('.workspace-name').text());
    //     $(this).parent().remove();
       
    // })
    // /*워크스페이스 이름 변경*/
    // $(document).on('click','.change-text', function() {
    //       console.log($(this).parents('.workspace-name').text());
    //     $(this).parents('.workspace-name').html("<input id = "+$(this).siblings('span').attr('id') +" type='text' class='workspace-input'>");
        
    // })

    // $(document).on('keydown','.workspace-input', function(key) {
    //      if(key.keyCode == 13) {
    //             console.log($(this).val());
    //             $(this).parents('.workspace-name').html("<span id="+$(this).attr('id')+">" + $(this).val() + "</span><a class='change-text'><i class='fa-regular fa-pen-to-square' style='color : black;'></i></a></div>");
    //         }
    // })



/*언어설정 section 버튼 클릭 */




/*tab 클릭시 이미지 분류 */

    $('.workspace-language a').click(function() {
        console.log($(this).text());
    
        var name = $(this).text();
        var cls = document.querySelectorAll('.language');

        for(var i =0; i < cls.length; i++) {
            if(cls[i].getAttribute('id') == name) {
                cls[i].classList.add('active');
                
                
            }else {
                cls[i].classList.remove('active');
            
            
            }
        }

    })



/*이미지 클릭 시 SELECTED로 이동 */


    $('.img > a').on('click', function() {
        
        $(this).parents('.img').addClass('animate'); /*클릭시 애니메이션 미완성*/
        $('#SELECTED').append($(this).parents('.img'));
        $('#SELECTED > div a i').attr('class' , "fa-solid fa-circle-xmark");
        $('#SELECTED > div a i').attr('style', 'color : red');
        $('#SELECTED > div').attr('class','selected');
        
    });

    $('#SELECTED').on('click', '.selected > a',function() {
       var id1 = $(this).parents('.selected').attr('name');
       var id2 = $('.language').attr('id');

        console.log(id1);
        console.log($('#' + id1));
        $('#'+id1).append($(this).parents('.selected'));
        $('#'+id1 +' > div a i ').attr('class','fa-solid fa-circle-plus');
        $('#'+id1 + ' > div a i').attr('style','color: #1f6df4');
        $('#'+id1 + '>div').attr('class','img');
    });


    $('.next-btn').on('click', function() {
        console.log('버튼클릭');
        const e = document.querySelectorAll('.selected > img');
        const w = document.querySelectorAll('.workspace-name > span');
      

        var arr1 = [];
        var arr2 = [];
        var arr3 = [];
        for(let i=0; i<e.length; i++) {
            arr1[i] = e[i].src;

        }
        for(let x=0; x<w.length; x++) {
            arr2[x] = w[x].getAttribute('id');
            arr3[x] = w[x].innerHTML;
        }
        console.log(arr1);
        console.log(arr2);
        console.log(arr3);
       

          

            $.ajax({

                url : "createTemplate",
                data : {selected : arr1,
                        workspace : arr2,
                        wokrspaceName : arr3
                },
                traditional : true,
                type : "POST",
                success: function() {
                    console.log('전송성공');

                },
                error : function(request, status, error) {
            
                    console.log("ajax 에러발생");
                    console.log("상태코드 : " + request.status); // 404, 500
                }
                
            })

        })


   
    

});

$('.next-btn').click(function() {
    if($("input[name=workspaceName]").val().length == 0) {
    alert('워크스페이스명을 입력해주세요.');
    $('input[name=workspaceName]').focus();
    return false;
   }
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
  console.log(emoji);
  
  const emojiValueInput = document.querySelector('#emoji_value');
  emojiValueInput.value = emoji;
});

