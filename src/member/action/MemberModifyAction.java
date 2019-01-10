package member.action;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyAction ()");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ServletContext ctx = request.getSession().getServletContext();
		
		String realPath = ctx.getRealPath("upload");
		
		int max = 1024*1024*5;
		String filename="";
		
		MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
		
		String user_photo = multi.getFilesystemName("user_photo");
		
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		
		MemberBean mbean = new MemberBean();

		//System.out.println(request.getParameter("user_content"));
		

		mbean.setUser_id(user_id);
		mbean.setUser_name(multi.getParameter("user_name"));
		mbean.setUser_phone(multi.getParameter("user_phone"));
		mbean.setUser_photo(user_photo);
		mbean.setUser_content(multi.getParameter("user_content"));
		mbean.setBirthyyyy(multi.getParameter("birthyyyy"));
		mbean.setBirthmm(multi.getParameter("birthmm"));
		mbean.setBirthdd(multi.getParameter("birthdd"));
		
		System.out.println(user_photo);
		System.out.println(user_id);
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.updateUser(mbean);
		
		request.setAttribute("mbean", mbean);
		request.setAttribute("myPage_center", "../member/mypage.jsp");
		
	//ArrayList for saving file names	
		ArrayList<String> saveFiles = new ArrayList<String>();
			
	//for adding original-file names
		ArrayList originFiles = new ArrayList();
				
		Enumeration e = multi.getFileNames();
				
		while (e.hasMoreElements()) {
			filename = (String)e.nextElement();
					
			saveFiles.add(multi.getFilesystemName(filename));
			originFiles.add(multi.getOriginalFileName(filename));
		}		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		
		
		return forward;
	}

}
