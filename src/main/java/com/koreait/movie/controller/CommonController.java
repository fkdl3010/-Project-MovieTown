package com.koreait.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {


	@RequestMapping(value= {"","index.do"})
	public String index() {
		return "index";
	}
	
}
