<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
BoardVo bvo = null;
FileListVo flist = null;
String title = null;
String body = null;
//겟 해오자
int no = 0;
int bno = 0;
int total = 0;

String pages = request.getParameter("page");
String k = request.getParameter("k");
String boardtype = request.getParameter("boardtype");
String ChNickname;
String baseProjectPath = "C:\\kang";
String uploadPath = baseProjectPath + "\\Travle\\WebContent\\image\\upload\\";

//보내주기


try
{	
	no = Integer.parseInt(request.getParameter("no")); 
	bvo = (boardvo)session.getAttribute("view");
	title = bvo.getTitle();
	body = bvo.getBody();
	flist = (FileListVo)session.getAttribute("flist");
	total = flist.Total();
	bno = bvo.getNo();
	ChNickname = bvo.getNickname();
	//잘못된 접근인것임
}catch(Exception e)
{
	session.removeAttribute("view");
	session.removeAttribute("flist");
%>
		<script>
			alert("비정상적인 접근");
			window.location = "../jjmain/main.jsp" ;
		</script>
	<%
	return;

}
if(nickname == null  || !(ChNickname.equals(nickname)) )
{

	%>
	<script>
		alert("비정상적인 접근");
		window.location = "../jjmain/main.jsp" ;
	</script>
	<%
}
if(no != bno)
{
	%>
	<script>
		alert("비정상적인 접근");
		window.location = "../jjmain/main.jsp" ;
	</script>
	<%
}


String param = "?no=" + no + "&page=" + pages + "&k=" + k + "&boardtype=" + boardtype;
%>
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
		//var boardtype = ("#boardtype").val();
		//id가 smarteditor인 textarea에 에디터에서 대입
    	oEditors.getById["body"].exec("UPDATE_CONTENTS_FIELD", []);
		
		
		if(writeFrm.title.value == "")
		{
			alert("제목을 입력해주세요.");
			writeFrm.title.focus();
			return;
		}

		if(writeFrm.addr.value == "")
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