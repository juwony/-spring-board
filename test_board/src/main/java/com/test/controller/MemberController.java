package com.test.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.MemberVO;
import com.test.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;

	
	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return "redirect:/member/login";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}
	
	// 로그인
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
			rttr.addFlashAttribute("msg", true);
		}
		
		return "redirect:/member/login";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
	 logger.info("get logout");
	 
	 session.invalidate();
	   
	 return "redirect:/";
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdate() throws Exception {
		logger.info("get Update");
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(HttpSession session, MemberVO vo) throws Exception{
		logger.info("post Update");
		
		service.update(vo);
		
		logout(session);
		
		return "redirect:/";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	public void getWithDraw() throws Exception {
		logger.info("get withdraw");
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public String postWithDraw(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post withdraw");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String oldPW = member.getUserPW();
		String newPW = vo.getUserPW();
		
		if(!(oldPW.contentEquals(newPW))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/withdraw";
		} else if(oldPW.contentEquals(newPW)){
			rttr.addFlashAttribute("msg", true);
		}
		
		service.withdraw(vo);
		
		logout(session);
		
		return "redirect:/member/withdraw";
	}
	
	// 아이디 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idCheck");
		
		String userID = req.getParameter("userID");
		MemberVO idCheck = service.idCheck(userID);
		
		int result = 0;
		
		if(idCheck != null) {
			result = 1;
		}
		
		return result;
	}
}
