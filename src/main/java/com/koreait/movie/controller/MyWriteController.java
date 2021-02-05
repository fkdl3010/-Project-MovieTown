package com.koreait.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.movie.command.myPage.MyWriteViewCommand;

public class MyWriteController {
	
	@RequestMapping(value="myWritePage.do", method=RequestMethod.GET)
	public String view(HttpServletRequest request, Model model, SqlSession sqlSession) {
	    model.addAttribute("request", request);
	    MyWriteViewCommand command = new MyWriteViewCommand();
	    command.execute(sqlSession, model);
	    return "myPage/myWriteView";   
	}

}