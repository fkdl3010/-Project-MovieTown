package com.koreait.movie.dao;

import java.util.List;
import java.util.Map;

import com.koreait.movie.dto.MovieDto;

public interface MainDao {

	public List<MovieDto> mainList1();

	public List<MovieDto> mainList2();

	public List<MovieDto> mainList3();

	public List<MovieDto> resultList(String search);

	public List<MovieDto> userGenreList(int userNo);

}