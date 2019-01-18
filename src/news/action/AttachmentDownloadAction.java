package news.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttachmentDownloadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String path = request.getParameter("path");
		String name = request.getParameter("name");
		
		ServletContext ctx = request.getSession().getServletContext();
		
		/* 1.dispatching virtual upload path 
		   2.and getting realPath to upload */
		String realPath = ctx.getRealPath("/" + path);
		
		response.setContentType("Application/x-msdownload");
		response.setHeader("Content-Disposition", "attachment;filename=" + name);
		
		File file = new File(realPath + "/" + new String(name.getBytes("8859_1"), "utf-8"));
		byte[] data = new byte[1024];
		
		
		if(file.isFile()){
			
			try {
				
				BufferedInputStream input = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
				
				int read;
				
				while((read=input.read(data)) != -1){
					
					output.write(data, 0, read);
				}
				output.flush();
				output.close();
				input.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}//if
	
		return null;
		
	}

}
