package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lodge.YagajaLodgeImpl;

import notice.NoticeVO;
import notice.YagajaNoticeImpl;
import yagajaFront.model.PagingUtil;


@Controller
public class NoticeController {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/notice/noticeList")
	public String noticelist(Model model, HttpServletRequest req) {
		
		int totalRecordCount = sqlsession.getMapper(YagajaNoticeImpl.class).getTotalCount();
		
		// 페이지 처리를 위한 설정값
		int pageSize = 9;
		int blockPage = 5;
		 
		// 전체 페이지 수 계산하기
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		
		// 시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1; 
		int end = nowPage * pageSize;
		
		ArrayList<NoticeVO> lists = sqlsession.getMapper(YagajaNoticeImpl.class).listPage(start, end);
		
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/notice/noticeList.do?");
		model.addAttribute("pagingImg", pagingImg);
		
	

		model.addAttribute("lists", lists);
		
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeView.do")
	public String view (Model model, HttpServletRequest req, HttpSession session) {
		
		NoticeVO vo = sqlsession.getMapper(YagajaNoticeImpl.class).view(req.getParameter("notice_no"));
		
		model.addAttribute("vo",vo);
		
		return "notice/noticeView";
	}
	
	
	
	
	
	
}
