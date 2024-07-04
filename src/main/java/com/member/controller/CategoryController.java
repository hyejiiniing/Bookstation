/*
 * 작성자 이지은
 * 카테고리 페이지 컨트롤러
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
public class CategoryController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	// 메인 카테고리 페이지 이동
	@RequestMapping(value="/category.do",method=RequestMethod.GET)
	public ModelAndView process(@RequestParam("category") String category,
								@RequestParam("sort") String sort,
								@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		// 선택된 카테고리와 서브 카테고리 목록
		CategorymainVO selectedMain = categoryDAO.getOneMainCategory(category);	
		List<CategorydetailVO> subCtgrList = categoryDAO.getDetailCategory(category);
		
		// 페이징 처리
		int count = bookDAO.getCategoryBookListCount(category+"%");
		//페이징처리->PagingUtil클래스(현재페이지,총갯수,블럭당페이지수,페이지당레코드수,,,
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"category.do","&category="+category+"&sort="+sort);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", category + "%");
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());

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
		mav.setViewName("category");
		mav.addObject("subCtgrList", subCtgrList);
		mav.addObject("selectedMain", selectedMain);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList); 
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;//return "이동시킬 파일명";
	}
}
