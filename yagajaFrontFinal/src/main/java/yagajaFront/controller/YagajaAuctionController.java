package yagajaFront.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YagajaAuctionController 
{

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/auction/auctionList.do")
	public String auctionList(Model model, HttpServletRequest req)
	{
		return "auction/auctionList";
	}
	@RequestMapping("/auction/auctionView.do")
	public String auctionView(Model model, HttpServletRequest req)
	{
		return "auction/auctionView";
	}
	

}
