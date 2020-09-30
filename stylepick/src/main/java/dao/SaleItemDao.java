package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import logic.SaleItem;

@Repository
public class SaleItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public void insert(SaleItem saleItem) {
		template.getMapper(SaleItemMapper.class).insert(saleItem);
	}

	public List<SaleItem> list(int saleid) {
		param.clear();
		param.put("saleid", saleid);
		return template.getMapper(SaleItemMapper.class).select(param);
	}

	//[chyeon] 유저가 리뷰를 등록할때 review컬럼의 값을 0->1로 변경
	public void reviewed(int order_no, int seq) {
		template.getMapper(SaleItemMapper.class).reviewed(order_no,seq);
		
	}

	public int updatestat(int order_no, int seq, int stat) {
		return template.getMapper(SaleItemMapper.class).updatestat(order_no,seq,stat);
	}

	public int mysoldcount(String userid) {
		return template.getMapper(SaleItemMapper.class).soldcount(userid);
	}

	public int mybalance(String userid) {
		return template.getMapper(SaleItemMapper.class).mybalance(userid);
	}

	public void rmreview(int order_no, int seq) {
		System.out.println(order_no+"+"+seq);
		template.getMapper(SaleItemMapper.class).rmreview(order_no,seq);
	}
}
