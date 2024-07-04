package com.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.MemberDAO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;

@Component
@Controller
public class MemberController {
	
	private Logger log=Logger.getLogger(this.getClass());

	@Autowired
    private MemberDAO memberDAO;
	@Autowired
    private JavaMailSender mailSender;
	
	//로그인 페이지 이동
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String getLogin() {
		log.info("login 이동");
		return "login";//return "이동시킬 파일명";
	}
	
	// 로그인 처리
    @RequestMapping(value="/login.do",method=RequestMethod.POST)
    public String postLogin(@RequestParam("member_id") String member_id, 
    									@RequestParam("member_password") String member_password, 
    									 HttpSession session, Model model) {
    	
        LoginVO login = memberDAO.memberLogin(member_id,member_password);
        log.debug("로그인 시도=>"+login);
        if (login != null) {
            session.setAttribute("loginMember", login); // 로그인 성공 시 세션에 회원 정보 저장
            log.debug("세션에 회원정보=>"+login);
            return "redirect:/main.do"; // 로그인 성공 후 이동할 페이지
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호를 확인해주세요.");
            return "login"; // 로그인 실패 시 로그인 페이지로 다시 이동
        }
    }
    
     // 로그아웃 처리
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "logout"; // 로그아웃 후 로그아웃 페이지로 이동
    }

	//회원가입 페이지 이동
	@RequestMapping(value="/register.do",method=RequestMethod.GET)
	public String getRegister() {
		log.info("register 이동");
		return "register";//return "이동시킬 파일명";
	}
	
	//회원가입
	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	public String postRegister(@ModelAttribute MemberVO memberVO, Model model) {
		
		if(log.isDebugEnabled()){ //로그객체의 정보를 출력할 준비(=디버깅모드)
		   log.debug("memberVO="+memberVO);//log.debug("출력할 정보~)
		}
		
		memberDAO.memberRegister(memberVO);
		model.addAttribute("member_name", memberVO.getMember_name());
		return "registerSuccess";
	}
	
	//계정정보찾기 페이지 이동
	@RequestMapping(value="/memberFind.do",method=RequestMethod.GET)
	public String getMemberFind() {
		log.info("memberFind 이동");
		return "memberFind";//return "이동시킬 파일명";
	}
	
	//계정정보찾기
	@RequestMapping(value="/idSearch.do",method=RequestMethod.POST)
	public ModelAndView postMemberFind(@RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email) {
        MemberVO member = memberDAO.memberFind(member_name, member_email);
        ModelAndView mav = new ModelAndView();
        if (member != null) {
            mav.addObject("member", member);
            mav.setViewName("idSearch"); // 계정정보를 보여줄 페이지로 이동
        } else {
            mav.addObject("message", "계정정보를 찾을 수 없습니다.");
            mav.setViewName("memberFind"); // 다시 계정정보 찾기 페이지로 이동
        }
        return mav;
    }
	
	//비밀번호재설정 페이지 이동
	@RequestMapping(value="/pwChange.do", method=RequestMethod.GET)
	public ModelAndView getPwChange(@RequestParam("member_id") String member_id) {
		log.info("pwChange 이동");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_id", member_id); // member_id를 전달
		mav.setViewName("pwChange"); // 이동시킬 파일명
		return mav;
	}
	
	//비밀번호변경하기
	@RequestMapping(value="/updatePassword.do", method=RequestMethod.POST)
	public String updatePassword(@RequestParam("member_id") String member_id,
	                             				@RequestParam("member_password") String member_password) {
	    memberDAO.passwordChange(member_password, member_id);
	    return "redirect:/login.do"; // 비밀번호 변경 후 로그인 페이지로 이동
	}
	
	//아이디 중복체크
	@RequestMapping(value="/checkId.do", method=RequestMethod.GET)
    @ResponseBody
    public String checkId(@RequestParam("member_id") String member_id) {
        MemberVO member = memberDAO.idCheck(member_id);
        return (member != null) ? "N" : "Y";
    }
	
	// 회원가입 이메일 인증
    @RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        // 뷰(View)로부터 넘어온 데이터 확인
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);
        
        // 이메일 보내기
        String setFrom = "cyhoon13@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일입니다.";
        String content = 
                "북스테이션을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; 
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);    
        }catch(Exception e) {
            e.printStackTrace();
            return "fail"; // 이메일 전송 실패시 "fail" 반환
        }
        String num = Integer.toString(checkNum);
        return num;        
    }
    
 // 계정정보 확인 이메일 인증
    @RequestMapping(value="/mailCheck2.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheck2GET(String email) throws Exception{
        
        // 뷰(View)로부터 넘어온 데이터 확인
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);
        
        // 이메일 보내기
        String setFrom = "cyhoon13@gmail.com";
        String toMail = email;
        String title = "계정 정보 인증 이메일입니다.";
        String content = 
                "북스테이션을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);    
        }catch(Exception e) {
            e.printStackTrace();
            return "fail"; // 이메일 전송 실패시 "fail" 반환
        }
        String num = Integer.toString(checkNum);
        return num;        
    }
    
    //회원탈퇴 페이지 이동
  	@RequestMapping(value="/leave.do",method=RequestMethod.GET)
  	public String getLeave() {
  		log.info("leave 이동");
  		return "leave";//return "이동시킬 파일명";
  	}
  	
  	//회원탈퇴
  	@RequestMapping(value="/leave.do",method=RequestMethod.POST)
  	public String memberLeave(@RequestParam("member_password") String memberPassword, 
  																							HttpSession session, Model model) {
        // 세션에서 로그인된 회원 정보 가져오기
        LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
        log.debug("세션에서 로그인된 회원 정보=>"+loginMember);
        if (loginMember != null) {
            String memberId = loginMember.getMember_id();

            // 비밀번호 확인
            LoginVO login = memberDAO.memberLogin(memberId, memberPassword);
            if (login == null) {
                model.addAttribute("leaveError", "비밀번호가 일치하지 않습니다.");
                return "leave"; // 비밀번호가 일치하지 않으면 회원탈퇴 페이지로 다시 이동
            }
            // 회원탈퇴 처리
            memberDAO.memberLeave(memberId);
            session.invalidate(); // 세션 무효화
            return "leaveSuccess"; // 탈퇴 후 로그아웃 성공 페이지로 이동
        } else {
            return "redirect:/login.do"; // 로그인 정보 없을 경우 로그인 페이지로 이동
        }
    }
  
  	//회원정보 수정 페이지 회원정보 출력
  	@RequestMapping(value = "/userInfoChange.do", method = RequestMethod.GET)
    public String userInfo(HttpSession session, Model model) {
        LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
        if (loginMember != null) {
            MemberVO member = memberDAO.idCheck(loginMember.getMember_id());
            model.addAttribute("member", member);
            return "userInfoChange";
        } else {
            return "redirect:/login.do";
        }
    }
  	
  	// 회원정보 수정
    @RequestMapping(value = "/userInfoChange.do", method = RequestMethod.POST)
    public String userInfoChange(@ModelAttribute MemberVO memberVO, HttpSession session, Model model) {
        Object loginMemberObject = session.getAttribute("loginMember");
        
        if (loginMemberObject instanceof LoginVO) {
            LoginVO loginMember = (LoginVO) loginMemberObject;
            memberVO.setMember_id(loginMember.getMember_id());
            //log.debug("수정전 회원정보"+memberVO);
            memberDAO.infoChange(memberVO);
            //log.debug("수정된 회원정보"+memberVO);

            session.setAttribute("loginMember", loginMember); 
            // 세션 갱신 시 MemberVO를 LoginVO로 변환하는지 확인
            log.debug("갱신된 세션정보=>"+loginMember);
            return "redirect:/mypage.do"; // 수정 후 마이페이지로 이동
        } else {
            return "redirect:/login.do"; // 로그인하지 않은 경우 로그인 페이지로 이동
        }
    }
    
}
