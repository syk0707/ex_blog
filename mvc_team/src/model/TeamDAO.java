package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class TeamDAO {
	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(*) AS cnt FROM team ");
		if(word.trim().length()>0) {
			sql.append(" WHERE "+col+" LIKE '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;
	}
	
	public boolean create(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append("INSERT INTO team( num, name, gender, phone, skills    ");
		sql.append(" ,hobby,zipcode,address1,address2,info)");
		sql.append("VALUES          ((SELECT nvl(max(num),0) +1 FROM team), ?, ?, ?, ?");
		sql.append(",?, ?, ?, ?, ?)");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getSkillstr());
			pstmt.setString(5, dto.getHobby());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getInfo());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;

	}

	public List<TeamDTO> list(Map map) {
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();

		sql.append(" 	SELECT num, name, phone, skills, r");
		sql.append(" 	FROM(");
		sql.append(" 		SELECT num, name, phone, skills, rownum r");
		sql.append(" 		FROM(");
		sql.append("			SELECT num, name, phone, skills	");
		sql.append("			FROM team");
		if(word.trim().length()>0) {
			sql.append(" 		WHERE "+col+" like '%'||?||'%' ");}
		sql.append("			ORDER BY num desc");
		sql.append(" 			)");
		sql.append(" 		)");
		sql.append(" 	WHERE r>=? and r<=?");

		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			int i = 0;
			
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);}
						
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkillstr(rs.getString("skills")); // 주의

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	public TeamDTO read(int num) {
		TeamDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT *     ");
		sql.append(" FROM team    ");
		sql.append(" WHERE num = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new TeamDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkillstr(rs.getString("skills"));
				dto.setHobby(rs.getString("hobby"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setInfo(rs.getString("info"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;
	}

	public boolean update(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE team	   ");
		sql.append("SET phone = ?,    ");
		sql.append("	hobby = ?,    ");
		sql.append("	skills = ?,    ");
		sql.append("	zipcode = ?,    ");
		sql.append("	address1 = ?,    ");
		sql.append("	address2 = ?,    ");
		sql.append("	info = ?    ");
		sql.append("WHERE num = ?    ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getHobby());
			pstmt.setString(3, dto.getSkillstr());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getInfo());
			pstmt.setInt(8, dto.getNum());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public boolean delete(int num) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("  DELETE FROM team ");
		sql.append("  WHERE num = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);

		}
		return flag;
	}
}
