

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





/*워크스페이스 추가하기*/
/*
$('.pop-content2').click(function() {

    var target = this;
    var name = target.querySelector('.content-name > div:nth-child(1)').innerText;

    console.log(name);

    let res = "";

    res = " <div><div><a><i class='fa-solid fa-bars'></i></a></div><div class='workspace-name'><span>" + name +"</span><a class='change-text'><i class='fa-regular fa-pen-to-square'></i></a></div><div class='remove-btn'><a>삭제</a></div></div>"

    $('.workspace').append(res);


    $('.pop').fadeOut();
*/
    /*추가한 워크스페이스 삭제하기*/
    /*
    $('.remove-btn').click(function() {

        console.log($(this).siblings('.workspace-name').text());
        $(this).parent().remove();
       
       });

*/
    /*워크스페이스 이름 변경*/
    /*
    $('.change-text').click(function() {
        console.log($(this).parents('.workspace-name').text());
        $(this).parents('.workspace-name').html("<input type='text' class='workspace-input'>");
        
        $('.workspace-input').keydown(function(key) {
            
            if(key.keyCode == 13) {
                console.log($(this).val());
                $(this).parents('.workspace-name').html("<span>" + $(this).val() + "</span><a class='change-text'><i class='fa-regular fa-pen-to-square'></i></a></div>");
            }


        });

    });
       

});
*/

$(document).ready(function() {
    /*워크스페이스 추가하기*/
    $('.pop-content2').on('click', function() {

        var target = this;
        var name = target.querySelector('.content-name > div:nth-child(1)').innerText;

        console.log(name);

        let res = "";

        res = " <div class='wor'><div><a><i class='fa-solid fa-bars'></i></a></div><div class='workspace-name'><span>" + name +"</span><a class='change-text'><i class='fa-regular fa-pen-to-square' style='color : black;'></i></a></div><div class='remove-btn'><span>삭제</span></div></div>"

        $('.workspace').append(res);


        $('.pop').fadeOut();
    })
    
      /*추가한 워크스페이스 삭제하기*/
    $(document).on('click','.remove-btn',function() {
         console.log($(this).siblings('.workspace-name').text());
        $(this).parent().remove();
       
    })
    /*워크스페이스 이름 변경*/
    $(document).on('click','.change-text', function() {
          console.log($(this).parents('.workspace-name').text());
        $(this).parents('.workspace-name').html("<input type='text' class='workspace-input'>");
        
    })

    $(document).on('keydown','.workspace-input', function(key) {
         if(key.keyCode == 13) {
                console.log($(this).val());
                $(this).parents('.workspace-name').html("<span>" + $(this).val() + "</span><a class='change-text'><i class='fa-regular fa-pen-to-square' style='color : black;'></i></a></div>");
            }
    })

});

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
$(document).ready(function() {

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
    

});


/*추가된 워크스페이스 bar를 드래그해서 div 이동시키키(진행중,시간남으면하기) */
/*
let dragged = null;

document.addEventListener("dragstart", (event) => {
  // store a ref. on the dragged elem
  dragged = event.target;
});

document.addEventListener("dragover", (event) => {
  // prevent default to allow drop
  event.preventDefault();
});

document.addEventListener("drop", (event) => {
  // prevent default action (open as link for some elements)
  event.preventDefault();
  // move dragged element to the selected drop target
  if (event.target.className == "dropzone") {
    dragged.parentNode.removeChild(dragged);
    event.target.appendChild(dragged);
  }
}); 
*/
    
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