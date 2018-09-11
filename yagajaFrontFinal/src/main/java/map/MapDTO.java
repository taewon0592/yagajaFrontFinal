package map;

public class MapDTO {	
	//멤버변수
	private String lodge_no;
	private String lodge_type;
	private String lodge_name;
	private String addr_zipcode;
	private String addr_common;  
	private String addr_detail; 
	private String addr_lat;  
	private String addr_long;
	//기본생성자
	public MapDTO() {
		super();
	}
	//인자생성자
	public MapDTO(String lodge_no, String lodge_type, String lodge_name, String addr_zipcode, String addr_common,
			String addr_detail, String addr_lat, String addr_long) {
		super();
		this.lodge_no = lodge_no;
		this.lodge_type = lodge_type;
		this.lodge_name = lodge_name;
		this.addr_zipcode = addr_zipcode;
		this.addr_common = addr_common;
		this.addr_detail = addr_detail;
		this.addr_lat = addr_lat;
		this.addr_long = addr_long;
	}
	//getter/setter
	public String getAddr_zipcode() {
		return addr_zipcode;
	}
	public void setAddr_zipcode(String addr_zipcode) {
		this.addr_zipcode = addr_zipcode;
	}
	public String getAddr_common() {
		return addr_common;
	}
	public void setAddr_common(String addr_common) {
		this.addr_common = addr_common;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getAddr_lat() {
		return addr_lat;
	}
	public void setAddr_lat(String addr_lat) {
		this.addr_lat = addr_lat;
	}
	public String getAddr_long() {
		return addr_long;
	}
	public void setAddr_long(String addr_long) {
		this.addr_long = addr_long;
	}
	public String getLodge_no() {
		return lodge_no;
	}
	public void setLodge_no(String lodge_no) {
		this.lodge_no = lodge_no;
	}
	public String getLodge_type() {
		return lodge_type;
	}
	public void setLodge_type(String lodge_type) {
		this.lodge_type = lodge_type;
	}
	public String getLodge_name() {
		return lodge_name;
	}
	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}
}
