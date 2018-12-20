package myPage;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.BoardBean;
import admin_db.MemberBean;
import my_db.InvestBean;
import my_db.myDAO;

public class myIndexAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String user_id = "id";
		//String user_id = (String)session.getAttribute("user_id");
		
		//일단 user_id 테스트용으로 지정
		if(user_id.equals("") || user_id == null){
			user_id = "id";
		}
		
		myDAO mydao = new myDAO();
		
		MemberBean mbean = mydao.getUser(user_id);
		ArrayList<BoardBean> goodlist = mydao.getGoodBoard(user_id);
		ArrayList<InvestBean> invelist = mydao.getRewardBoard(user_id);
		
		request.setAttribute("memberBean", mbean);
		request.setAttribute("goodlist", goodlist);
		request.setAttribute("goodlistSize", goodlist.size());
		request.setAttribute("invelist", invelist);		
		
		myActionForward forward = new myActionForward();
		forward.setPath("./index.jsp?center=./myPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
