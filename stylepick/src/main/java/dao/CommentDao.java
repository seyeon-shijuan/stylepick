package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CommentMapper;
import logic.Comment;


@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public int maxnum(int sns_no) {
		param.put("sns_no",sns_no);
		return template.getMapper(CommentMapper.class).maxnum(param);
	}

	public void insert(Comment comment) {
		template.getMapper(CommentMapper.class).insert(comment);
	}

	public List<Comment> list(int sns_no) {
		param.put("sns_no",sns_no);
		return template.getMapper(CommentMapper.class).select(param);
	}

}
