package yagajaFront.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YagajaReservationController 
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main/reservation.do")
	public String reservation(Model model, HttpServletRequest req)
	{
		return "main/reservation";
	}
	
	
}
