<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	
	//첨부하기 버튼 눌렀을때 파일이름들을 양식페이지로 가져간다..
	function result(){
		opener.document.form.pd_file.value = document.fileForm.oriFile.value;
		opener.document.getElementById('pd_realFile').value = document.getElementById('sysFile').value;
		//창닫기
		window.close();
	}
	

      
      //미리보기2
      $(document).ready(function() {

    	  //파일의 선택이 변경되었을 때 수행할 내용
    	  $('#file').change(function() {
    	   readURL(this);
    	  });
    	 });
      
    	 //file의 선택이 변경되면 호출되는 메소드
    	 function readURL(input) {
    	  //파일을 선택했다면
    	  if (input.files && input.files[0]) {
    	   //선택한 파일의 이름 가져오기
    	   var filename = input.files[0].name;
    	   //파일의 맨 끝 3자가  jpg, gif, png인지 확인
    	   var ext = filename.substr(filename.length - 3, filename.legth);
    	   if (ext.toLowerCase() == 'jpg' || ext.toLowerCase() == 'gif'
    	     || ext.toLowerCase() == 'png') {
    	    isCheck = true;
    	   } else {
    	    alert("이미지 파일만 가능합니다.");
    	    return;
    	   }
    	   
    	   //파일을 읽을 수 있는 객체를 생성
    	   var reader = new FileReader();
    	   //선택한 이미지 파일읽기
    	   reader.readAsDataURL(input.files[0]);
    	   //이미지 파일의 내용을 전부 읽으면 img 태그에 출력
    	   reader.onload = function(e) {
    		$(".thum").html("이미지 미리보기");
    	    $('#img').attr('src', e.target.result);
    	   }
    	  }
    	 }
     
  </script>
<style type="text/css">
.file { border: 1px solid;
		border-color: #C4C4C4;
		padding: 5px;
		width: 15em;
		}


</style>				  
	
</head>

<body>

	
	<form action="./fileUpAction.fu" enctype="multipart/form-data" method="post" name="fileForm">
		

		<%
				
		String oriFile = (String)request.getAttribute("oriFile");
		String sysFile = (String)request.getAttribute("sysFile");
		request.setAttribute("img", sysFile);
		
		
		/* if(sysFile == null) sysFile="";
		if(oriFile == null) oriFile=""; */
		%>

					<input type="hidden" name="oriFile" value="<%=oriFile%>">	
					<input type="hidden" name="sysFile" id="sysFile" value="<%=sysFile%>">
					<div class="file"><input type="file" name="upFile" id="file" style="color: #C4C4C4"></div>
					<div><font size="1">이미지 파일만 등록할 수 있습니다. (JPG, GIF, PNG)</font></div>
					<br/><br/>			
					<!-- 미리보기2 -->
					<div class="thum"></div>
					<img id="img"><br><br>
					<hr>
					<!-- 사실은 파일첨부 -->
					<input type="submit" value="등록하기"><br/>
	
<%-- 					<%
					if(sysFile!=null){
					
					%>	
						썸네일 미리보기<br/><img src="./upload/sm_<%=sysFile%>">
					<%
					
					}
					
					%> --%>
			
				<!-- 첨부하면 썸네일이미지 뿌려주기... -->
	</form>
			
			<!-- 사실은 창닫기 -->
			<input type="button" value="   닫 기   " onclick="result();">
			<small>등록하기 버튼을 누른 후 닫기 버튼을 꼭 눌러주세요.</small>

</body>
</html>