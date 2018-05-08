package model;

public class TeamDTO {
	private int num;
	private String name;
	private String gender;
	private String phone;
	private String hobby;
	
	//form에서 보내는 데이터 저장위한 필드
	private String[] skills;
	
	//DB에 저장하거나 가져오거나 할때
	private String skillstr;
	
	private String zipcode;
	private String address1;
	private String address2;
	private String info;
	
	public String getSkillstr() {
		
		if(skills!=null) { // 폼에서 보내는 데이터가 있다면
			String skillstr="";
			for(int i=0;i<skills.length;i++) {
				skillstr+= skills[i];
				if(i<skills.length-1) {
				skillstr +=",";
			}
			}
			return skillstr;
		}else { //db에서 읽어왔을 때
			return skillstr;
		}
	}
	public void setSkillstr(String skillstr) {
		this.skillstr = skillstr;
	}
	
	public int getNum() {
		return num;
	}
		
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String[] skills) {
		this.skills = skills;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
