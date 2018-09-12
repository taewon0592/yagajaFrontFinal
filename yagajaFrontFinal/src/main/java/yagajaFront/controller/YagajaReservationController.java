package yagajaFront.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hotdeal.HotdealImpl;
import reservation.ReservationImpl;
import reservation.ReservationVO;

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
			backAndGo = "reser/reservation";
		}
		else 
		{
			backAndGo =  "main/index";
		}
		
		return backAndGo;
	}
	
	//주중/주말 가격바꾸기
	@RequestMapping("/reser/dateformat.do")
	public String priceChange(Model model, HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("text/html;charset=utf-8;");
		
		String nowDay = req.getParameter("nowDay");
		String day = "";
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
		
		switch(dayNum)
		{
		case 1:
			day = "일"; break;
		case 2:
			day = "월"; break;
		case 3:
			day = "화"; break;
		case 4:
			day = "수"; break;
		case 5:
			day = "목"; break;
		case 6:
			day = "금"; break;
		case 7:
			day = "토"; break;
		}
		System.out.println("day:"+day);
		model.addAttribute("day", day);
		
		return "reser/reservation";
	}
	
	
	
}
 