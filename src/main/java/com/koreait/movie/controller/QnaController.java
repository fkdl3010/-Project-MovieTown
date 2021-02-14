package com.koreait.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.movie.command.qna.QnaDeleteCommand;
import com.koreait.movie.command.qna.QnaListCommand;
import com.koreait.movie.command.qna.QnaViewCommand;
import com.koreait.movie.command.qna.QnaWriteCommand;


@Controller

public class QnaController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private QnaWriteCommand qnaWriteCommand;
	private QnaListCommand qnaListCommand;
	private QnaViewCommand qnaViewCommand;
	private QnaDeleteCommand qnaDeleteCommand;
	
	@Autowired
	public void setBean(QnaWriteCommand qnaWriteCommand,
						QnaListCommand qnaListCommand,
						QnaViewCommand qnaViewCommand,
						QnaDeleteCommand qnaDeleteCommand) {
		this.qnaWriteCommand = qnaWriteCommand;
		this.qnaListCommand = qnaListCommand;
		this.qnaViewCommand = qnaViewCommand;
		this.qnaDeleteCommand = qnaDeleteCommand;
		
	}
	
	@RequestMapping(value="qnaWritePage.do")
	public String qnaWritePage() {
		return "qnaPage/qnaWritePage";
	}
	
	// 리스트
	@RequestMapping(value="qnaListView.do", 
					method=RequestMethod.GET)
	public String qnaListView(HttpServletRequest request,
							  Model model) {
		model.addAttribute("request", request);
		//RequestListCommand command = new RequestListCommand();
		qnaListCommand.execute(sqlSession, model);
		return "qnaPage/qnaListPage";
	}
	
	// 문의글 상세보기
	@RequestMapping(value="qnaView.do", method=RequestMethod.GET)
	public String qnaView(HttpServletRequest request,
            				  Model model) {
		model.addAttribute("request", request);
		
		qnaViewCommand.execute(sqlSession, model);
		return "qnaPage/qnaViewPage";
	}

	// 문의하기에서 리스트로 넘어가기
	@RequestMapping(value="qnaWrite.do", method=RequestMethod.POST)
	public String qnaWrite(HttpServletRequest request,
						      RedirectAttributes rttr,
						      Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		qnaWriteCommand.execute(sqlSession, model);
		return "redirect:qnaListView.do";
	}
	
	// 문의 삭제
	@RequestMapping(value="qnaDelete.do", method=RequestMethod.POST)
	public String qnaDelete(HttpServletRequest request,
							RedirectAttributes rttr,
					        Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		qnaDeleteCommand.execute(sqlSession, model);
		return "redirect:qnaListView.do";
	}
	
	
	
	
}
