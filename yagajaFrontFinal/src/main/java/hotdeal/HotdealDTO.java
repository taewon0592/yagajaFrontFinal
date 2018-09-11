package hotdeal;

import java.sql.Date;

public class HotdealDTO {
	
	private int hotdeal_no;
	private Date hotdeal_stime;
	private	Date hotdeal_etime;
	private int hotdeal_price;
	private int hotdeal_buy;
	private int hotdeal_sell;
	private Date hotdeal_date;
	private Date hotdeal_sday;
	private Date hotdeal_eday;
	//롯지추가
	private String lodge_name;
	private String lodge_type;
	private int lodge_no;
	private String lodge_photo;
	private String lodge_feature;
	
	//룸추가
	private String room_type;
	private int room_no;
	
	public HotdealDTO() {
	
	}

	public HotdealDTO(int hotdeal_no, Date hotdeal_stime, Date hotdeal_etime, int hotdeal_price, int hotdeal_buy,
			int hotdeal_sell, Date hotdeal_date, Date hotdeal_sday, Date hotdeal_eday, String lodge_name,
			String lodge_type, int lodge_no, String lodge_photo, String lodge_feature,String room_type, int room_no) {
		super();
		this.hotdeal_no = hotdeal_no;
		this.hotdeal_stime = hotdeal_stime;
		this.hotdeal_etime = hotdeal_etime;
		this.hotdeal_price = hotdeal_price;
		this.hotdeal_buy = hotdeal_buy;
		this.hotdeal_sell = hotdeal_sell;
		this.hotdeal_date = hotdeal_date;
		this.hotdeal_sday = hotdeal_sday;
		this.hotdeal_eday = hotdeal_eday;
		this.lodge_name = lodge_name;
		this.lodge_type = lodge_type;
		this.lodge_feature = lodge_feature;
		this.lodge_no = lodge_no;
		this.lodge_photo = lodge_photo;
		this.room_type = room_type;
		this.room_no = room_no;
	}





	public int getHotdeal_no() {
		return hotdeal_no;
	}

	public void setHotdeal_no(int hotdeal_no) {
		this.hotdeal_no = hotdeal_no;
	}

	public Date getHotdeal_stime() {
		return hotdeal_stime;
	}

	public void setHotdeal_stime(Date hotdeal_stime) {
		this.hotdeal_stime = hotdeal_stime;
	}

	public Date getHotdeal_etime() {
		return hotdeal_etime;
	}

	public void setHotdeal_etime(Date hotdeal_etime) {
		this.hotdeal_etime = hotdeal_etime;
	}

	public int getHotdeal_price() {
		return hotdeal_price;
	}

	public void setHotdeal_price(int hotdeal_price) {
		this.hotdeal_price = hotdeal_price;
	}

	public int getHotdeal_buy() {
		return hotdeal_buy;
	}

	public void setHotdeal_buy(int hotdeal_buy) {
		this.hotdeal_buy = hotdeal_buy;
	}

	public int getHotdeal_sell() {
		return hotdeal_sell;
	}

	public void setHotdeal_sell(int hotdeal_sell) {
		this.hotdeal_sell = hotdeal_sell;
	}

	public Date getHotdeal_date() {
		return hotdeal_date;
	}

	public void setHotdeal_date(Date hotdeal_date) {
		this.hotdeal_date = hotdeal_date;
	}

	public Date getHotdeal_sday() {
		return hotdeal_sday;
	}

	public void setHotdeal_sday(Date hotdeal_sday) {
		this.hotdeal_sday = hotdeal_sday;
	}

	public Date getHotdeal_eday() {
		return hotdeal_eday;
	}

	public void setHotdeal_eday(Date hotdeal_eday) {
		this.hotdeal_eday = hotdeal_eday;
	}

	public int getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}


	public String getLodge_name() {
		return lodge_name;
	}


	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}


	public String getLodge_type() {
		return lodge_type;
	}


	public void setLodge_type(String lodge_type) {
		this.lodge_type = lodge_type;
	}


	public String getRoom_type() {
		return room_type;
	}


	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getLodge_photo() {
		return lodge_photo;
	}

	public void setLodge_photo(String lodge_photo) {
		this.lodge_photo = lodge_photo;
	}

	public String getLodge_feature() {
		return lodge_feature;
	}

	public void setLodge_feature(String lodge_feature) {
		this.lodge_feature = lodge_feature;
	}
	
	
}
