package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDAO;
import model.TeamDTO;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		TeamDAO dao = new TeamDAO();
		TeamDTO dto = new TeamDTO();
		dto.setPhone(request.getParameter("phone"));
		dto.setHobby(request.getParameter("hobby"));
		dto.setSkills(request.getParameterValues("skills"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddress1(request.getParameter("address1"));
		dto.setAddress2(request.getParameter("address2"));
		dto.setInfo(request.getParameter("info"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		boolean flag = dao.update(dto);
		
		request.setAttribute("flag", flag);
		
		return "/view/updateProc.jsp";
	}

}
