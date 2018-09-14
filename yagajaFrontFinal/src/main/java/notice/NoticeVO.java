package notice;

import java.sql.Date;

public class NoticeVO {

	private int notice_no;
	private String notice_title;
	private String notice_contents;
	private String notice_name;
	private Date notice_regidate;
	public NoticeVO() {
		
	}
	public NoticeVO(int notice_no, String notice_title, String notice_contents, String notice_name, Date notice_regidate) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_name = notice_name;
		this.notice_regidate = notice_regidate;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public Date getNotice_regidate() {
		return notice_regidate;
	}
	public void setNotice_regidate(Date notice_regidate) {
		this.notice_regidate = notice_regidate;
	}
	
	
	
	
}
