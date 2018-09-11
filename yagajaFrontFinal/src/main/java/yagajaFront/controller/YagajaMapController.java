package yagajaFront.controller;

import java.util.ArrayList; 

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import map.MapDAOImpl;
import map.MapDTO;

@Controller
public class YagajaMapController {

	//자동 주입
	@Autowired
	private SqlSession sqlSession;
	
	//요청명
	@RequestMapping("/map/multimarker.do")
	public String mapMain() {
			
		return "map/multimarker";
		
	}
	
	//주소 검색
	@RequestMapping("/map/mapsearch.do")
	public String mapSearch(Model model, HttpServletRequest req) {
		
		String searchWord = req.getParameter("keyString");
		//쿼리문
		String sql_searchWord = "%"+searchWord+"%";
		
		System.out.println("sql_searchWord : "+sql_searchWord);
		
		
		//Mybatis사용 - 페이지처리 없음..
		ArrayList<MapDTO> mapdto = 
				sqlSession.getMapper(MapDAOImpl.class).mapSearch(sql_searchWord);
		
		System.out.println("mapdto"+mapdto);
		
		model.addAttribute("mapdto", mapdto);
		
		return "map/multimarker";
		
	}
	
	//지역검색1(기본)
	@RequestMapping(value="/map/search_local.do", method=RequestMethod.GET)
	public String search_local(Model model, HttpServletRequest req) {
				
		String search_localZone = req.getParameter("search_localZone1")+" "+req.getParameter("search_localZone2");
		
		model.addAttribute("search_localZone", search_localZone);
		return "map/search_local";
	}
	//지역검색2(result 페이지로 값 반환)
	@RequestMapping(value="/map/search_local_result", method=RequestMethod.GET)
	public String search_local_result(Model model, HttpServletRequest req) {
		
		
		//String search_word = req.getParameter("search_localZone1")+" "+req.getParameter("search_localZone1");
		String s_localZone = req.getParameter("search_localZone2")+"%";
		String search_localZone = "%"+req.getParameter("search_localZone1")+" "+s_localZone;
		
		System.out.println(search_localZone);		
		
		//Mybatis사용 - 페이지처리 없음..
		ArrayList<MapDTO> search_local = 
				sqlSession.getMapper(MapDAOImpl.class).search_local(search_localZone);

		System.out.println("search_local"+search_local);
		
		model.addAttribute("search_local", search_local);		
		
		return "map/multimarker";
		
	}
	
}
