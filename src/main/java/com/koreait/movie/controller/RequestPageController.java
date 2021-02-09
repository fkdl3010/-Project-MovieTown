package com.koreait.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.movie.command.request.RequestListCommand;
import com.koreait.movie.command.request.RequestViewCommand;
import com.koreait.movie.command.request.RequestWriteCommand;


@Controller

public class RequestPageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private RequestWriteCommand requestWriteCommand;
	private RequestListCommand requestListCommand;
	private RequestViewCommand requestViewCommand;
	
	@Autowired
	public void setBean(RequestWriteCommand requestWriteCommand,
						RequestListCommand requestListCommand,
						RequestViewCommand requestViewCommand) {
		this.requestWriteCommand = requestWriteCommand;
		this.requestListCommand = requestListCommand;
		this.requestViewCommand = requestViewCommand;
		
	}
	
	@RequestMapping(value="requestWritePage.do")
	public String requestWritePage() {
		return "requestPage/requestWritePage";
	}
	
	// 리스트
	@RequestMapping(value="requestListPage.do", 
					method = {RequestMethod.GET})
	public String requestListPage(HttpServletRequest request,
								 Model model) {
		model.addAttribute("request", request);
		//RequestListCommand command = new RequestListCommand();
		requestListCommand.execute(sqlSession, model);
			return "requestPage/requestListPage";
	}
	
	@RequestMapping(value="requestViewPage.do") 
	public String requestViewPage() {
		return "requestPage/requestViewPage";
	}

	// 문의하기에서 리스트로 넘어가기
	@RequestMapping(value="requestWrite.do", method=RequestMethod.POST)
	public String requestListPage(HttpServletRequest request,
								  RedirectAttributes rttr,
								  Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		RequestWriteCommand requestWriteCommand = new RequestWriteCommand();
		requestWriteCommand.execute(sqlSession, model);
		return "redirect:requestList.do";
	}
	
	
	
	
	
}
