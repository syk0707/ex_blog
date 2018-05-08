package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamDAO;
import model.TeamDTO;
import utility.Utility;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word="";
		
		int nowPage=1;
		if(request.getParameter("nowPage")!=null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		int recordPerPage = 5;
		int sno = ((nowPage-1) * recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		TeamDAO dao = new TeamDAO();
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		List<TeamDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		return "/view/list.jsp";
	}

}
