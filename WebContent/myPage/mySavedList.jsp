<%@page import="reward.db.SaveBoard"%>
<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Save List</title>
</head>
<body>

<div id="savedList_main">
		<div class="savedList_top">
			<div class="savedList_desc">
				<h2 style="font-size : 1.3rem">임시저장된 글 목록입니다. 수정을 클릭하여 이어서 작성할 수 있습니다.</h2>	
			</div>			
		</div>		
		<div class="savedList_bottom">
			<div style="display : flex; width : 1000px; margin : 0 auto; font-weight : bold; padding-bottom : 1rem; border-bottom : 1px solid rgba(130,130,130,0.8);">
				<div style="flex : 5;">프로젝트</div>
				<div style="flex : 1; text-align : center;">수정</div>
				<div style="flex : 1; text-align : center;">삭제</div>		
			</div>
			
			
			<c:forEach var="saveBoard" items="${requestScope.v}">
				<div class="savedList_bottom_content" >		
				
					<div style="display : flex; align-items : center;">
					
							<div style="width : 130px; height :130px; overflow : hidden;">
							<!--이미지 null이면 기본이미지뜨게 추가!!!-->
								<c:choose>
									<c:when test="${saveBoard.pd_realFile eq ''}">
										<img src="./upload/sm_no_img.jpg">
									</c:when>
									<c:otherwise>
										 <img src="./upload/sm_${saveBoard.pd_realFile}">
									</c:otherwise>
								</c:choose> 
							</div>
							<div style="padding : 10px 10px;">
								<font style="font-size : 18px;">${saveBoard.pd_subject}${saveBoard.pd_no}${saveBoard.user_id}</font><br/>							
							</div>
						</div>
						<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveGet.fu?pd_no=${saveBoard.pd_no}'">수정 </button></div><br/>
						<div style="flex : 1; text-align : center;"><button onclick="location.href='RewardingSaveDelete.fu?pd_no=${saveBoard.pd_no}'">삭제 </button></div>
					</div>
				</div>
			</c:forEach>
			
		</div>	
			

	</table>
</div>	
</body>
</html>