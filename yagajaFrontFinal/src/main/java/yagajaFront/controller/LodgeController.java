package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lodge.LodgeDTO;
import lodge.ParamListVO;
import lodge.YagajaLodgeImpl;
import lodge.YagajaLodgeVO;
import yagajaFront.model.PagingUtil;

@Controller
public class LodgeController {

	@Autowired
	private SqlSession sqlSession;
	
	// 숙박시설 리스트
	@RequestMapping("/lodge/lodgeList.do")
	public String list(Model model, HttpServletRequest request) {
		
		String mode = request.getParameter("mode");
	
		// 페이지 처리
		int totalRecordCount = sqlSession.getMapper(YagajaLodgeImpl.class).getTotalCount(mode);
		
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
		ArrayList<LodgeDTO> lists = sqlSession.getMapper(YagajaLodgeImpl.class).listPage(pmvo);
		
		// 페이지 처리를 위한 처리부분
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, request.getContextPath() + "/lodge/lodgeList.do?mode="+mode+"&");
		model.addAttribute("pagingImg", pagingImg);
		
		model.addAttribute("mode", mode);
		model.addAttribute("lists", lists);
		
		return "lodge/lodgeList"; 
	}
	
	/*@RequestMapping("/main/index.do")
	public String main(Model model)
	{
		return "main/index";
	}*/
	
	
	//숙박업소 상세보기
	@RequestMapping("/lodge/lodgeView.do")
	public String view (Model model, HttpServletRequest req, HttpSession session) {
      
		ArrayList<YagajaLodgeVO> lodgeLists = sqlSession.getMapper(YagajaLodgeImpl.class).lodgeView(req.getParameter("lodge_no"));
  
			for(YagajaLodgeVO list : lodgeLists) {
				session.setAttribute("lodge_name", list.getLodge_name());
				session.setAttribute("lodge_tel", list.getLodge_tel());
				session.setAttribute("lodge_feature", list.getLodge_feature());
				session.setAttribute("lodge_tag", list.getLodge_tag());
				session.setAttribute("addr_common", list.getAddr_common());
				session.setAttribute("addr_detail", list.getAddr_detail());
				session.setAttribute("addr_lat", list.getAddr_lat());
				session.setAttribute("addr_long", list.getAddr_long());
				session.setAttribute("lodge_photo", list.getLodge_photo());
				session.setAttribute("lodge_no", list.getLodge_no());
				
				
				/*session.setAttribute("lodge_thema", list.getLodge_thema());
				session.setAttribute("lodge_thema", list.getLodge_thema());
				*/
				String[] telArr = list.getLodge_thema().split(",");
				session.setAttribute("telArr", telArr);
				/*
				for(int i=0 ; i<telArr.length ; i++)
				{
				session.setAttribute("telArr", telArr[i]);
				System.out.println("telArr[0] : "+telArr[i]);
				System.out.println("session"+session.getAttribute("telArr[0]"));
				}*/
				}
				model.addAttribute("lodgeLists",lodgeLists);
				return "lodge/lodgeView";
			}
	}
