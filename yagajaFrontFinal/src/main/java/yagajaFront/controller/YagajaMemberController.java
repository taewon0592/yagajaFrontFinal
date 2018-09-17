package yagajaFront.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.util.JSONPObject;

import hotdeal.HotdealDTO;
import hotdeal.HotdealImpl;
import member.YagajaMemberDAO;
import member.YagajaMemberDTO;
import member.YagajaMemberImpl;
import member.YagajaMemberVO;
import naver.NaverLoginBO;
import yagajaFront.model.EmailUtil;
import yagajaFront.model.PagingUtil;

@Controller
public class YagajaMemberController {

	YagajaMemberDAO dao;
	@Autowired
	public void setDao(YagajaMemberDAO dao) {
		this.dao = dao;
	}

	// 네아로 
	private NaverLoginBO naverLoginBO;
    private String apiResult = null;
   
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
       this.naverLoginBO = naverLoginBO;
    }
	   
	@Autowired
	private SqlSession sqlSession;
	
	// 채팅페이지
	@RequestMapping("chatting.do")
	public String write(Model model, HttpServletRequest req, HttpSession session) {

		return "main/chatting";
	}
	
	
   
   // 야가자 메인페이지
   @RequestMapping("/main/index.do")
   public String main(Model model, HttpServletRequest req, HttpSession session) {
    
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
      
   
   @RequestMapping(value = "/personalInfo")
   public void personalInfo(HttpServletRequest request) throws Exception {
        String token = "AAAANsBtQa0kcMIyx+k9u0roXGJGvQUnakBqe6tBCR2ug1BF6KD+swBp34Ev2akFFHUridED8LAd0F2ZuRUSY1dS0IY=";// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
   }

	
	
	// 로그인 페이지
   @RequestMapping("/member/login.do")
   public String login(Model model, HttpSession session) {
      /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      
      //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
      //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      System.out.println("네이버:" + naverAuthUrl);
      
      //네이버 
      model.addAttribute("url", naverAuthUrl);


      return "member/login";
   }

// 로그인처리
   @RequestMapping("/member/loginAction.do")
   public ModelAndView loginAction(HttpServletRequest req, HttpSession session,HttpServletResponse resp) throws IOException {
      
      // Mybatis사용
      YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).login(req.getParameter("id"),req.getParameter("pass"));
      PrintWriter writer = resp.getWriter();
      resp.setContentType("text/html; charset=UTF-8");
      ModelAndView mv = new ModelAndView();

      if (vo == null) {
         // 로그인 실패시
          writer.println("<script type='text/javascript'>");
           writer.println("alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요');");
           writer.println("</script>");
           writer.flush();
         mv.setViewName("member/login");
         return mv;
         
      } else {
         // 로그인 성공시
         writer.println("<script type='text/javascript'>");
           writer.println("alert('"+req.getParameter("id")+"님 환영합니다');");
           writer.println("</script>");
           writer.flush();
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
   public String logout(HttpSession session){
	   
     //기존값을 제거한다.
     session.removeAttribute("siteUserInfo");
      return "redirect:login.do";
   }
   
   //마이페이지 들어가기 전 패스워드 체크하는 페이지
   @RequestMapping("/member/passcheck.do")
   public String passcheck(Model model, HttpServletRequest req) {
      System.out.println("passwordcheck() 메소드호출");
   
      return "member/passcheck";
   }
   
   //탈퇴하기 전 패스워드 체크하는페이지
   @RequestMapping("/member/leavecheck.do")
   public String leavecheck(Model model) {
      System.out.println("leavecheck() 메소드호출");
   
      return "member/leavecheck";
   }
   
   
   //아이디 찾기 페이지(find_id)
   @RequestMapping("/member/find_id.do")
   public String find_id(Model model) {
      System.out.println("find_id() 메소드 호출");
      
      return    "member/find_id";
   }
   
   //아이디 찾기 (passId)
   @RequestMapping("/member/searchid.do")
   public String searchid(Model model,HttpServletRequest req, YagajaMemberVO yagajaMemberVO, HttpServletResponse resp) throws IOException {
      System.out.println("searchid() 메소드 호출");
      PrintWriter writer = resp.getWriter();
      resp.setContentType("text/html; charset=UTF-8");
      String nickname = req.getParameter("nickname");
      String email = req.getParameter("email");
      String choice = "idsearch";
      
      String id = sqlSession.getMapper(YagajaMemberImpl.class).find_id(nickname,email);
      
      System.out.println(id);
      
      //존재하는 아이디가 없을 때
      if(id==""||id==null) {
         
          writer.println("<script type='text/javascript'>");
           writer.println("alert('존재하지 않는 아이디입니다.');");
           writer.println("history.go(-1);");
           writer.println("</script>");
           writer.flush();
         return "member/find_id";
      }
      
      try {
         yagajaMemberVO.setId(id);
         EmailUtil.send_mail(yagajaMemberVO,choice);
          writer.println("<script type='text/javascript'>");
           writer.println("alert('찾으시는 아이디를 입력하신 이메일로 전송했습니다!');");
           writer.println("</script>");
           writer.flush();
           return "member/login";
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return    "member/find_id";
   }

   //비밀번호 변경 폼
   @RequestMapping("/member/changePass.do")
   public String changePass(Model model) {
      System.out.println("changePass() 메소드 호출");
      return    "member/changePass";
   }
   
   //비밀번호 변경처리
   @RequestMapping("/member/changePassAction.do")
   public String changepassAction(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
      PrintWriter writer = resp.getWriter();
      resp.setContentType("text/html; charset=UTF-8");
      System.out.println("changePassAction() 메소드 호출");
      String member_no = req.getParameter("member_no");
      String id = req.getParameter("id");
      String pass = req.getParameter("passchange1");
      
      int result = sqlSession.getMapper(YagajaMemberImpl.class).change_pw(id, pass, member_no);
      if(result==1) {
    	   session.setAttribute("siteUserInfo", null);
           writer.println("<script type='text/javascript'>");
           writer.println("alert('비밀번호가 변경되었습니다. 다시 로그인 해주세요!');");
           writer.println("</script>");
           writer.flush();
           return "member/login";
      }
      else {
          writer.println("<script type='text/javascript'>");
           writer.println("alert('비밀번호 변경이 실패했습니다.');");
           writer.println("history.go(-1);");
           writer.println("</script>");
           writer.flush();
         return "member/changePass";
      }
   }
   
   
   //비밀번호 찾기 폼(find_pass)
   @RequestMapping("/member/find_pass.do")
   public String find_pass(Model model) {
      System.out.println("find_pass() 메소드 호출");
      
      return    "member/find_pass";
   }
   
   //비밀번호 찾기(passSearch)
   @RequestMapping("/member/searchpw.do")
   public String searchpw(YagajaMemberVO yagajaMemberVO, Model model,HttpServletRequest req, HttpServletResponse resp) throws IOException {
      PrintWriter writer = resp.getWriter();
      resp.setContentType("text/html; charset=UTF-8");
      System.out.println("searchpw() 메소드 호출");
      
      //1. 아이디랑 이메일을 이용해 비밀번호를 찾고
      String id = req.getParameter("id");
      String email = req.getParameter("email");
      String pass = "";
      String choice = "passcheck";
      
      int passCheck = sqlSession.getMapper(YagajaMemberImpl.class).find_pw(id,email);
      System.out.println(passCheck);
      //2. 임시비밀번호를 만들고(난수생성) 회원의 비밀번호를 바꿔줌
      if(passCheck==1) {
         for (int i = 0; i < 12; i++) {
            pass += (char) ((Math.random() * 26) + 97);
         }
         yagajaMemberVO.setPass(pass);
         
         int result = sqlSession.getMapper(YagajaMemberImpl.class).update_pw(id, pass, email);
         
         //3. 바뀐 비밀번호를 이메일로 보내준다
         if(result==1) {
            try{
               EmailUtil.send_mail(yagajaMemberVO,choice);
               writer.println("<script type='text/javascript'>");
                writer.println("alert('입력하신 이메일로 임시비밀번호가 전송되었습니다!');");
                writer.println("</script>");
                writer.flush();
                return "member/login";
            }
            catch (Exception e) {
               e.printStackTrace();
            }
         }
         //이메일 발송실패
         else{
            writer.println("<script type='text/javascript'>");
             writer.println("alert('이메일 발송에 실패했습니다!');");
             writer.println("</script>");
             writer.flush();
            return "member/find_pass";
         }
      
      }
      //일치하는 회원정보가 DB에 없음
      else {
         writer.println("<script type='text/javascript'>");
          writer.println("alert('일치하는 정보가 없습니다!');");
          writer.println("</script>");
          writer.flush();
         return "member/find_pass";
      }
      return "member/login";
   }
   
   
   // 회원정보보기
   @RequestMapping("/member/mypageinfo.do")
   public String view(Model model, HttpServletRequest req, HttpSession session) {
      String member_no = req.getParameter("member_no");
      String id = req.getParameter("id");
      System.out.println("member_no:"+member_no);
      System.out.println("id:"+id);
   
      //로그인이 안되있다면 로그인페이지로 넘어가기
      if(session.getAttribute("siteUserInfo")==null){
         
         return "redirect:login.do";
      }
      else {
         YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).view(member_no,id);
         model.addAttribute("vo",vo);
         return "member/mypageinfo";
      }
   }
   
   //회원정보수정하기
   @RequestMapping("/member/mypageinfoModify.do")
   public String modify(Model model, HttpServletRequest req, HttpSession session) {
      
      return "redirect:mypageinfo.do";
   }
   
   
   
   //탈퇴 동의 후 회원탈퇴
    @RequestMapping("/member/memberwithdraw.do")
   public String memberwithdraw(Model model, HttpServletRequest req, HttpSession session) {
       
      System.out.println("memberwithdraw() 메소드 호출");
      
      String member_no = req.getParameter("member_no");
      
      String id = req.getParameter("id");
      
      YagajaMemberVO vo = sqlSession.getMapper(YagajaMemberImpl.class).view(member_no,id);

      model.addAttribute("vo",vo);
      
      return "member/memberwithdraw";
   }
    
    //삭제
    @RequestMapping("/member/memberdelete.do")
    public String memberdelete(Model model, HttpServletRequest req, HttpSession session ) {
       System.out.println("memberdelete() 메소드 호출");
       String member_no = req.getParameter("member_no");
       String leave_reason = req.getParameter("leave_reason");
       System.out.println(member_no);
       
       sqlSession.getMapper(YagajaMemberImpl.class).leaveMember(leave_reason,req.getParameter("leave_reason2"), member_no,req.getParameter("id"));
       System.out.println("leave_reason2:"+req.getParameter("leave_reason2"));
       System.out.println("leave_reason:"+req.getParameter("leave_reason"));
       System.out.println("member_no:"+req.getParameter("member_no"));
       System.out.println("id:"+req.getParameter("id"));
       
       sqlSession.getMapper(YagajaMemberImpl.class).withdrawMember(member_no);
       
       return "redirect:/main/index.do";
    }

	
}
