package yagajaFront.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.YagajaMemberDAO;
import member.YagajaMemberDTO;
import member.YagajaMemberImpl;
import member.YagajaMemberVO;

@Controller
public class YagajaMemberController {

	/*
	 * servlet-context.xml에서 생성한 빈을 자동으로 주입받기 위한 설정으로 MyBoardDAO를 기반으로 생성한 빈을 자동주입받기
	 * 때문에 new MyBoardDAO()로 객체를 별도로 생성할 필요 없이 dao.메소드()형태로 즉시 호출할 수 있다.
	 */

	@Autowired
	YagajaMemberDAO dao;

	public void setDao(YagajaMemberDAO dao) {
		this.dao = dao;
	}

	@Autowired
	private SqlSession sqlSession;

	// 야가자 메인페이지
	@RequestMapping("/main/index.do")
	public String main(Model model, HttpServletRequest req) {
		return "main/index";
	}

	// 숙소리스트페이지
	@RequestMapping("/main/list.do")
	public String list(Model mode, HttpServletRequest req) {
		return "main/list";
	}
	
	// 회원가입 동의페이지
	@RequestMapping("/member/memberjoin.do")
	public String memberjoin(Model model, HttpServletRequest req) {
		
		return "member/memberjoin";
	}

	// 회원가입
	@RequestMapping("/member/memberjoinForm.do")
	public String memberjoinForm(Model model,HttpSession session) {
		
		return "member/memberjoinForm";
	}
	
	// 회원가입처리
	@RequestMapping("/member/memberjoinFormAction.do")
	public String memberjoinForm(Model model, HttpServletRequest req,HttpSession session) {
		
		/*//로그인이 해제되었는지 확인 후 작성 완료
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:member/login.do";
		}*/
		sqlSession.getMapper(YagajaMemberImpl.class).join(
				req.getParameter("id"),req.getParameter("pass"),
				req.getParameter("nickname"),req.getParameter("phone"),
				req.getParameter("email"));
		
		return "redirect:/main/main.do";
	}
	
	// 로그인 페이지
	@RequestMapping("/member/login.do")
	public String login(Model model) {

		return "member/login";
	}

	// 로그인처리
	@RequestMapping("/member/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session) {

		// JDBCTemplate 사용
		// MemberVO vo = dao.login(req.getParameter("id"),req.getParameter("pass"));

		// Mybatis사용
		YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).login(req.getParameter("id"),
				req.getParameter("pass"));

		ModelAndView mv = new ModelAndView();

		if (vo == null) {
			// 로그인 실패시
			mv.addObject("IdNG", "아이디가 틀렸습니다.");
			mv.addObject("PassNG", "비밀번호가 틀렸습니다.");
			mv.setViewName("member/login");
			return mv;
		} else {
			// 로그인 성공시
			session.setAttribute("siteUserInfo", vo);
		}

		// 로그인 후 페이지 이동
		String backUrl = req.getParameter("backUrl");
		if (backUrl == null || backUrl.equals("")) {
			mv.setViewName("Main/main");
		} else {
			mv.setViewName("backUrl");
		}
		return mv;
	}

	// 로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		// 세션영역에 저장된 데이터를 지워준다
		session.setAttribute("siteUserInfo", null);

		return "redirect:login.do";
	}

	
	// 회원정보보기
	@RequestMapping("/member/mypageInfo.do")
	public String view(Model model, HttpServletRequest req, HttpSession session) {
		
		//로그인이 안되있다면 로그인페이지로 넘어가기
		if(session.getAttribute("siteUserInfo")==null){
			return "redirect:login.do";
		}
		
	/*	YagajaMemberDTO dto = sqlSession.getMapper(YagajaMemberImpl.class).view(req.getParameter("id"),((YagajaMemberVO)session.getAttribute("siteUserInfo")).getId());
		
		
		model.addAttribute("dto",dto);*/
		return "member/mypageInfo";
	}
}
