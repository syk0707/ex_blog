package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDAO;
import model.TeamDTO;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		TeamDTO dto = new TeamDTO();
		dto.setName(request.getParameter("name"));
		dto.setGender(request.getParameter("gender"));
		dto.setPhone(request.getParameter("phone"));
		dto.setHobby(request.getParameter("hobby"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddress1(request.getParameter("address1"));
		dto.setAddress2(request.getParameter("address2"));
		dto.setSkills(request.getParameterValues("skills"));
		dto.setInfo(request.getParameter("info"));
		TeamDAO dao = new TeamDAO();
		boolean flag = dao.create(dto);
		
		request.setAttribute("flag", flag);
		return "/view/teaminfo_proc.jsp";
	}

}
