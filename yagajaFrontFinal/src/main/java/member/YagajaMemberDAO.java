package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class YagajaMemberDAO {

	public YagajaMemberDAO() {
	}
	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	// 로그인처리
	/*public YagajaMemberVO login(String id, String pass) {
		String sql = "SELECT * FROM member WHERE id='" + id + "' and pass='" + pass + "'";
		YagajaMemberVO vo = null;
		try {
			vo = template.queryForObject(sql, new BeanPropertyRowMapper<YagajaMemberVO>(YagajaMemberVO.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}*/
	
}
