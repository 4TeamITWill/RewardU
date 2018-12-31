<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<%

//현재 실행중인 웹프로젝트에 대한 정보를 지니고 있는 컨텍스트 객체 생성
ServletContext ctx = getServletContext();

//현재 실행중인 웹프로젝트에 대한 정보객체의 getRealPath()메소드를 이용하여
//가상경로를 실제경로로 바꾸기
String realPath = ctx.getRealPath("upload");

//업로드 할 수 있는 파일의 최대 크기 지정 5MB
int max = 1024*1024*5;

//실제 파일 업로드 담당하는 객체 생성
MultipartRequest multi = new MultipartRequest(request, realPath, max, "UTF-8", new DefaultFileRenamePolicy());

Enumeration e  = multi.getFileNames(); //파일 업로드 당시 input 태그의 name속성값을 꺼내서 반복기에 담아 리턴
										

String name = (String)e.nextElement();
String originFile = multi.getOriginalFileName(name);  //클라이언트가 업로드한 파일의 원본 이름
String sysFile = multi.getFilesystemName(name);	//클라이언트가 서버에 실제로 업로드 된 파일의 이름

request.setAttribute("oriFile", originFile);
request.setAttribute("sysFile", sysFile);


//저장이미지를 섬네일(작은이미지)로 변환하여 'sm_...'으로저장
ParameterBlock pb=new ParameterBlock();
pb.add(realPath+"/"+sysFile);
RenderedOp rOp=JAI.create("fileload",pb);

BufferedImage bi= rOp.getAsBufferedImage();
BufferedImage thumb=new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);

Graphics2D g=thumb.createGraphics();
g.drawImage(bi,0,0,100,100,null);

File file=new File(realPath+"/sm_"+sysFile);
ImageIO.write(thumb,"jpg",file);


%>

<jsp:forward page="fileUp.jsp"></jsp:forward>


</body>
</html>