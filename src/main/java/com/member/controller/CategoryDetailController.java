/*
 * 작성자 이지은
 * 세부카테고리 페이지 컨트롤러
 */

package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.BookDAO;
import com.member.dao.CategoryDAO;
import com.member.domain.BookVO;
import com.member.domain.CategorydetailVO;
import com.member.domain.CategorymainVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class CategoryDetailController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	// 메인 카테고리 페이지 이동
	@RequestMapping(value="/categoryDetail.do",method=RequestMethod.GET)
	public ModelAndView process(@RequestParam("main") String category_mainID,
								@RequestParam("sub") String category_id,
								@RequestParam("sort") String sort,
								@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		// 페이징 처리
		int count = bookDAO.getCategoryBookListCount(category_id+"%");
		//페이징처리->PagingUtil클래스(현재페이지,총갯수,블럭당페이지수,페이지당레코드수,,,
		PagingUtil page = new PagingUtil(
				currentPage,count,10,10,"categoryDetail.do","&main="+category_mainID+"&sub="+category_id+"&sort="+sort);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", category_id + "%");
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		CategorymainVO categorymain = categoryDAO.getOneMainCategory(category_mainID);
		CategorydetailVO categorydetail = categoryDAO.getOneSubCategory(category_id);
		
		if(sort.equals("new")) {
			map.put("sort", "book_pubdate desc");
		}
		else if(sort.equals("abc")) {
			map.put("sort", "book_name");
		}
		else if(sort.equals("rev")) {
			map.put("sort", "book_score desc");
		}
		else if(sort.equals("minv")) {
			map.put("sort", "book_price");
		}
		else if(sort.equals("maxv")) {
			map.put("sort", "book_pubdate desc");
		}
		else { // 디폴트는 판매량으로 해두기
			map.put("sort", "book_sell desc");
		}
		List<BookVO> bookList = bookDAO.getCategoryBooksList(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("categoryDetail");
		mav.addObject("categorydetail",categorydetail);
		mav.addObject("categorymain",categorymain);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;//return "이동시킬 파일명";
	}
}
