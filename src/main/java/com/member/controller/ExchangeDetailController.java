package com.member.controller;

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
import com.member.dao.MemberDAO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;
import com.member.domain.shippingVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class ExchangeDetailController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private AllOrderDAO allOrderDao;
	
	@Autowired
	private MemberDAO memberDAO;

	// HttpServletRequest request 를 파라미터로 받아와야 세션의 정보를 요청할 수 있음(받아올 수 있음)
	@RequestMapping("/ExchangeDetail.do") //클릭한 링크 (사용자 입장에서 클릭한 이름 ) 
	public ModelAndView process2(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) { //process2 메서드 정의 
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
		
		// 현재 로그인한 회원의 구체적인 정보를 다 받아옴
		List<MemberVO> memberList=memberDAO.getMemberList(member_id);
		
		List<OrdersPrintVO> list2=null;
		List<OrderVO> 		list1=null;
		List<shippingVO> 	list3=null;
 
		// 현재 로그인한 사람만의 Orders, OrdersPrint, Shipping 정보를 불러옴
		list1=allOrderDao.getOrders(dateRange);
		list2=allOrderDao.getOrdersPrint(dateRange);
		list3=allOrderDao.getShipping(dateRange);

		System.out.println("ALlOrderListVO의2 list1=>"+list1);
		System.out.println("ordersPrintVO의2 list2=>"+list2);
		System.out.println("ShippingVO의2 list3=>"+list3);
		
	    // 세 가지 리스트를 병합하여 하나의 리스트로 만든다. 
//        List<Object> mergedList = new ArrayList<>();
//        if (list2 != null) mergedList.addAll(list2);
//        if (list1 != null) mergedList.addAll(list1);
//        if (list3 != null) mergedList.addAll(list3);	

        
		ModelAndView mav=new ModelAndView(); //새로운 ModelAndView 객체를 생성
		mav.setViewName("ExchangeDetail"); //뷰의 이름을 "ExchangeDetail"로 설정
        //mav.addObject("mergedList", mergedList);	//클릭요청이 어왔을 때 보여줄 이름 
		mav.addObject("list1",list1);
		mav.addObject("list2",list2);
		mav.addObject("list3",list3);
		mav.addObject("pagingHtml",page.getPagingHtml());
		return mav; // mav 를 반환 
	
	}
}
