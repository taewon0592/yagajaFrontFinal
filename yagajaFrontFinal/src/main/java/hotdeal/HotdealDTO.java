package hotdeal;

public class HotdealDTO {
	
	private int hotdeal_no;
	private String hotdeal_stime;
	private	String hotdeal_etime;
	private int hotdeal_price;
	private int hotdeal_buy;
	private int hotdeal_sell;
	private String hotdeal_date;
	private String hotdeal_sday;
	private String hotdeal_eday;
	
	//롯지추가
	private String lodge_name;
	private String lodge_type;
	private int lodge_no;
	private String lodge_photo;
	private String lodge_feature;
	
	//핫딜 체크인 체크아웃 
	private String hotdeal_check_in;
	private String hotdeal_check_out;
	
	//핫딜 시작시간 종료시간 변환
	private String hotdeal_stime_ch;
	private String hotdeal_etime_ch;
	
	//룸추가
	private String room_type;
	private String room_photo;
	private String room_no;
	private int d_sleep_price; //주중숙박가격
	private int w_sleep_price; //주말숙박가격
	
	private String remain_time_sec; //경매까지 남은시간
	private String timeView; //보여주기위해 필요한 남은시간
	private String start_remain_time_sec; //경매종료 까지 남은시간
	private String start_timeView; //경매진행중 보여주기위해 필요한 남은시간
	
	
	public HotdealDTO() {
	
	}


	public HotdealDTO(int hotdeal_no, String hotdeal_stime, String hotdeal_etime, int hotdeal_price, int hotdeal_buy,
			int hotdeal_sell, String hotdeal_date, String hotdeal_sday, String hotdeal_eday, String lodge_name,
			String lodge_type, int lodge_no, String lodge_photo, String lodge_feature, String hotdeal_check_in,
			String hotdeal_check_out, String hotdeal_stime_ch, String hotdeal_etime_ch, String room_type,
			String room_photo, String room_no, int d_sleep_price, int w_sleep_price, String remain_time_sec,
			String timeView, String start_remain_time_sec, String start_timeView) {
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
		this.lodge_no = lodge_no;
		this.lodge_photo = lodge_photo;
		this.lodge_feature = lodge_feature;
		this.hotdeal_check_in = hotdeal_check_in;
		this.hotdeal_check_out = hotdeal_check_out;
		this.hotdeal_stime_ch = hotdeal_stime_ch;
		this.hotdeal_etime_ch = hotdeal_etime_ch;
		this.room_type = room_type;
		this.room_photo = room_photo;
		this.room_no = room_no;
		this.d_sleep_price = d_sleep_price;
		this.w_sleep_price = w_sleep_price;
		this.remain_time_sec = remain_time_sec;
		this.timeView = timeView;
		this.start_remain_time_sec = start_remain_time_sec;
		this.start_timeView = start_timeView;
	}


	public int getHotdeal_no() {
		return hotdeal_no;
	}


	public void setHotdeal_no(int hotdeal_no) {
		this.hotdeal_no = hotdeal_no;
	}


	public String getHotdeal_stime() {
		return hotdeal_stime;
	}


	public void setHotdeal_stime(String hotdeal_stime) {
		this.hotdeal_stime = hotdeal_stime;
	}


	public String getHotdeal_etime() {
		return hotdeal_etime;
	}


	public void setHotdeal_etime(String hotdeal_etime) {
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


	public String getHotdeal_date() {
		return hotdeal_date;
	}


	public void setHotdeal_date(String hotdeal_date) {
		this.hotdeal_date = hotdeal_date;
	}


	public String getHotdeal_sday() {
		return hotdeal_sday;
	}


	public void setHotdeal_sday(String hotdeal_sday) {
		this.hotdeal_sday = hotdeal_sday;
	}


	public String getHotdeal_eday() {
		return hotdeal_eday;
	}


	public void setHotdeal_eday(String hotdeal_eday) {
		this.hotdeal_eday = hotdeal_eday;
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


	public int getLodge_no() {
		return lodge_no;
	}


	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
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


	public String getHotdeal_check_in() {
		return hotdeal_check_in;
	}


	public void setHotdeal_check_in(String hotdeal_check_in) {
		this.hotdeal_check_in = hotdeal_check_in;
	}


	public String getHotdeal_check_out() {
		return hotdeal_check_out;
	}


	public void setHotdeal_check_out(String hotdeal_check_out) {
		this.hotdeal_check_out = hotdeal_check_out;
	}


	public String getHotdeal_stime_ch() {
		return hotdeal_stime_ch;
	}


	public void setHotdeal_stime_ch(String hotdeal_stime_ch) {
		this.hotdeal_stime_ch = hotdeal_stime_ch;
	}


	public String getHotdeal_etime_ch() {
		return hotdeal_etime_ch;
	}


	public void setHotdeal_etime_ch(String hotdeal_etime_ch) {
		this.hotdeal_etime_ch = hotdeal_etime_ch;
	}


	public String getRoom_type() {
		return room_type;
	}


	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}


	public String getRoom_photo() {
		return room_photo;
	}


	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}


	public String getRoom_no() {
		return room_no;
	}


	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}


	public int getD_sleep_price() {
		return d_sleep_price;
	}


	public void setD_sleep_price(int d_sleep_price) {
		this.d_sleep_price = d_sleep_price;
	}


	public int getW_sleep_price() {
		return w_sleep_price;
	}


	public void setW_sleep_price(int w_sleep_price) {
		this.w_sleep_price = w_sleep_price;
	}


	public String getRemain_time_sec() {
		return remain_time_sec;
	}


	public void setRemain_time_sec(String remain_time_sec) {
		this.remain_time_sec = remain_time_sec;
	}


	public String getTimeView() {
		return timeView;
	}


	public void setTimeView(String timeView) {
		this.timeView = timeView;
	}


	public String getStart_remain_time_sec() {
		return start_remain_time_sec;
	}


	public void setStart_remain_time_sec(String start_remain_time_sec) {
		this.start_remain_time_sec = start_remain_time_sec;
	}


	public String getStart_timeView() {
		return start_timeView;
	}


	public void setStart_timeView(String start_timeView) {
		this.start_timeView = start_timeView;
	}

	
}
