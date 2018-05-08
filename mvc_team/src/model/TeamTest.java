package model;

import java.util.List;

public class TeamTest {

	public static void main(String[] args) {
		TeamDAO dao = new TeamDAO();
		
		//create(dao);
		//list(dao);
	}

	private static void list(TeamDAO dao) {
		
		
		List<TeamDTO> list = dao.list(null);
		
		for(int i = 0; i<list.size(); i++) {
			TeamDTO dto = list.get(i);
			
			p(dto);
			p("===============");
		}
	}
	
	private static void p(TeamDTO dto) {
		p("번호:" + dto.getNum());
		p("이름:" + dto.getName());
		p("성별:" + dto.getGender());
		p("전화번호:" + dto.getPhone());
		p("보유기술:" + dto.getSkillstr());
		p("취미:" + dto.getHobby());
		p("우편번호:" + dto.getZipcode());
		p("주소:" + dto.getAddress1());
		p("주소2:" + dto.getAddress2());
		p("정보:" + dto.getInfo());
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setName("아로미");
		dto.setGender("여자");
		dto.setHobby("등산");
		dto.setZipcode("13432");
		dto.setAddress1("서울시 종로구 관철동");
		dto.setAddress2("13-13 코아빌딩");
		dto.setInfo("성실함");
		String[] skills = {"Java", "JSP"};
		dto.setSkills(skills);
		dto.setPhone("010-1234-5678");
		if(dao.create(dto)) {
			p("성공");
			
		}else {
			p("실패");
		}
		
	}
	
	private static void p(String string) {
		System.out.println(string);
	}
}
