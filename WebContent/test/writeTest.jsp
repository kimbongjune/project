<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="/Travle/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="../css/sub.css"></link>
<script type="text/javascript">
var oEditors = [];
var sel_file; //???
var key = 0; //몇번째 파일네임인지 확인하기위한 변수

$(document).ready(function() {

	$(function(){
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "body",
	      //SmartEditor2Skin.html 파일이 존재하는 경로
	      sSkinURI: "/Travle/SE2/SmartEditor2Skin.html",  
	      htParams : {
	          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseToolbar : true,             
	          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseVerticalResizer : true,     
	          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseModeChanger : true,         
	          fOnBeforeUnload : function(){
	               
	          }
	      }, 
	      fOnAppLoad : function(){
	          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	          oEditors.getById["body"].exec("PASTE_HTML", [""]);
	      },
	      fCreator: "createSEditor2"
	      });
	});
	
	
	$("#check").click(function() {

		
		//id가 smarteditor인 textarea에 에디터에서 대입
    	oEditors.getById["body"].exec("UPDATE_CONTENTS_FIELD", []);
		
		
		if(writeFrm.title.value == "")
		{
			alert("제목을 입력해주세요.");
			writeFrm.title.focus();
			return;
		}
			
		//스마트에디터의 밸류값을 확인 하기 위한 변수
		var bodych = document.getElementById("body").value;
		//스마트에디터의 밸류값을 확인 하기 위한 이프
		if(bodych == ""  || bodych == null || bodych == '&nbsp;' || bodych == '<br>' || bodych == '<br />' || bodych == '<p>&nbsp;</p>' || bodych == '<p><br></p>')  
		{
        	alert("내용을 입력해주세요.");
         	oEditors.getById["body"].exec("FOCUS"); //포커싱
         	return;
		}
    	
     
    	// 이부분에 에디터 validation 검증
     
    	//폼 submit
    	$("#writeFrm").submit();
	});
		
		//클릭한 파일네임을 변수로 저장해둠
		$("#filename1").click(function() 
		{
			key = 1;
		});
		$("#filename2").click(function() 
		{
			key = 2;
		});
		$("#filename3").click(function() 
		{
			key = 3;
		});
		
		//아마 아이디가 파일네임의 밸류가 바뀌면 메소드 실행하란거일꺼임
		$("#filename1").on("change", handleImgFileSelect);
		$("#filename2").on("change", handleImgFileSelect);
		$("#filename3").on("change", handleImgFileSelect);
	
});

	//위에서 체인지 하면 실행하란 그거임
	function handleImgFileSelect(e) {
		
		//??? 목표를 포착했다.
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		//확장자 확인하는것
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*"))
			{
				alert("이미지만가능");
				return;
			}
			
			sel_file = f; //누구세요?
			
			var reader = new FileReader(); //파일 읽을꺼임 아마도
			
			//window.onload 랑 비슷하겟지
			reader.onload = function(e) {
				//선택된 파일번호에 이미지를 넣어줌
				if(key == 1)
				{
					$("#img1").attr("src",e.target.result);
				}
				if(key == 2)
				{
					$("#img2").attr("src",e.target.result);
				}
				if(key == 3)
				{
					$("#img3").attr("src",e.target.result);
				}
				
			}
			reader.readAsDataURL(f); //??? 읽어온 파일 url 이겟지 아마
		});
}
</script>
<style>
	.img_wrap
	{
		width:300px;
		margin-top:50px;
	}
	
	.img_wrap img
	{
		max-width:100%;
		max-heigt:300px;
	}
	
	
	table,td,th
	{
		border-bottom: 1px solid #444444;
	    padding: 10px;
	}
	
	.top
	{
		border-top: 1px solid #444444;
	    padding: 10px;
	}
	
	h1
	{
		color: #1877F2;
	}	
	.con_area {
	    width: 1120px;
	    margin: 0 auto;
	    padding: 0;
	}
	#mct
	{
	 	width: 100%;
	   	height: auto;
	   	margin: 0 auto;
	   	color: #777;
	   	border-top: 1px solid #e3e3e3;
	}
	#main_bg 
	{
	    text-align: center;
	    width: 100%;
	    height: auto;
	    min-height: 120px;
	    margin-bottom: 20px;
	    padding-top: 13px;
	    padding-bottom: 13px;
	    background-position: center;
	    font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.7em;
	    display: inline-block;
	}
	input[type="text"]
	{
	    height: 45px;
	    border: 2px solid;
	    font-size: 15px;
	}
	.leftmenu2
    {
    	
  	 	align:center;
	    width: 100px;
	    border: 2px solid #555;
	    height: 49px;
	    overflow: hidden;
	    background-color: #555;
	    color: white;
	    cursor: pointer;
    }
</style>
<!-- 메인컨테이너 -->
<div id="mct">
	<!-- 여백용  -->
	<div class="con_area">
		<!-- 사용 영역 -->
		<div id="main_bg">
			<!-- 폼시작 -->
			<form id="writeFrm" name="writeFrm" method="post" action="../Write.do" enctype="multipart/form-data">		
			
				<!-- 히든으로 보드타입/닉네임 넘김-->
				<!-- 1 = 소식게시판 2 = 뭐하지게시판 3 = 숙소정보게시판 4 = 자유게시판 -->
				<input type="hidden" id="boardtype" name="boardtype" value="2">
				<!-- 닉네임 변수값 넘기기 -->
				<input type="hidden" id="nickname" name="nickname" value="">
				
				<!-- 게시판 이름 영역 -->
				<h1>뭐하지 글쓰기</h1>
				
				<!-- 제목 입력하는 영역 -->
				<span style="font-size:18pt; padding:10px;">
					<strong style="font-size:18pt; padding:10px;">제목</strong>
				</span>
				<input type="text" id="title" name="title" size="100%">
				<p style="margin-bottom:20px"></p>
				
				<!-- 스마트에디터 실행되는 영역 -->
				<textarea rows="30" cols="30" id="body" name="body" style="width:100%;"></textarea>
				
				<!-- 첨부파일 버튼 영역 -->
				<div style="padding:10px;">
					<input type="file" id="filename1" name="filename1">
					<input type="file" id="filename2" name="filename2">
					<input type="file" id="filename3" name="filename3">
				</div>
				
				<!-- 미리보기 이미지 실행영역  -->
				<div>		
					<div class="img_wrap">
					<img id="img1" />
					</div>
					<div class="img_wrap">
					<img id="img2" />
					</div>				
					<div class="img_wrap">
						<img id="img3" />
					</div>
				</div>	
				
				<!-- 이동 버튼 -->
				<div>
					<input type="button" value="저장하기" class="leftmenu2" id="check">
					<input type="button" value="목록으로" class="leftmenu2" onClick="can();">
				</div>
				
			</form>
			<!-- 폼끝 -->
			
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>