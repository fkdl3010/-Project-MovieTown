package com.koreait.movie.command.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.movie.common.CommonMapCommand;
import com.koreait.movie.dao.AdminDao;

public class AdminQnaDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int qnaNo = (Integer)map.get("qnaNo");

		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(dao.adminQnaDelete(qnaNo) > 0) {
			resultMap.put("deleteResult", true);
		}else {
			resultMap.put("deleteResult", false);
			
		}
		
		return resultMap;
	}

}