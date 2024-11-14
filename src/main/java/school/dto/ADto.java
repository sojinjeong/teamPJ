package school.dto;

import java.sql.Timestamp;

//출석부 DB
public class ADto {
	private int stNum;
	private String dep;
	private String stName;
	private String stPhoneNum;
	private String stAddr1;
	private String stAddr2;
	private int att;
	private int abs;
	private int late;
	private int ets;
	private Timestamp time;
	private String status;
	
	public int getStNum() {
		return stNum;
	}
	public void setStNum(int stNum) {
		this.stNum = stNum;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getStPhoneNum() {
		return stPhoneNum;
	}
	public void setStPhoneNum(String stPhoneNum) {
		this.stPhoneNum = stPhoneNum;
	}
	public String getStAddr1() {
		return stAddr1;
	}
	public void setStAddr1(String stAddr1) {
		this.stAddr1 = stAddr1;
	}
	public String getStAddr2() {
		return stAddr2;
	}
	public void setStAddr2(String stAddr2) {
		this.stAddr2 = stAddr2;
	}
	public int getAtt() {
		return att;
	}
	public void setAtt(int att) {
		this.att = att;
	}
	public int getAbs() {
		return abs;
	}
	public void setAbs(int abs) {
		this.abs = abs;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public int getEts() {
		return ets;
	}
	public void setEts(int ets) {
		this.ets = ets;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
