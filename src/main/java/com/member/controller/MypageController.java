package com.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;//@Controller 어노테이션
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;//@RequestMapping
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.MemberDAO;
import com.member.domain.GradeVO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.domain.QnaVO;

//POJO클래스로 작성->어떠한 인터페이스또는 클래스를 상속받지 않고 단독적으로 자유롭게
// 웹상에서 요청을 받아서 처리해주는 클래스 ->implements Controller (상속 X)
//요청을 받아서 처리해주는 메서드(자유롭게)->클래스명 위에 @Controller
//System.out.println(e.toString())->대신에 로그를 설정하는 방법

@Component
@Controller
public class MypageController {

	// 로그 설정
	private Logger log=Logger.getLogger(this.getClass());//SelectListController
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 마이페이지
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpServletRequest request) {
	    System.out.println("mypage() 호출");
	    System.out.println("mypage의 request="+request);
	    HttpSession session=request.getSession();
	    System.out.println("mypage의 loginMember="+session.getAttribute("loginMember"));
	    LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
	    System.out.println("mypage의 loginVO="+loginVO);

	    List<MemberVO> memberList=memberDAO.getMemberList(loginVO.getMember_id());  // loginMember에서 member_id를 사용하여 필터링
	    List<QnaVO> qnaList=memberDAO.getAllQnaList(loginVO.getMember_id());
	    List<GradeVO> gradeList=memberDAO.getGradeList();
	    
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("mypage");
	    mav.addObject("memberList", memberList);
	    mav.addObject("qnaList", qnaList);
	    mav.addObject("gradeList",gradeList);
	    request.setAttribute("loginVO", loginVO);
	    System.out.println("세팅후 request="+request);
	    return mav;
	}
	
	// 문의내역
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public ModelAndView qnaList(HttpServletRequest request) {
		System.out.println("qnaList() 호출");
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		List<QnaVO> qnaList=null;
		qnaList=memberDAO.getAllQnaList(loginVO.getMember_id());
		System.out.println("qnaList의 qnaList = "+qnaList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna");
		mav.addObject("qnaList",qnaList);
		return mav;
	}
	
	// 문의세부내역
	@RequestMapping("/qnaDetail.do")
	public ModelAndView qnaDetail(@RequestParam("qna_id")int qna_id) {
		System.out.println("qnaDetail() 호출");
		List<QnaVO> qnaList=null;
		qnaList=memberDAO.getQnaList(qna_id);
		System.out.println("qnaDetail의 qna_id = "+qna_id);
		System.out.println("qnaDetail의 qnaList = "+qnaList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaDetail");
		mav.addObject("qnaList",qnaList);
		return mav;
	}
	
	// 문의작성(페이지이동)
	@RequestMapping("/qnaWrite.do")
	public ModelAndView qnaWrite(HttpSession session,Model model) {
		System.out.println("qnaWrite() 호출");
	    LoginVO loginMember=(LoginVO)session.getAttribute("loginMember");
	    System.out.println("qnaWrite의 loginMember="+loginMember);
		List<MemberVO> writeList=memberDAO.getMemberList(loginMember.getMember_id());
		System.out.println("qnaWrite의 writeList = "+writeList);
		model.addAttribute("qnaWrite의 member", loginMember);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaWrite");
		mav.addObject("writeList",writeList);
		return mav;
	}
	
	// 문의작성(입력처리)
	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWritePro(@ModelAttribute QnaVO qnaVO) {
		System.out.println("qnaWritePro() 호출");
		memberDAO.insertQna(qnaVO);
		System.out.println("qnaWritePro의 qnaVO= "+qnaVO);
		return "redirect:/qna.do";
	}
	
	// 문의수정(페이지이동)
	@RequestMapping("/qnaUpdate.do")
	public ModelAndView qnaUpdate(@RequestParam("qna_id")int qna_id) {
		System.out.println("qnaUpdate() 호출");
		List<QnaVO> updateList=null;
		updateList=memberDAO.getQnaList(qna_id);
		System.out.println("qnaUpdate의 member_id = "+qna_id);
		System.out.println("qnaUpdate의 updateList = "+updateList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaUpdate");
		mav.addObject("updateList",updateList);
		return mav;
	}
	
	// 문의수정(수정처리)
	@RequestMapping(value = "/qnaUpdate.do", method = RequestMethod.POST)
	public String qnaUpdatePro(@ModelAttribute QnaVO qnaVO) {
		System.out.println("qnaUpdatePro() 호출");
		memberDAO.updateQna(qnaVO);
		System.out.println("qnaUpdatePro의 qnaVO");
		return "redirect:/qna.do";
	}
	
	// 문의삭제(delete)
	@RequestMapping("/qnaDelete.do")
	public ModelAndView qnaDelete(@RequestParam("qna_id")int qna_id) {
		System.out.println("qnaDelete() 호출");
		memberDAO.deleteQna(qna_id);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/qna.do");
		return mav;
	}
	
	// 등급
	@RequestMapping("/grade.do")
	public ModelAndView grade() {
		System.out.println("grade() 호출");
		
		List<GradeVO> gradeList=null;
		gradeList=memberDAO.getGradeList();
		System.out.println("grade의 gradeList = "+gradeList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("grade");
		mav.addObject("gradeList",gradeList);
		return mav;
	}
	
	// 고객센터
	@RequestMapping("/customerService.do")
	public ModelAndView customerService() {
		System.out.println("customerService() 호출");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("customerService");
		return mav;
	}
	
	// 자주묻는질문
	@RequestMapping("/faq.do")
	public ModelAndView faq() {
		System.out.println("faq() 호출");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq");
		return mav;
	}
	
	// 자주묻는질문(페이지 이동만 할 경우 String으로도 작성 가능)
//	@RequestMapping("/faq.do")
//	public String process5() {
//		System.out.println("process5() 호출");
//		return "faq";
//	}
	
}




