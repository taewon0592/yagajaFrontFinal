package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lodge.LodgeDAOImpl;
import lodge.LodgeDTO;
import lodge.ParamListVO;
import yagajaFront.model.PagingUtil;

@Controller
public class LodgeController {

	@Autowired
	private SqlSession sqlSession;
	
	// 숙박시설 리스트
	@RequestMapping("/lodge/List.do")
	public String list(Model model, HttpServletRequest request) {
		
		String mode = request.getParameter("mode");
		
		
		
		// 페이지 처리
		int totalRecordCount = sqlSession.getMapper(LodgeDAOImpl.class).getTotalCount(mode);
		
		// 페이지 처리를 위한 설정값
		int pageSize = 9;
		int blockPage = 5;
		 
		// 전체 페이지 수 계산하기
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		
		// 시작 및 끝 rownum 구하기
		int nowPage = request.getParameter("nowPage") == null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1; 
		int end = nowPage * pageSize;
		
		ParamListVO pmvo = new ParamListVO();
		pmvo.setMode(mode);
		pmvo.setStart(start);
		pmvo.setEnd(end);
		
		// 리스트를 가져오기 위한 파라미터 저장
		ArrayList<LodgeDTO> lists = sqlSession.getMapper(LodgeDAOImpl.class).listPage(pmvo);
		
		// 페이지 처리를 위한 처리부분
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, request.getContextPath() + "/lodge/List.do?mode="+mode+"&");
		model.addAttribute("pagingImg", pagingImg);
		
		model.addAttribute("mode", mode);
		model.addAttribute("lists", lists);
		
		return "lodge/lodgeList"; 
	}
	
	@RequestMapping("/main/index.do")
	public String main(Model model)
	{
		return "main/index";
	}
	
}
