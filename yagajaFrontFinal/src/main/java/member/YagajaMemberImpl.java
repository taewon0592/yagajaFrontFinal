package member;

import org.springframework.ui.Model;

//게시판의 모든 클래스가 구현할 인터페이스
public interface YagajaMemberImpl {

	public YagajaMemberVO login(String id, String pass);
	
	public void join(String id, String pass, String nickname, String phone, String email);

	public YagajaMemberVO view(String member_no, String id);
	
	public int modify(String member_no, String nickname, String phone );

	public int idcheck(String id);
}
	