<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
  <link rel="stylesheet" href="/movie/assets/style/singup_signin_page_css/signup_choice_page.css"  />
</head>
<body>
  <div class="main-choice">

    <div class="progress-box">
      <h3 class="progress-text">10개 이상의 영화를 선택해 주새요.</h3>
      <progress id="progress-bar" value="0" max="10"></progress>
      <h3 class="progress-count">0/10</h3>
    </div>
    <div class="submit-box">
      <form class="submit-form" method="post">
        <input class="submit-btn"type="button" value="완료" onclick="fn_submit(this.form)" disabled/>
        <input type="hidden" id="hiddenList" value="" name="userSelectMovieList"/>
      </form>
    </div>

    <div class="main-movieList" id="main-movieList">
    
    	<div class="listBox" id="listBox">
    	
	      <c:if test="${empty movieDefaultList}">
	      	없음
	      </c:if>
	      <c:if test="${not empty movieDefaultList }">
	      	<c:forEach var="movie" items="${movieDefaultList }">
	      		<div class="list" style="background-image: url('/movie/assets/images/poster/${movie.movie_title}_포스터.jpg'); background-size: 250px 300px;">
	      			<input type="checkbox" name="movie_no" class="movie_no" value="${movie.movie_no }" style="display: none;"/>
	      		</div>
	      	</c:forEach>
	      	
	      </c:if>
	      
    	</div>
    </div>

  </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
  <script>

  
  /* 스크롤 하단 감지 영화 리스트뽑아오기 */
        let scrollCount = 4;
  $(window).scroll(function() {
        
        let scrolltop = $(document).scrollTop();
        let height = $(document).height();
        let height_win = $(window).height();
        
        
        /* 스크롤이 하단에 위치한다면 */
     if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
        
        	$.ajax({
        		url: 'scrollMovieList/'+ scrollCount,
        		type: 'get',
        		dataType: 'json',
        		success: function(responseObj){
        			const movieList = responseObj.scrollMovieList;
        			
        			movieList.forEach(function(movieN){
        				const movieOne = '<div class="list afterInsert" style="background-image: url(/movie/assets/images/poster/'+ movieN.movie_title+'_포스터.jpg' + '); background-size: 250px 300px;">'
        										+'<input type="checkbox" name="movie_no" class="movie_no" value='+movieN.movie_no+' style="display: none;"/>'+'</div>';
        				$('.listBox').append(movieOne);
        			});
        			
        			
        			scrollCount++;
        		},
        		error: function(){
        			
        		}
        		
        	});
        }
        
   });  
    

  
  
  
  const main = document.querySelector('#main-movieList');
  const listBox = document.createElement('div');
  const movieList = document.querySelectorAll('.list');
  
  const list = document.querySelectorAll('.list');
  const bar = document.querySelector('#progress-bar');
  const countText = document.querySelector('.progress-count');
  const submitBtn = document.querySelector('.submit-btn');
  let userSelect = [];
  
  /* 영화 div 박스 안에 체크박스 컨트롤 fn */
  function movieChecked(event){
    let checkBox = event.target.childNodes[1];
	if(!checkBox){
		checkBox = event.target.childNodes[0];
	}
    if(checkBox.getAttribute('checked') == "false" || checkBox.getAttribute('checked') == null){
	    checkBox.setAttribute('checked',"true");
	    return true;
    }
    if(checkBox.getAttribute('checked')){
    	checkBox.setAttribute('checked',"false");
    	console.log(checkBox.getAttribute('checked'))
    	return false;
    }
    
    
  }
  $(document).on("click","div .list",handleBar);

  function handleBar(event){
	
	const movieBox = event.target;
    let movieNo = event.target.childNodes[1];
	if(!movieNo || movieNo == ''){
		movieNo = event.target.childNodes[0];
	}else{
	    movieNo = event.target.childNodes[1];
	}
	console.log(movieNo);
    const opClass = 'checked';
    
    /* 영화가 선택되어있다면 userSelect 배열에 movie_no값을 추가해주고 프로그레스바를 컨트롤한다
       클래스 checked를 추가해준다.
    */
	if(movieChecked(event)){
		userSelect.push(movieNo.value);
		console.log(123);
		movieBox.classList.add(opClass);
		bar.value++;
	}else{
		userSelect.splice(userSelect.indexOf(movieNo.value),1);
		movieBox.classList.remove(opClass);
		bar.value--;
		console.log(123);
	}
    
    console.log(userSelect);

    if(bar.value === 10){
      bar.value = 10;
      document.querySelector('#hiddenList').value = userSelect;
      submitBtn.disabled = false;
    }else{
      submitBtn.disabled = true;
    }
    let count = bar.value;
    
    progressCount(count);
    
	
  }

  function progressCount(count){
    countText.innerText = count+'/10';
    if(count === 10){
      countText.innerText = 'Complete!!';
    }
  }

  function init(){
  }



  init();
  
  
  
  /* 값 보내는 fn */
  function fn_submit(f){
	  
	  f.action = 'userSelectMovieList.do';
	  f.submit();
	  
	  
  }
  
  </script>
  
</body>
</html>