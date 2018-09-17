package yagajaFront.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.YagajaAuctionDTO;
import auction.YagajaAuctionImpl;
import hotdeal.HotdealImpl;
import reservation.ReservationImpl;
import reservation.ReservationVO;
import yagajaFront.model.PagingUtil;
import yagajaFront.model.SMS;
import yagajaFront.model.SMSForm;

@Controller
public class YagajaReservationController 
{
   
   @Autowired
   private SqlSession sqlSession;
   
   //예약 view페이지 보여주기
   @RequestMapping("/reser/reservationView.do")
   public String reservationView(Model model, HttpServletRequest req)
   {
      String type = req.getParameter("select");
      String lodge_no = req.getParameter("lodge_no");
      String room_no = req.getParameter("room_no");
      System.out.println(type+","+lodge_no+","+room_no);
       
      ReservationVO reserVO = sqlSession.getMapper(ReservationImpl.class).reserView(lodge_no, room_no);
      
      model.addAttribute("vo", reserVO);
      model.addAttribute("type", type);
      
      return "reser/reservation";
   }
   
   //예약하기 프로그램 
   @RequestMapping("/reser/reservationProc.do")
   public String reservationProc(Model model, HttpServletRequest req)
   {   
      ReservationVO reserVO = new ReservationVO();
      String backAndGo = null;
      
      String prev_m_point = req.getParameter("prev_m_point");
      String reser_name = req.getParameter("reser_name");
      String visit_type = req.getParameter("visit_type");
      String payment_type = req.getParameter("payment_type");
      String check_in = req.getParameter("check_in");
      String check_out = req.getParameter("check_out");
      String phone = req.getParameter("phone");
      
      double m_point = Double.parseDouble(req.getParameter("m_point"));
      
      String payment_price = req.getParameter("payment_price");
      String lodge_no = req.getParameter("lodge_no");
      String room_no = req.getParameter("room_no");
      String member_no = req.getParameter("member_no");
      
      System.out.println("m_point"+m_point);
      System.out.println(prev_m_point+","+reser_name+","+visit_type+","+payment_type+","+check_in+","+check_out);
      
      
      reserVO.setReser_name(reser_name);
      reserVO.setVisit_type(visit_type);
      reserVO.setPayment_price(payment_price);
      reserVO.setPayment_type(payment_type);
      reserVO.setCheck_in(check_in);
      reserVO.setCheck_out(check_out);
      reserVO.setLodge_no(lodge_no);
      reserVO.setRoom_no(room_no);
      reserVO.setMember_no(member_no);
      
      int next_m_point = (int)Math.floor(m_point) + Integer.parseInt(prev_m_point);

      System.out.println("m포인트:"+next_m_point); 
      
      System.out.println(reser_name+","+visit_type+","+payment_type);
       
      int sucOrFail = sqlSession.getMapper(ReservationImpl.class).insertReser(reserVO);
      int ex = sqlSession.getMapper(ReservationImpl.class).insertM_point(next_m_point, member_no);
      
      if(sucOrFail == 1)
      {
         backAndGo = "redirect:/reser/reservationList.do?member_no="+member_no+"&phone="+phone;
      }
      
      return backAndGo;
   }
   
   //주중/주말 가격바꾸기
   @RequestMapping("/reser/dateformat.do")
   public void priceChange(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException
   {
      req.setCharacterEncoding("UTF-8");
      
      resp.setContentType("text/html;charset=utf-8;");
      
      String nowDay = req.getParameter("nowDay");
      System.out.println("nowDay:"+nowDay);
      //검색어를 파라미터로 DAO호출후 JSON출력을 담당하는 메소드 호출
      String resultJSON = getJSON(nowDay);
      
      System.out.println("resultJSON:"+resultJSON);
      
      //화면상에 출력
      resp.getWriter().write(resultJSON);
   }
   
   public String getJSON(String nowDay)
   {
      
      JSONObject jsonObject = new JSONObject();
      
      String dayResult = "";
      Date nDate = null;
      
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
      try
      {
         nDate = dateFormat.parse(nowDay);
      }
      catch(Exception e)
      {
         e.printStackTrace();
      }
      
      
      Calendar cal = Calendar.getInstance();
      cal.setTime(nDate);
      
      int dayNum = cal.get(Calendar.DAY_OF_WEEK);
      
      System.out.println("dayNum:"+dayNum);
      
      switch(dayNum)
      {
      case 1:
         dayResult = "금"; break;
      case 2:
         dayResult = "토"; break;
      case 3:
         dayResult = "일"; break;
      case 4:
         dayResult = "월"; break;
      case 5:
         dayResult = "화"; break;
      case 6:
         dayResult = "수"; break;
      case 7:
         dayResult = "목"; break;
      }
      System.out.println("day:"+dayResult);
      jsonObject.put("dayResult", dayResult);
      
      return jsonObject.toString();
   }
   
   //예약내역!!
   @RequestMapping("/reser/reservationList.do")
   public String reserVationList(Model model, HttpServletRequest req, HttpServletResponse resp)
   {
	  SMS sms;
	  
      String member_no = req.getParameter("member_no");
      String phone = req.getParameter("phone");
      
      //옥션의 전체 레코드수 가져오기
      int totalRecordCount = sqlSession.getMapper(ReservationImpl.class).getTotalCount(member_no);
      
      System.out.println("totalRecordCount:"+totalRecordCount);
      
      //페이지 처리를 위한 설정값
      int pageSize = 10;
      int blockPage = 5;
      
      //전체 페이지 수 계산하기
      int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
      
      //시작 및 끝 rownum 구하기
      int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
      int start = (nowPage - 1)* pageSize +1;
      int end = nowPage * pageSize;
        
      ArrayList<ReservationVO> lists = sqlSession.getMapper(ReservationImpl.class).reserVationList(start, end); 
      
      ReservationVO vo = sqlSession.getMapper(ReservationImpl.class).reserSms();
      
      try
      {
         SMSForm sf = new SMSForm();
         
         sms = new SMS(sf.SMSForm(req, resp, vo), phone, req, resp); 
         sms.Send();
        
      }
      catch(Exception e)
      {
         e.printStackTrace();
      }
      
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/reser/reservationList.do?");
      model.addAttribute("pagingImg", pagingImg);
      
      model.addAttribute("lists", lists);
      
      return "reser/reserVationList";
   }
   
   
   
   //결제취소하기
   @RequestMapping("/reser/reservationCancle.do")
   public void reserCancle(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException
   {
      req.setCharacterEncoding("UTF-8");
      
      resp.setContentType("text/html;charset=utf-8;");
      
      String reser_no = req.getParameter("reser_no");
      String payment_price = req.getParameter("payment_price");
      System.out.println("reser_no:"+reser_no);
      System.out.println("payment_price:"+payment_price);

      //검색어를 파라미터로 DAO호출후 JSON출력을 담당하는 메소드 호출
      String resultJSON = getJSON2(reser_no, payment_price);
      
      System.out.println("resultJSON:"+resultJSON);
      
      //화면상에 출력
      resp.getWriter().write(resultJSON);
   }
   
   public String getJSON2(String reser_no, String payment_price)
   {
      
      JSONObject jsonObject = new JSONObject();
      
      int result = sqlSession.getMapper(ReservationImpl.class).reserCancle(reser_no); 
      
      jsonObject.put("sucOrFail", result);
      
      return jsonObject.toString();
   }
   
}
 