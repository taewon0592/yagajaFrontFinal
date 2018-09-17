package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.YagajaAuctionDTO;
import auction.YagajaAuctionImpl;
import reservation.ReservationImpl;
import reservation.ReservationVO;
import yagajaFront.model.PagingUtil;

@Controller
public class YagajaAuctionController 
{

   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping("/auction/auctionList.do")
   public String auctionList(Model model, HttpServletRequest req)
   {
      //옥션의 전체 레코드수 가져오기
      int totalRecordCount = sqlSession.getMapper(YagajaAuctionImpl.class).getTotalCount();
      
      //페이지 처리를 위한 설정값
      int pageSize = 9;
      int blockPage = 5;
      
      //전체 페이지 수 계산하기
      int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
      
      //시작 및 끝 rownum 구하기
      int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
      int start = (nowPage - 1)* pageSize +1;
      int end = nowPage * pageSize;
        
      ArrayList<YagajaAuctionDTO> lists = sqlSession.getMapper(YagajaAuctionImpl.class).auctionList(start, end); 
      
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/auction/auctionList.do?");
      model.addAttribute("pagingImg", pagingImg);
      
      model.addAttribute("lists", lists);
      
      return "auction/auctionList";
      
   }
   
   @RequestMapping("/auction/auctionView.do")
   public String auctionView(Model model, HttpServletRequest req)
   {
      String room_no = req.getParameter("room_no");
      String lodge_no = req.getParameter("lodge_no");
      String member_no = req.getParameter("member_no");
      String auction_no = req.getParameter("auction_no");
      
      YagajaAuctionDTO dto = sqlSession.getMapper(YagajaAuctionImpl.class).auctionView(room_no, lodge_no, member_no, auction_no);
      
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
      return "auction/auctionView";
   }
   
   @RequestMapping("/auction/auctionProc.do")
   public String auctionProc(Model model, HttpServletRequest req)
   {
      int sucOrFail=0;
      
      String end_price = req.getParameter("end_price");
      String member_nickname = req.getParameter("member_nickname");
      String member_m_point = req.getParameter("member_m_point");
      String member_no = req.getParameter("member_no"); 
      String auction_no = req.getParameter("auction_no");
      String reser_type = req.getParameter("reser_type");
      System.out.println("end_price:"+end_price);
      
      
      sucOrFail = sqlSession.getMapper(YagajaAuctionImpl.class).auctionUpdate(end_price, member_nickname, member_no, auction_no);
         
      if(sucOrFail==1)
      {
         System.out.println("입찰성공!!");
      }
      return "redirect:/auction/auctionReserList.do?member_no="+member_no+"&reser_type="+reser_type;
   }
   
   //경매내역
   @RequestMapping("/auction/auctionReserList.do")
   public String auctionReserList(Model model, HttpServletRequest req)
   {
      String member_no = req.getParameter("member_no");
      
      //옥션의 전체 레코드수 가져오기
      int totalRecordCount = sqlSession.getMapper(YagajaAuctionImpl.class).auctionListgetTotalCount(member_no);
      
      System.out.println("member_no:"+member_no);
      
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
            ArrayList<YagajaAuctionDTO> lists = sqlSession.getMapper(YagajaAuctionImpl.class).auctionReserList(member_no, start, end); 
      
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/auction/auctionReserList.do?");
      model.addAttribute("pagingImg", pagingImg);
      
      model.addAttribute("lists", lists);
      
      
      return "/reser/auctionReserList";
   }
   
   //경매결제하기
   @RequestMapping("/auction/reservationView.do")
   public String auctionReserVationView(Model model, HttpServletRequest req)
   {
      String member_no = req.getParameter("member_no");
      String reser_type = req.getParameter("reser_type");
      
      //옥션의 전체 레코드수 가져오기
      int totalRecordCount = sqlSession.getMapper(YagajaAuctionImpl.class).auctionListgetTotalCount(member_no);
      
      System.out.println("member_no:"+member_no);
      
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
            ArrayList<YagajaAuctionDTO> lists = sqlSession.getMapper(YagajaAuctionImpl.class).auctionReserList(member_no, start, end); 
      
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/auction/auctionReserList.do?");
      model.addAttribute("pagingImg", pagingImg);
      
      model.addAttribute("lists", lists);
      
      
      return "/reser/auctionReserList";
   }
}