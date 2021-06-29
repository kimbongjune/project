<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!---------------------------list 시작------------------------->

<script>
	
	//모든 list 에서 사용
	function gowrite() 
	{
		$("#wrdfrm").submit();
	}
	
	//모든 view 에서 사용
	function gomodify() 
	{
		if(confirm("게시글을 수정 하시겠습니까?") != 1)
		{
			return;
		}
		$("#modfrm").submit();
	};
	
	function godel()
	{
		if(confirm("게시글을 삭제 하시겠습니까?") != 1)
		{
			return;
		}
		$("#delfrm").submit();
	};
	
	//jj_list , hotel_list 에서만 사용
	function notok() 
	{
		alert("해당게시판의 글쓰기는 권한이 필요합니다. 관리자에게 문의 해주세요.");
	}
	
</script>


<!---------------------------list 끝------------------------->