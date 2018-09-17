package yagajaFront.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.YagajaAuctionDTO;
import auction.YagajaAuctionImpl;
import hotdeal.HotdealDAO;
import hotdeal.HotdealDTO;
import hotdeal.HotdealImpl;
import member.YagajaMemberVO;
import reservation.ReservationImpl;
import reservation.ReservationVO;
import yagajaFront.model.PagingUtil;

@Controller
public class HotdealController {

   HotdealDAO dao;
   public void setDao(HotdealDAO dao) {
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
    

    //핫딜 상세보기
   @RequestMapping("/hotdeal/hotdealView.do")
   public String hotdealView(Model model, HttpServletRequest req)
   {
      String room_no = req.getParameter("room_no");
      String lodge_no = req.getParameter("lodge_no");
      String member_no = req.getParameter("member_no");
      String hotdeal_no = req.getParameter("hotdeal_no");
      
      HotdealDTO dto = sqlSession.getMapper(HotdealImpl.class).hotdealView(room_no, lodge_no, member_no, hotdeal_no);
      
      //처음에 남은시간을 보여주기
      int dateVal = (Integer.parseInt(dto.getRemain_time_sec())/(24*60*60)); //총 초에서 날짜뽑기
      int tempVal = Integer.parseInt(dto.getRemain_time_sec())%(24*60*60); //남은 초 담기
      int hourVal = tempVal/(60*60);  //남은 총 초에서 시간 뽑기
      tempVal = tempVal%(60*60);  //남은 초 담기
      int minVal = tempVal/60; //남은 총 초에서 분 뽑기
      int secVal = tempVal%60; //남은 초 담기
      
      String remain_time = dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초";
      
      dto.setTimeView(remain_time);
      
      //진행중 경매 처음에 남은시간 보여주기
      int s_dateVal = (Integer.parseInt(dto.getStart_remain_time_sec())/(24*60*60)); //총 초에서 날짜뽑기
      int s_tempVal = Integer.parseInt(dto.getStart_remain_time_sec())%(24*60*60); //남은 초 담기
      int s_hourVal = s_tempVal/(60*60);  //남은 총 초에서 시간 뽑기
      s_tempVal = s_tempVal%(60*60);  //남은 초 담기
      int s_minVal = s_tempVal/60; //남은 총 초에서 분 뽑기
      int s_secVal = s_tempVal%60; //남은 초 담기
      
      String s_remain_time = s_dateVal+"일 "+s_hourVal+"시간 "+s_minVal+"분 "+s_secVal+"초";
      
      dto.setStart_timeView(s_remain_time);
      
      model.addAttribute("dto", dto);
      
      return "hotdeal/hotdealView";
   }
   
     //예약하기 프로그램 
      @RequestMapping("/reser/hotdealreservationProc.do")
      public String hotdealreservationProc(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException
      {   
        PrintWriter writer = resp.getWriter();
        resp.setContentType("text/html; charset=UTF-8");
         ReservationVO reserVO = new ReservationVO();
         YagajaMemberVO memberVO = new YagajaMemberVO();
         String backAndGo = null;
         String reser_name = req.getParameter("reser_name");
         String visit_type = req.getParameter("visit_type");
         String payment_type = req.getParameter("payment_type");
         String check_in = req.getParameter("check_in");
         String check_out = req.getParameter("check_out");
         String m_point1 = req.getParameter("m_point");
         String hotdeal_no = req.getParameter("hotdeal_no");
         String payment_price = req.getParameter("payment_price");
         String lodge_no = req.getParameter("lodge_no");
         String room_no = req.getParameter("room_no");
         String member_no = req.getParameter("member_no");
         String reser_type = req.getParameter("reser_type");
         String hotdeal_sell1 = req.getParameter("hotdeal_sell");
         int hotdeal_sell = Integer.parseInt(hotdeal_sell1);
         int m_point = Integer.parseInt(m_point1)-Integer.parseInt(payment_price);
        
         reserVO.setReser_name(reser_name);
         reserVO.setVisit_type(visit_type);
         reserVO.setPayment_price(payment_price);
         reserVO.setPayment_type(payment_type);
         reserVO.setCheck_in(check_in);
         reserVO.setCheck_out(check_out);
         reserVO.setLodge_no(lodge_no);
         reserVO.setHotdeal_no(hotdeal_no);
         reserVO.setRoom_no(room_no);
         reserVO.setMember_no(member_no);
         reserVO.setReser_type(reser_type);
         
         if(Integer.parseInt(m_point1)>=Integer.parseInt(payment_price)){
            //핫딜예약
            int sucOrFail = sqlSession.getMapper(HotdealImpl.class).insertHotdealReser(reserVO);
            //핫딜예약 후 마일리지 차감
            int ex = sqlSession.getMapper(HotdealImpl.class).decreaseM_point(m_point, member_no);
            memberVO.setM_point(String.valueOf(m_point));
            //마일리지차감이 되면 핫딜판매개수 감소
            int hotdealCount = sqlSession.getMapper(HotdealImpl.class).hotdeal_Sell_Count(hotdeal_sell,hotdeal_no);
            
            if(sucOrFail == 1 && ex == 1 && hotdealCount==1)
            {
               return "redirect:/reser/reservationList.do?member_no="+member_no;
            }
            else 
            {
               backAndGo =  "location.href:history.go(-1)";
            }
         }
         
         //보유하는 마일리지가 가격보다 적으면 예약불가능
         else if(Integer.parseInt(m_point1)<Integer.parseInt(payment_price)) {
         writer.println("<script type='text/javascript'>");
           writer.println("alert('마일리지가 부족하여 핫딜예약이 불가능합니다.');");
           writer.println("history.go(-1);");
           writer.println("</script>");
           writer.flush();
         }
         
         return backAndGo;
      }
}