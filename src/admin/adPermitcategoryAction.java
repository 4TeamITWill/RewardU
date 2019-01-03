package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;


public class adPermitcategoryAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
/*		String Context = request.getContextPath();
		System.out.println(Context);
		StringBuffer URL = request.getRequestURL();
		System.out.println(URL);
		String URI = request.getRequestURI();
		System.out.println(URI);
		String Path = request.getServletPath();
		System.out.println(Path);*/
		
		BoardDAO bDAO = new BoardDAO();
		//페이징 처리
		//한 페이지 에 보여줄 글 목록 수
		int pageSize = 9; 
		//페이지 그룹 개당 페이지 수 (1,2,3,4,5) 
		int pageGroupSize = 5;
		//현재 페이지 번호
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		if(currentPage < 1){
			currentPage = 1;
		}
		//총 목록 개수
		int listCount = bDAO.getPermitListCount();
		
		int number = listCount-(currentPage-1)*pageSize;
		//페이지 그룹 개수(1그룹에 5개 페이지)
		int pageGroupCount = listCount/(pageSize*pageGroupSize)+( listCount % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		//페이지 그룹의 번호(1그룹 의 번호는 1, 2그룹의 번호는 2 ...)
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		
		int totalPage = listCount / pageSize + (listCount%pageSize==0? 0:1); 
		int startPage = pageGroupSize * (numPageGroup -1) + 1;
		int endPage = startPage  + pageGroupSize-1;
		
		if(totalPage < currentPage){
			currentPage = totalPage;
		}
		if(endPage > totalPage){
			endPage = totalPage;
		}
		//한 페이지 첫 번쨰 목록 번호 와 마지막 목록 번호
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//페이징 처리 끝
		//리스트 조회 limit으로 startRow , pageSize
		
		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		String select = request.getParameter("select");
		String order = request.getParameter("order");
		String category = request.getParameter("category");
		System.out.println(select);
		System.out.println(order);
		System.out.println(category);
		
		if(listCount > 0){
				list = bDAO.getPermitCategoryList(category,select,order,startRow,pageSize);
		}else{
			list = null;
		}
		
		request.setAttribute("currentPage", currentPage);
		System.out.println(currentPage);
		request.setAttribute("startRow", startRow);
		System.out.println(startRow);
		request.setAttribute("endRow", endRow);
		System.out.println(endRow);
		request.setAttribute("listCount", listCount);
		System.out.println(listCount);
		request.setAttribute("pageSize", pageSize);
		System.out.println(pageSize);
		request.setAttribute("number", number);
		System.out.println(number);
		request.setAttribute("pageGroupSize", pageGroupSize);
		System.out.println(pageGroupSize);
		request.setAttribute("numPageGroup", numPageGroup);
		System.out.println(numPageGroup);
		request.setAttribute("pageGroupCount", pageGroupCount);
		System.out.println(pageGroupCount);
		request.setAttribute("totalPage", totalPage);
		System.out.println(totalPage);
		request.setAttribute("startPage", startPage);
		System.out.println(startPage);
		request.setAttribute("endPage", endPage);
		System.out.println(endPage+"END");
		request.setAttribute("list", list);
		
		String path = "";
		
		if(category.equals("전자")){
			path = "RewardTech.jsp";
		}else if(category.equals("패션")){
			path = "RewardFashion.jsp";
		}else if(category.equals("뷰티")){
			path = "Rewardbeauty.jsp";
		}else if(category.equals("스포츠")){
			path = "RewardSport.jsp";
		}else if(category.equals("공연")){
			path = "RewardConcert.jsp";
		}else if(category.equals("책")){
			path = "RewardBook.jsp";
		}else if(category.equals("취미")){
			path = "RewardGame.jsp";
		}else{
			path = "RewardMain.jsp";
		}
		System.out.println(path);	
		
		adActionForward forward = new adActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=Reward/"+path+"&opt="+order+"&select="+select);
		
		return forward;
	}

}
