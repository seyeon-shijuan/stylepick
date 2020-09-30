package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SnsItemMapper;
import logic.Item;
import logic.SnsItem;

@Repository
public class SnsItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public void insert(SnsItem snsItem) {
		template.getMapper(SnsItemMapper.class).insert(snsItem);
	}
	
	public List<SnsItem> list(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		return template.getMapper(SnsItemMapper.class).select(param); 
	}

	public void update(SnsItem snsItem) {
		template.getMapper(SnsItemMapper.class).delete(snsItem);
		template.getMapper(SnsItemMapper.class).insert(snsItem);
	}

	public void delete(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		template.getMapper(SnsItemMapper.class).delete2(param);
	}

	public List<SnsItem> list2(int sns_no) {
		param.clear();
		param.put("sns_no",sns_no);
		return template.getMapper(SnsItemMapper.class).select2(param); 
	}

}
