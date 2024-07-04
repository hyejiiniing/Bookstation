package com.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AllOrderDAO;
import com.member.domain.LoginVO;
import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;
import com.member.domain.shippingVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class RefundWriteController {
	
	private Logger log=Logger.getLogger(this.getClass());

	@Autowired
	private AllOrderDAO allOrderDao;
	
	@RequestMapping("/RefundWrite.do")
	public ModelAndView process3(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		// 현재 세션에서 로그인한 사람의 정보를 가져옴
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		String member_id = loginVO.getMember_id(); // 아이디만 가져오기

		// 가져올 목록 전체 개수
		int count = allOrderDao.getOrdersCount(member_id);
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"RefundWrite.do");
		Map<String, Object> dateRange = new HashMap<>();
		dateRange.put("start",page.getStartCount());
		dateRange.put("end", page.getEndCount());
		dateRange.put("member_id", member_id);
		List<OrderVO> 			list1=null;
		List<OrdersPrintVO> 	list2=null;
		List<shippingVO> 		list3=null;
		
		list1=allOrderDao.getOrders(dateRange);
		list2=allOrderDao.getOrdersPrint(dateRange);
		list3=allOrderDao.getShipping(dateRange);
		
		System.out.println("ALlOrderListVO의 list1=>"+list1);
		System.out.println("ordersPrintVO의 list=>"+list2);
		System.out.println("ShippingVO의 list=>"+list3);
		
	    // 세 가지 리스트를 병합하여 하나의 리스트로 만든다. 
        List<Object> mergedList = new ArrayList<>();
        if (list1 != null) mergedList.addAll(list1);
        if (list2 != null) mergedList.addAll(list2);
        if (list3 != null) mergedList.addAll(list3);
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("RefundWrite");
        // 하나의 리스트를 뷰에 전달
        mav.addObject("list1", list1);
        mav.addObject("list2", list2);
        mav.addObject("list3", list3);
        mav.addObject("pagingHtml",page.getPagingHtml());
        return mav;
		
	}
	
}
