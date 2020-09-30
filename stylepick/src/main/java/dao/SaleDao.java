package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleMapper;
import logic.Sale;

@Repository
public class SaleDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<String, Object>();

	
	public int getMaxSaleid() {
		return template.getMapper(SaleMapper.class).maxid();
	}
	
	public void insert(Sale sale) {
		template.getMapper(SaleMapper.class).insert(sale);
	}

	public List<Sale> list(String id) {
		param.clear();
		param.put("userid", id);
		return template.getMapper(SaleMapper.class).select(param);
	}
}
