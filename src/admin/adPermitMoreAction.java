package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;

public class adPermitMoreAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub	
		String center = request.getParameter("center");
		System.out.println(center);
		if(center == null){
			center = "pd_start";
		}
		
		BoardDAO bDAO = new BoardDAO();
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		//����¡ ó��
		//�� ������ �� ������ �� ��� ��
		int pageSize = 9; 
		//������ �׷� ���� ������ �� (1,2,3,4,5) 
		int pageGroupSize = 5;
		//���� ������ ��ȣ
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		if(currentPage < 1){
			currentPage = 1;
		}
		//�� ��� ����
		int listCount = bDAO.getPermitListCount();
		
		int number = listCount-(currentPage-1)*pageSize;
		//������ �׷� ����(1�׷쿡 5�� ������)
		int pageGroupCount = listCount/(pageSize*pageGroupSize)+( listCount % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		//������ �׷��� ��ȣ(1�׷� �� ��ȣ�� 1, 2�׷��� ��ȣ�� 2 ...)
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
		//�� ������ ù ���� ��� ��ȣ �� ������ ��� ��ȣ
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//����¡ ó�� ��
		//����Ʈ ��ȸ limit���� startRow , pageSize
		if(listCount > 0){
			list = bDAO.getPermitList(center,startRow,pageSize);
		}else{
			list = null;
		}
		
		request.setAttribute("currentPage", currentPage);
		System.out.println("currentPage: "+currentPage);
		request.setAttribute("startRow", startRow);
		System.out.println("startRow: "+startRow);
		request.setAttribute("endRow", endRow);
		System.out.println("endRow: "+endRow);
		request.setAttribute("listCount", listCount);
		System.out.println("listCount: "+listCount);
		request.setAttribute("pageSize", pageSize);
		System.out.println("pageSize: "+pageSize);
		request.setAttribute("number", number);
		System.out.println("number: "+number);
		request.setAttribute("pageGroupSize", pageGroupSize);
		System.out.println("pageGroupSize: "+pageGroupSize);
		request.setAttribute("numPageGroup", numPageGroup);
		System.out.println("numPageGroup: "+numPageGroup);
		request.setAttribute("pageGroupCount", pageGroupCount);
		System.out.println("pageGroupCount: "+pageGroupCount);
		request.setAttribute("totalPage", totalPage);
		System.out.println("totalPage: "+totalPage);
		request.setAttribute("startPage", startPage);
		System.out.println("startPage: "+startPage);
		request.setAttribute("endPage", endPage);
		System.out.println("endPage: "+endPage);
		request.setAttribute("list", list);
		
		adActionForward forward = new adActionForward();
		forward.setRedirect(false);
		forward.setPath("./Reward/RewardMore.jsp");
		
		return forward;
	}
}
