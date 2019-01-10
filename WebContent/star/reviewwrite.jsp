<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(function(){
	 $("#reply_btn").click(function(){
	    	if($("#reply_content").val().trim() === ""){
	    		alert("����� �Է��ϼ���.");
	    		$("#reply_content").val("").focus();
	    	}else{
	    		$.ajax({
	    			url: "/expro/ReplyWriteAction.do",
	                type: "POST",
	                data: {
	                    no : $("#no").val(),
	                    id : $("#id").val(),
	                    reply_content : $("#reply_content").val()
	                },
	                success: function () {
	                	alert("��� ��� �Ϸ�");
	                	$("#reply_content").val("");
	                	getReply();
	                }
	    		})
	    	}
	    })
	    function getReply(){
	    	$.ajax({
 			url: "/expro/GetReply.do", // ��û url
             type: "POST", // post ���
             data: {
             	board_no : ${ content.board_no } // board_no�� ���� �Ѱ���
             },
             success: function (json) { // �����Ͽ��� ���
             	json = json.replace(/\n/gi,"\\r\\n"); // ���๮�� ��ü
             	$("#replyList").text(""); // ��۸���Ʈ ���� �ʱ�ȭ
             	var obj = JSON.parse(json); // service Ŭ������ ���� ���޵� ���ڿ� �Ľ�
             	var replyList = obj.replyList; // replyList�� ���޵� json�� Ű���� �ǹ�
             	var output = ""; // ��� ����� �����Ͽ� �����ֱ� ���� ����
             	for (var i = 0; i < replyList.length; i++) { // �ݺ����� ���� output�� ����
	                    output += "<div class='w3-border w3-padding'>";
 	                for (var j = 0; j < replyList[i].length; j++) {
 	                    var reply = replyList[i][j];
 	                    if(j === 0){
 	     					output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.id + "&nbsp;&nbsp;";
 	                    }else if(j === 1){
 	     					output += "&nbsp;&nbsp;<i class='fa fa-calendar'></i>&nbsp;&nbsp;" + reply.reply_date;
 	                    }else if(j === 2){
 	     					output += "<pre>" + reply.reply_content + "</pre></div>";
 	                    }
 	                };
 	        	};
	              	$("#replyList").html(output); // replyList ������ output ���
	              	$(".reply_count").html(i);
             }
	    	})
	    }
	    getReply(); // �ش� ������ ���� �� �ش� �Լ� ȣ��
})

</script>
<body>

	<div class="ma2">


		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			<p style="color: #4a4a4a; font-size: 15px; line-height: 20px; margin-bottom: 5px;">���
				�ۼ� ���ǻ���</p>
			<ul style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
				<li>�ݵ� ��ҿ� ������ �ɼ� �� ����� ������ �ݵ� �Ⱓ(2019.01.08 ~ 2019.01.22)���ȸ� <a href="/web/wmypage/myfunding/fundinglist">�ݵ� ����</a>���� �����մϴ�.</li>
				<li>������ ���� ���� �� ��� ���Ǵ� '����Ŀ���� �����ϱ�'�� ���� ��Ȯ�� �亯�� ���� �� �ֽ��ϴ�.</li>
				<li>�����ʹ��� ����ó, ����, �̸��� ���� ������ ���������� ���� ������ ������.</li>
				<li>�� ������Ʈ�� ������ ��, ����, �弳, ���, ���� ���� ���� ���� ���� ���� �� ��ġ�� ������ ��
					������, �ش� �������� ���� ����Ŀ, ������, ��3�ڿ��� ���ذ� �߻����� �ʵ��� �����Ͻñ� �ٶ��ϴ�.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
		<div>
				<c:if test="${ id == null }">
					<textarea rows="5" cols="50"  readonly>�α��� �� ��� �ޱ�</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 ${ content.id }
					<form>
						<input type="hidden" name="no" id="no" value="${ content.pd_no }"> 
						<input type="hidden" name="id" id="id" value="${ id }">
						<textarea rows="5" cols="50" placeholder="��� �ۼ�" name="reply_content" id="reply_content"></textarea>
						<input type="button"  id="reply_btn" value="��� ���">
					</form>
				</c:if>
			</div>
		</div>
		<div id="replyList"></div>

	</div>
	
	<hr>




</body>
</html>