package news.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import news.db.NewsDAO;
import news.db.Newsbean;

public class NewsWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NewsWriteAction ()");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ServletContext ctx = request.getSession().getServletContext();
		
		String realPath = ctx.getRealPath("upload");
		
		int max = 1024*1024*5;
		String filename="";
		
		MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
		
		Newsbean nbean =  new Newsbean();
		
		String reNews_file = multi.getFilesystemName("reNews_file");
		String reNews_img = multi.getFilesystemName("reNews_img");
		//System.out.println(reNews_file);
		
		nbean.setUser_id(multi.getParameter("user_id"));
		nbean.setUser_name(multi.getParameter("user_name"));
		nbean.setReNews_title(multi.getParameter("reNews_title"));
		nbean.setReNews_summary(multi.getParameter("reNews_summary"));
		nbean.setReNews_content(multi.getParameter("reNews_content"));
		nbean.setReNews_file(reNews_file);
		nbean.setReNews_date(new Timestamp(System.currentTimeMillis()));
		nbean.setReNews_category(multi.getParameter("reNews_category"));
		nbean.setReNews_img(reNews_img);
		
		NewsDAO ndao = new NewsDAO();
		
		ndao.insertNews(nbean);
		
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
		forward.setRedirect(true);
		forward.setPath("./NewsAction.news");
		
		return forward;
	}

}
