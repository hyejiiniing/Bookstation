package com.member.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.MemberDAO;
import com.member.dao.ReviewDAO;
import com.member.domain.ReviewVO;
import com.member.util.PagingUtil;
import com.member.validator.ReviewValidator;



@Component
@Controller
public class ReviewController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private ReviewDAO reviewDao;
	private MemberDAO memberDAO;
	
//	@RequestMapping("/review.do")
//	public ModelAndView process() {
//	      
//	      List<ReviewVo> list=null;
//	      
//         list=reviewDao.getAllReviews();
//         System.out.println("review의"+list);
//	      
//	      ModelAndView mav=new ModelAndView();
//	      mav.setViewName("myReview");
//	      mav.addObject("list",list);
//	      return mav;
	
	@RequestMapping("/review.do")
    public ModelAndView process(
            @RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
            @RequestParam(value = "filter", required = false) String filter,
            @RequestParam(value = "fromDate", required = false) String fromDate,
            @RequestParam(value = "toDate", required = false) String toDate) {
        int count;
        List<ReviewVO> notReviewedList;
        List<ReviewVO> reviewedList;

//        Map<String, Object> jieun = new HashMap<String, Object>();
//        jieun.put("filter", filter);
//        jieun.put("fromDate", fromDate);
//        jieun.put("toDate", toDate);
//        if (filter != null) {
//        	// 필터 지정 기간
//        } else if (fromDate != null && toDate != null) {
//        	// 달력 지정
//        } else {
//        	// 전체 기간
//        }
        
        
        if (fromDate != null && toDate != null) {
            Map<String, Object> dateRange = getDateRange(LocalDate.parse(fromDate), LocalDate.parse(toDate));
            notReviewedList = reviewDao.getReviewsByDateRange(dateRange);
            reviewedList = reviewDao.getReviewsByDateRange(dateRange);
            count = notReviewedList.size() + reviewedList.size();
        } else if (filter != null) {
            Map<String, Object> dateRange = getDateRange(filter);
            notReviewedList = reviewDao.getReviewsByDateRange(dateRange);
            reviewedList = reviewDao.getReviewsByDateRange(dateRange);
            count = notReviewedList.size() + reviewedList.size();
        } else {
            count = reviewDao.getReviewCount();
            PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "review.do");
            Map<String, Object> map = new HashMap<>();
            map.put("start", page.getStartCount());
            map.put("end", page.getEndCount());
            notReviewedList = reviewDao.getReviewListNotReviewed(map);
            reviewedList = reviewDao.getReviewListReviewed(map);
        }

        ModelAndView mav = new ModelAndView();
        mav.setViewName("myReview");
        mav.addObject("count", count);
        mav.addObject("currentPage", currentPage);
        mav.addObject("notReviewedList", notReviewedList);
        mav.addObject("reviewedList", reviewedList);
        if (filter == null && (fromDate == null || toDate == null)) {
            PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "review.do");
            mav.addObject("pagingHtml", page.getPagingHtml().toString());
        }

        return mav;
    }

    private Map<String, Object> getDateRange(String filter) {
        LocalDate endDate = LocalDate.now();
        LocalDate startDate;

        switch (filter) {
            case "day":
                startDate = endDate.minusDays(1);
                break;
            case "week":
                startDate = endDate.minusWeeks(1);
                break;
            case "month":
                startDate = endDate.minusMonths(1);
                break;
            case "3months":
                startDate = endDate.minusMonths(3);
                break;
            default:
                throw new IllegalArgumentException("Invalid filter: " + filter);
        }

        Map<String, Object> dateRange = new HashMap<>();
        dateRange.put("startDate", Date.from(startDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        dateRange.put("endDate", Date.from(endDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        return dateRange;
    }

    private Map<String, Object> getDateRange(LocalDate fromDate, LocalDate toDate) {
        Map<String, Object> dateRange = new HashMap<>();
        dateRange.put("startDate", Date.from(fromDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        dateRange.put("endDate", Date.from(toDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        return dateRange;
    }
	
	 // 리뷰 작성 페이지로 이동
		/*
		 * @RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET) public
		 * String register() { System.out.println("reviewWrite로 이동"); return
		 * "reviewWrite"; }
		 */
	
	// 리뷰 작성 페이지로 이동
    @RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
    public ModelAndView register(@RequestParam("isReview") int isReview) {
        System.out.println("reviewWrite로 이동");
        System.out.println("isReview=>"+isReview);//1
        ModelAndView mav=new ModelAndView("reviewWrite");
        mav.addObject("isReview",isReview);//isReview=1
        return mav;
    }
    
    
    // 리뷰 작성하기
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String submit(@ModelAttribute ReviewVO reviewVo, BindingResult result) {
        if (log.isDebugEnabled()) {
            log.debug("reviewVo=" + reviewVo);
        }

      //유효성 검사를 실행
      new ReviewValidator().validate(reviewVo, result );
        
      		
//      //에러가 발생하면 폼을 다시 보여줌
//        if (result.hasErrors()) {
//            return "reviewWrite";
//        }

        
        // 정상적으로 입력되었다면 리뷰를 데이터베이스에 삽입
        int max_review=reviewDao.getMaxReview()+1;
        System.out.println("다음에 저장돼서 들어갈 review_id값=>"+max_review);
        reviewVo.setReview_id(max_review);
        
        reviewDao.insertReview(reviewVo);

        // 글목록으로 이동
        return "redirect:/review.do";
    }
    
    
    
    // 리뷰 상세보기 페이지로 이동
    @RequestMapping(value = "/reviewDetail.do", method = RequestMethod.GET)
    public ModelAndView reviewDetail(@RequestParam("review_id")int review_id) {
    	System.out.println("reviewDetail로 이동");
    	List<ReviewVO> list=null;
    	list=reviewDao.getReviewById(review_id);
        ModelAndView mav=new ModelAndView();
        mav.addObject("list2",list);
        mav.setViewName("reviewDetail");
        return mav;
    }
   
    
    // 리뷰 수정페이지로 이동
    //@RequestMapping(value = "/update.do", method = RequestMethod.GET)
    @RequestMapping(value = "/update.do")
    public ModelAndView update(@RequestParam("review_id") int review_id) {
        System.out.println("update페이지 이동");
        System.out.println("review_id=>"+review_id);
        List<ReviewVO> reviewlist2 = reviewDao.getReviewById(review_id);//리뷰번호
        System.out.println("reviewlist2=>"+reviewlist2);
        ModelAndView mav = new ModelAndView();
        mav.addObject("reviewlist2", reviewlist2);//${list2}
        mav.setViewName("reviewUpdate");//reviewUpdate.jsp
        return mav;
    }
    
    
    // 리뷰 수정 처리
    @RequestMapping(value = "/updateSubmit.do", method = RequestMethod.POST)
    public String updateReview(ReviewVO reviewVo, BindingResult result) {
    	System.out.println("update수정처리");
    	System.out.println("updateSubmit의 reviewVO="+reviewVo);
        if (log.isDebugEnabled()) {
            log.debug("reviewVo=" + reviewVo);
        }

      //유효성 검사를 실행
  		new ReviewValidator().validate(reviewVo, result );
  		
  		
  		
//        // 에러가 발생하면 폼을 다시 보여줌
//        if (result.hasErrors()) {
//            return "reviewUpdate";
//        }

        // 리뷰를 데이터베이스에 업데이트
        reviewDao.updateReview(reviewVo);
        System.out.println("getReview_id="+reviewVo.getReview_id());

        // 글목록 또는 상세 페이지로 이동
        return "redirect:/reviewDetail.do?review_id=" + reviewVo.getReview_id();
    }
    
    
	//리뷰 삭제하기
	  @RequestMapping("/deletePro.do")
	  public String form(@RequestParam("review_id") int reviewId) {
      if (log.isDebugEnabled()) {
          log.debug("reviewId:" + reviewId);
      }

      reviewDao.deleteReview(reviewId);

      return "redirect:/review.do"; // 삭제 후 목록으로 이동
  }
    
    
//    // 삭제 폼으로 이동
//    @RequestMapping("/delete.do")
//    public String deleteReview(@RequestParam("review_id") int reviewId, Model model) {
//    	System.out.println("review삭제");
//        model.addAttribute("reviewId", reviewId);
//        return "deleteForm"; // 삭제 폼으로 이동 (Yes/No)
//    }
    
    // 리뷰 상세보기 페이지로 이동
//    @RequestMapping(value = "/reviewDetail.do", method = RequestMethod.GET)
//    public String detail() {
//        System.out.println("reviewDetail로 이동");
//        return "reviewDetail";
//    }

}
