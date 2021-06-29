var oEditors = [];
var sel_file; //???
var key = 0; //몇번째 파일네임인지 확인하기위한 변수
var bodych;

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

		if(confirm("게시글을 저장 하시겠습니까?") != 1)
			{
				return;
			}
		
		//id가 smarteditor인 textarea에 에디터에서 대입
    	oEditors.getById["body"].exec("UPDATE_CONTENTS_FIELD", []);
		
		
		if(writeFrm.title.value == "")
		{
			alert("제목을 입력해주세요.");
			writeFrm.title.focus();
			return;
		}
		if(writeFrm.addres.value == "")
		{
			alert("주소를 입력해주세요.");
			writeFrm.addres.focus();
			return;
		}
		if(writeFrm.number.value == "")
		{
			alert("전화번호를 입력해주세요");
			writeFrm.number.focus();
			return;
		}
			
		//스마트에디터의 밸류값을 확인 하기 위한 변수
		bodych = document.getElementById("body").value;
		//스마트에디터의 밸류값을 확인 하기 위한 이프
		if(bodych == ""  || bodych == null || bodych == '&nbsp;' || bodych == '<br>' || bodych == '<br />' || bodych == '<p>&nbsp;</p>' || bodych == '<p><br></p>' || bodych == '<p><br></p><p><br></p>')  
		{
        	alert("내용을 입력해주세요.");
         	oEditors.getById["body"].exec("FOCUS"); //포커싱
         	return;
		}
    	
     
    	// 이부분에 에디터 validation 검증
     
    	//폼 submit
    	$("#writeFrm").submit();
    		//alert(oEditors.getById["body"].exec());
		});
		
	
		$('#number').keyup(function(event)
		{
			var phleng  = $(this).val().length;
			var orgVal4 = $(this).val();
			var keyVal4 = $(this).val();
			keyVal4 = keyVal4.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' );
			keyVal4 = keyVal4.replace(/[a-z]/gi,"");						//본문에 영어 소문자, 숫자 제거
			keyVal4 = keyVal4.replace(" ","");								//본문에 공란 제거
			keyVal4 = keyVal4.replace(/[.,<>`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi, '');	//본문에 특수문자 제거
			if(orgVal4 == keyVal4 && orgVal4 != "" && phleng < 12)
			{
				$('#spanphonenumber').html('');
			}else
			{	
				$('#spanphonenumber').html('전화번호는 11자리 숫자로 입력해주세요 예)01012345678');
				$(this).val('');
			}
			if(phleng == 11)
			{
				isphonenumber = "Y";
			}
	});
	
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

