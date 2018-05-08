package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDAO;
import model.TeamDTO;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		TeamDAO dao = new TeamDAO();
		TeamDTO dto = dao.read(num);
		String info = dto.getInfo();
	    if(info !=null)
			info = info.replaceAll("\r\n", "<br>");
		else
			info = " "; 
	    
		request.setAttribute("dto", dto);
		request.setAttribute("info", info);
		
		return "/view/read.jsp";
	}

}
