package yagajaFront.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.reflect.MemberSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotdeal.HotdealDTO;
import hotdeal.HotdealImpl;
import member.YagajaMemberDAO;
import member.YagajaMemberDTO;
import member.YagajaMemberImpl;
import member.YagajaMemberVO;
import yagajaFront.model.PagingUtil;

@Controller
public class YagajaMemberController {

	YagajaMemberDAO dao;
	@Autowired
	public void setDao(YagajaMemberDAO dao) {
		this.dao = dao;
	}

	@Autowired
	private SqlSession sqlSession;
	
	//핫딜페이지 확인
	@RequestMapping("/hotdeal/hotdealList.do")
	public String hotdealList(Model model, HttpServletRequest req) {
		
		int totalRecordCount = sqlSession.getMapper(HotdealImpl.class).getTotalCount();
		
		int pageSize = 6;
		int blockPage = 10;
		
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		ArrayList<HotdealDTO> lists = sqlSession.getMapper(HotdealImpl.class).hotdealList(start, end);

		// 페이지 처리를 위한 처리부분
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/hotdeal/hotdealList.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		model.addAttribute("lists", lists);
		return "hotdeal/hotdealList";
	}
	
	// 야가자 메인페이지
	@RequestMapping("/main/index.do")
	public String main(Model model, HttpServletRequest req, HttpSession session) {
		//기존에 siteUserInfo 세션값이 존재하면
		if(session.getAttribute("siteUserInfo")!=null) {
			//기존값을 제거한다.
			session.removeAttribute("siteUserInfo");
		}
		System.out.println("index() 메소드 호출됨");
		return "main/index";
	}

	// 숙소리스트페이지
	@RequestMapping("/main/list.do")
	public String list(Model model, HttpServletRequest req) {
		System.out.println("list() 메소드 호출됨");
	
		return "main/list";
	}
	
	// 회원가입 동의페이지
	@RequestMapping("/member/memberjoin.do")
	public String memberjoin(Model model, HttpServletRequest req) {
		System.out.println("memberjoin() 메소드 호출됨");
		return "member/memberjoin";
	}
	
	
	//아이디중복확인
	@RequestMapping("/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String id) {
        System.out.println("아이디중복확인메소드호출");
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = sqlSession.getMapper(YagajaMemberImpl.class).idcheck(id);
        map.put("cnt", count);
        if(count==0) {
        	System.out.println("아이디사용가능:"+count);
        }
        else {
        	System.out.println("아이디사용불가능:"+count);
        }
        return map;
    }
	// 회원가입
	@RequestMapping("/member/memberjoinForm.do")
	public String memberjoinForm(Model model,HttpSession session) {
		System.out.println("memberjoinForm() 메소드 호출됨");
		return "member/memberjoinForm";
	}
	
	@RequestMapping("/member/callback.do")
	public String naverLogin(HttpSession session) {
		return "member/callback";
	}
	
	
	// 회원가입처리
	@RequestMapping("/member/memberjoinFormAction.do")
	public String memberjoinForm(Model model, HttpServletRequest req) {
		
	
	String phone = req.getParameter("phone_1")+"-"+req.getParameter("phone_2")+"-"+req.getParameter("phone_3");
	String email = req.getParameter("email_1")+"@"+req.getParameter("email_2");
	String id = req.getParameter("id");
	String pass = req.getParameter("pass");
	String nickname = req.getParameter("nickname");
	
	sqlSession.getMapper(YagajaMemberImpl.class).join(id, pass, nickname ,phone, email);
	
	
	System.out.println("가입성공!");
	return "redirect:/main/index.do";
	}
	
	
	// 로그인 페이지
	@RequestMapping("/member/login.do")
	public String login(Model model) {

		return "member/login";
	}

	// 로그인처리
	@RequestMapping("/member/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session,HttpServletResponse resp) {
		
		// Mybatis사용
		YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).login(req.getParameter("id"),req.getParameter("pass"));

		ModelAndView mv = new ModelAndView();

		if (vo == null) {
			// 로그인 실패시
			mv.addObject("IdNG", "아이디가 틀렸습니다.");
			mv.addObject("PassNG", "비밀번호가 틀렸습니다.");
			mv.setViewName("member/login");
			return mv;
			
			
		} else {
			// 로그인 성공시
			session.setAttribute("id", req.getParameter("id"));
			session.setAttribute("pass", req.getParameter("pass"));
			session.setAttribute("member_no", req.getParameter("member_no"));
			session.setAttribute("siteUserInfo", vo);
		
		}

		// 로그인 후 페이지 이동
		String backUrl = req.getParameter("backUrl");
		if (backUrl == null || backUrl.equals("")) {
			mv.setViewName("main/index");
		} else {
			mv.setViewName("redirect:login.do");
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
	@RequestMapping("/member/mypageinfo.do")
	public String view(Model model, HttpServletRequest req, HttpSession session) {
		
		String member_no = req.getParameter("member_no");
				
		String id = req.getParameter("id");
		System.out.println("member_no:"+member_no);
		System.out.println(id+"->id");
		
		//로그인이 안되있다면 로그인페이지로 넘어가기
		if(session.getAttribute("siteUserInfo")==null){
			
			return "redirect:login.do";
		}
		
		YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).view(member_no,id);

		model.addAttribute("vo",vo);
		
		return "member/mypageinfo";
	}
	
	//회원정보수정하기
	@RequestMapping("/member/mypageinfoModify.do")
	public String modify(Model model, HttpServletRequest req, HttpSession session) {
		
		
		return "redirect:mypageinfo.do";
	}
}
