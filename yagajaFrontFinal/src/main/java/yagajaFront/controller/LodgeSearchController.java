package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lodge.SearchLodgeDTO;
import lodge.SearchParamListVO;
import lodge.SearchYagajaLodgeImpl;
import lodge.SearchYagajaLodgeVO;
import yagajaFront.model.PagingUtil;

@Controller
public class LodgeSearchController {

   @Autowired
   private SqlSession sqlSession;
   
   //시/도 구군 가져오기
   @RequestMapping(value="/lodge/gugun.do", method=RequestMethod.GET)
   public @ResponseBody JSONArray gugun(Model model, HttpServletRequest req)
   {
      String sido = req.getParameter("sido");
      System.out.println("sido:"+sido);
      
      JSONArray jsonArr = sqlSession.getMapper(SearchYagajaLodgeImpl.class).gugun(sido);
      
      model.addAttribute("jsonArr",jsonArr);
      System.out.println("jsonArr : "+jsonArr);
      
      return jsonArr;
   }
   
   // 숙박시설 리스트
   @RequestMapping("/lodge/searchLodgeList.do")
   public String list(Model model, HttpServletRequest request, HttpSession session) {
      
      String mode = request.getParameter("mode");
      String gugun = request.getParameter("gugun");
      
      // 페이지 처리
      int totalRecordCount = sqlSession.getMapper(SearchYagajaLodgeImpl.class).getTotalCount2(mode, gugun);
      
      // 페이지 처리를 위한 설정값
      int pageSize = 9;
      int blockPage = 5;
       
      // 전체 페이지 수 계산하기
      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
      
      // 시작 및 끝 rownum 구하기
      int nowPage = request.getParameter("nowPage") == null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
      int start = (nowPage - 1) * pageSize + 1; 
      int end = nowPage * pageSize;
      
      SearchParamListVO pmvo = new SearchParamListVO();
      pmvo.setMode(mode);
      pmvo.setStart(start);
      pmvo.setEnd(end);
      pmvo.setGugun(gugun);
      
      // 리스트를 가져오기 위한 파라미터 저장
      ArrayList<SearchLodgeDTO> lists = sqlSession.getMapper(SearchYagajaLodgeImpl.class).searchListPage(pmvo);
      
      // 페이지 처리를 위한 처리부분
      String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, request.getContextPath() + "/lodge/searchLodgeList.do?mode="+mode+"&");
      model.addAttribute("pagingImg", pagingImg);
      
      for(SearchLodgeDTO list : lists)
      {
         session.setAttribute("addr_lat", list.getAddr_lat());
         session.setAttribute("addr_long", list.getAddr_long());         
      }      
      
      model.addAttribute("mode", mode);
      model.addAttribute("lists", lists);         
      
      return "lodge/lodgeSearchList"; 
   }
      
}