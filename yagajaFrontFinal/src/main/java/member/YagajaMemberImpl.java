package member;

import org.apache.ibatis.annotations.Param;

public interface YagajaMemberImpl {

	//회원 로그인
	public YagajaMemberVO login(String id, String pass);
	
	//회원 가입
	public void join
	(@Param("_id")String id, @Param("_pass")String pass, @Param("_nickname")String nickname, @Param("_phone")String phone, @Param("_email")String email);
	
	//회원 정보보기
	public int view(String member_no, String phone, String nickname, String email, String id);
}
