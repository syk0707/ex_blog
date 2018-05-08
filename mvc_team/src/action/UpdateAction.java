package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDAO;
import model.TeamDTO;

public class UpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		TeamDAO dao = new TeamDAO();
		TeamDTO dto = dao.read(num);
		
		request.setAttribute("dto", dto);
		return "/view/updateForm.jsp";
	}

}
