package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.LineMapper;
import dao.mapper.QnaMapper;
import logic.Line;

@Repository
public class LineDao { //한줄평
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param =new HashMap<>();
	
	//한줄평 작성
	public void insert(Line line) {
		template.getMapper(LineMapper.class).insert(line);
	}

	public int maxnum() {
		return template.getMapper(LineMapper.class).maxnum();
	}

	//[user] 쓰지않은 한줄평 카운트 
	public int getNotMentionedCount(String userid) {
		return template.getMapper(LineMapper.class).notMentionedCount(userid);
	}


	public int count(String searchtype1, String searchcontent1, Integer item_no) {
		param.clear();
		param.put("searchtype1",searchtype1);
		param.put("searchcontent1",searchcontent1);
		param.put("item_no", item_no);
		return template.getMapper(LineMapper.class).count(param);
	}

	public List<Line> linelist(Integer pageNum1, int limit1, Integer item_no,Integer line_no) {
		param.clear();
		param.put("startrow", (pageNum1-1) * limit1);
		param.put("limit",limit1);
		param.put("item_no", item_no);
		param.put("line_no",line_no);
		return template.getMapper(LineMapper.class).select(param);
	}


	public void update(Line line) {
		template.getMapper(LineMapper.class).update(line);
		
	}

	public Line selectOne(Integer line_no) {
		param.clear();

		param.put("line_no", line_no);
		return template.getMapper(LineMapper.class).select(param).get(0);
	}

	public void delete(int line_no) {
		param.clear();
		param.put("line_no", line_no);
		template.getMapper(LineMapper.class).delete(param);
		
	}

	public Line getline(int order_no, int seq) {
		param.clear();
		param.put("order_no", order_no);
		param.put("seq", seq);
		Line line =template.getMapper(LineMapper.class).selectone(param); 
		if(line==null)
			return new Line();
		else
			return line;
	}

	
	
}
