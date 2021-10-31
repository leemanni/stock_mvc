package com.leemanni.stock_mvc;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leemanni.dao.StocksDAO;
import com.leemanni.vo.LoginVO;
import com.leemanni.vo.UserStockList;
import com.leemanni.vo.UserStocksVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		return "redirect:loginMain";
	}
	
	@RequestMapping("/loginMain")
	public String loginMain(HttpServletRequest request, Model model) {
		try {
			boolean flag = Integer.parseInt(request.getParameter("check")) == 1 ? true : false;
			model.addAttribute("flag", flag);
		} catch (NumberFormatException e) {}
		return "loginMain";
	}
	
	@RequestMapping("loginOK")
	public String loginOK(HttpServletRequest request, Model model, LoginVO loginVO) {
		StocksDAO dao = sqlSession.getMapper(StocksDAO.class);
		int check = dao.loginOK(loginVO);
//		System.out.println(check);
		if(check ==1 ){
			return "redirect:stocksView";
		}else{
			model.addAttribute("check", check);
			return "redirect:loginMain";
		}
	}
	
	
	@RequestMapping("/stocksView")
	public String stocksView(HttpServletRequest request, Model model, UserStocksVO stocksVO) {
		StocksDAO dao = sqlSession.getMapper(StocksDAO.class);
		GenericXmlApplicationContext context = new GenericXmlApplicationContext("classpath:application_context.xml");
		UserStockList userStockList = context.getBean("userStockList", UserStockList.class);
		
		// 각 종목별 및 전체 자산 수익률 계산
		ArrayList<UserStocksVO> list = dao.selectList();
		for (UserStocksVO userStocksVO : list) {
			userStocksVO.calculate();
		}
		userStockList.setStockList(list);
//		System.out.println(list);
		UserStocksVO stock = null;
		try {
			stock = dao.selectStock(request.getParameter("name"));
		} catch (Exception e) {}
		model.addAttribute("userStockList", userStockList);
		model.addAttribute("stock", stock);
//		System.out.println(stocksVO);
//		System.out.println("name : " + request.getParameter("name"));
		context.close();
		return "stocksView";
	}
	
	
	@RequestMapping("insert")
	public String insert(HttpServletRequest request, Model model, UserStocksVO stocksVO) {
		StocksDAO dao = sqlSession.getMapper(StocksDAO.class);
		int check = dao.insertOK(stocksVO.getName());
		
		if(check != 1) {
			dao.insert(stocksVO);
		}
		return "redirect:stocksView";
	}
	
	/**
	 * @param request
	 * @param model
	 * @return
	 * 수정 버튼 클릭하면 stock객체에 담길 한 건의 종목을 불러와준다.
	 */
	@RequestMapping("/show")
	public String show(HttpServletRequest request, Model model) {
		model.addAttribute("name", request.getParameter("name"));
		return "redirect:stocksView";
	}
	
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model, UserStocksVO stocksVO) {
		StocksDAO dao = sqlSession.getMapper(StocksDAO.class);
//		System.out.println(stocksVO);
		dao.update(stocksVO);
		return "redirect:stocksView";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		StocksDAO dao = sqlSession.getMapper(StocksDAO.class);
//		System.out.println(stocksVO);
		String name = request.getParameter("name");
//		System.out.println(name);
		dao.delete(name);
		return "redirect:stocksView";
	}
	
	
	
}
