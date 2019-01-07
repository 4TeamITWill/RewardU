package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;


public class adPermitAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				
				BoardDAO bDao = new BoardDAO();
				//Request
				String result = request.getParameter("result");
					if(result == null) result = "A";
					System.out.println("result: "+ result);
				String order1 = request.getParameter("order");
					if(order1 == null) order1 = "7";
				int order = Integer.parseInt(order1);
					System.out.println("order: "+ order);
				String category = request.getParameter("category");
					if(category == null ) category = "N";
					System.out.println("category: "+ category);
				//Page
				String currentPage = request.getParameter("currentPage");
					if(currentPage == null) currentPage = "1";
				int currentPage1 = Integer.parseInt(currentPage);
					System.out.println("currentPage1: "+currentPage1);
				int count = bDao.getPermitListCount(result,category);
					System.out.println("count: "+count);
				int pageSize = 9;
				int startRow = (currentPage1-1)*pageSize + 1;
				int pageCount = count/pageSize+(count%pageSize==0?0:1);
					System.out.println("pageCount: "+pageCount);
				int pageBlock = 5;
				int startPage = ((currentPage1-1)/pageBlock)*pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount) endPage = pageCount;
				//List
				ArrayList<BoardBean> list = new ArrayList<BoardBean>();				
					if(currentPage1 > 0){
						list = bDao.getPermitList(category,result,order,startRow,pageSize);
					}else{
						list = null;
					}
				
				request.setAttribute("result", result);
				request.setAttribute("order", order);
				request.setAttribute("category", category);
				request.setAttribute("currentPage", currentPage1);
				request.setAttribute("count", count);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("list", list);
				
				
				
				if(category.equals("N")){
					request.setAttribute("Reward_center", "RewardAll.jsp");
				}else if(category.equals("전자")){
					request.setAttribute("Reward_center", "RewardTech.jsp");
				}else if(category.equals("패션")){
					request.setAttribute("Reward_center", "RewardFashion.jsp");
				}else if(category.equals("뷰티")){
					request.setAttribute("Reward_center", "RewardBeauty.jsp");
				}else if(category.equals("공연")){
					request.setAttribute("Reward_center", "RewardConcert.jsp");
				}else if(category.equals("스포츠")){
					request.setAttribute("Reward_center", "RewardSport.jsp");
				}else if(category.equals("책")){
					request.setAttribute("Reward_center", "RewardBook.jsp");
				}else if(category.equals("취미")){
					request.setAttribute("Reward_center", "RewardGame.jsp");
				}
				System.out.println("============================");
				adActionForward forward = new adActionForward();
				forward.setRedirect(false);
				if(currentPage1 < 2){
					forward.setPath("./index.jsp?center=Reward/RewardMain.jsp");
				}else {
					forward.setPath("./Reward/MorePage.jsp");
				}
					
				return forward;
			}
}
