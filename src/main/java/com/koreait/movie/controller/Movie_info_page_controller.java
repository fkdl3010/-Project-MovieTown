package com.koreait.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Movie_info_page_controller {
	@RequestMapping(value="movie_info_page.do")
	public String movie_info_page() {
		return "movie_info_page/movie_info_page";
	}
}