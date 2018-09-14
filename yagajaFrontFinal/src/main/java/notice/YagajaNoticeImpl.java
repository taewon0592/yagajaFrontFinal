package notice;

import java.util.ArrayList;

public interface YagajaNoticeImpl {

	//리스터
	public ArrayList<NoticeVO> list();
	
	
	
	//공지 게시물 카운트
	public int getTotalCount();
	
	//공지 리스트 페이지 처리
	public ArrayList<NoticeVO> listPage(int s, int e);
	
	
	//공지 뷰~
	public NoticeVO view(String notice_no);
	
	
}
