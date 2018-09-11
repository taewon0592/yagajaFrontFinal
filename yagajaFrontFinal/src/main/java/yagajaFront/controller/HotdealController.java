package yagajaFront.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hotdeal.HotdealDAO;
import hotdeal.HotdealDTO;
import hotdeal.HotdealImpl;
import yagajaFront.model.PagingUtil;

@Controller
public class HotdealController {

	HotdealDAO dao;
	public void setDao(HotdealDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	
}
