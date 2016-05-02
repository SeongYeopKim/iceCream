package kr.ice.cream.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ice.cream.service.AdminService;

/**
 * Created by Administrator on 2015-07-13.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService service;

	//일 매출 
	@RequestMapping(value="/")
	public ModelAndView adminPage(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("amountMoney",service.getDayAmount());
		mav.addObject("bestMenu",service.getBestMenu());
		mav.addObject("leastMenu",service.getleastMenu());
		mav.addObject("ageChart",service.getageChart());
		mav.addObject("taste1",service.getTaste1());
		mav.addObject("taste2",service.getTaste2());
		mav.addObject("taste3",service.getTaste3());
		mav.addObject("taste4",service.getTaste4());
		mav.addObject("taste5",service.getTaste5());
		mav.addObject("timeCnt",service.getTimeCnt());
		
		mav.setViewName("admin/main");
		return mav;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String myorder() {

		return "/admin/login";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		int a = service.login(id, pw);

		ModelAndView mav = new ModelAndView();
		if (a == 1) {
			session.setAttribute("admin", "admin");
			mav.setViewName("redirect:/admin/");
		} else {
			mav.addObject("loginStatus", "fail");
			mav.setViewName("/admin/login");
		}
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/customer/home";
	}
	
}
