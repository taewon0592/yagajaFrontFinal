package reservation;

public class ReservationVO 
{
	//예약하는데 보여져야 할 것들
	//lodge 테이블
	private String lodge_no;
	private String lodge_type;
	private String lodge_name;
	private String addr_common;
	private String addr_detail;
	
	//room 테이블
	private String room_no;
	private String room_type;
	private String room_person;
	private String room_photo;
	private String d_sleep_price;  //주중 숙박비용
	private String d_rent_price;  //주중 대실비용
	private String w_sleep_price; //주말 숙박비용
 	private String w_rent_price;  //주말 대실비용
 	
	//예약하고 저장해야 할 것들
 	private String reser_no;
 	private String reser_name;
 	private String check_in;
 	private String check_out;
 	private String visit_type;
 	private String reser_phone; //이건 멤버에서 조인
 	private String reser_date;
 	private String cancle_date;
 	private String cancle_fee;
 	private String payment_type;
 	private String payment_price;
 	private String auction_no;
 	private String hotdeal_no;
 	
 	//예약하고 저장해야할 회원 테이블
 	private String m_point; //m_point가 문제
 	private String member_no;

	
	//기본생성자
 	public ReservationVO() {}
 	
 	//인자생성자
	public ReservationVO(String lodge_no, String lodge_type, String lodge_name, String addr_common, String addr_detail,
			String room_no, String room_type, String room_person, String room_photo, String d_sleep_price,
			String d_rent_price, String w_sleep_price, String w_rent_price, String reser_no, String reser_name,
			String check_in, String check_out, String visit_type, String reser_phone, String reser_date,
			String cancle_date, String cancle_fee, String payment_type, String payment_price, String auction_no,
			String hotdeal_no) {
		super();
		this.lodge_no = lodge_no;
		this.lodge_type = lodge_type;
		this.lodge_name = lodge_name;
		this.addr_common = addr_common;
		this.addr_detail = addr_detail;
		this.room_no = room_no;
		this.room_type = room_type;
		this.room_person = room_person;
		this.room_photo = room_photo;
		this.d_sleep_price = d_sleep_price;
		this.d_rent_price = d_rent_price;
		this.w_sleep_price = w_sleep_price;
		this.w_rent_price = w_rent_price;
		this.reser_no = reser_no;
		this.reser_name = reser_name;
		this.check_in = check_in;
		this.check_out = check_out;
		this.visit_type = visit_type;
		this.reser_phone = reser_phone;
		this.reser_date = reser_date;
		this.cancle_date = cancle_date;
		this.cancle_fee = cancle_fee;
		this.payment_type = payment_type;
		this.payment_price = payment_price;
		this.auction_no = auction_no;
		this.hotdeal_no = hotdeal_no;
	}
	
	//setter/getter

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

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRoom_person() {
		return room_person;
	}

	public void setRoom_person(String room_person) {
		this.room_person = room_person;
	}

	public String getRoom_photo() {
		return room_photo;
	}

	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}

	public String getD_sleep_price() {
		return d_sleep_price;
	}

	public void setD_sleep_price(String d_sleep_price) {
		this.d_sleep_price = d_sleep_price;
	}

	public String getD_rent_price() {
		return d_rent_price;
	}

	public void setD_rent_price(String d_rent_price) {
		this.d_rent_price = d_rent_price;
	}

	public String getW_sleep_price() {
		return w_sleep_price;
	}

	public void setW_sleep_price(String w_sleep_price) {
		this.w_sleep_price = w_sleep_price;
	}

	public String getW_rent_price() {
		return w_rent_price;
	}

	public void setW_rent_price(String w_rent_price) {
		this.w_rent_price = w_rent_price;
	}

	public String getReser_no() {
		return reser_no;
	}

	public void setReser_no(String reser_no) {
		this.reser_no = reser_no;
	}

	public String getReser_name() {
		return reser_name;
	}

	public void setReser_name(String reser_name) {
		this.reser_name = reser_name;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public String getVisit_type() {
		return visit_type;
	}

	public void setVisit_type(String visit_type) {
		this.visit_type = visit_type;
	}

	public String getReser_phone() {
		return reser_phone;
	}

	public void setReser_phone(String reser_phone) {
		this.reser_phone = reser_phone;
	}

	public String getReser_date() {
		return reser_date;
	}

	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}

	public String getCancle_date() {
		return cancle_date;
	}

	public void setCancle_date(String cancle_date) {
		this.cancle_date = cancle_date;
	}

	public String getCancle_fee() {
		return cancle_fee;
	}

	public void setCancle_fee(String cancle_fee) {
		this.cancle_fee = cancle_fee;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}

	public String getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(String auction_no) {
		this.auction_no = auction_no;
	}

	public String getHotdeal_no() {
		return hotdeal_no;
	}

	public void setHotdeal_no(String hotdeal_no) {
		this.hotdeal_no = hotdeal_no;
	}

	public String getM_point() {
		return m_point;
	}

	public void setM_point(String m_point) {
		this.m_point = m_point;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	
 	
 	
 	
 	
 	
 	
 	
 	
}
