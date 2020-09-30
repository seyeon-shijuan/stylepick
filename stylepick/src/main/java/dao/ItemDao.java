package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;
import logic.Sns;

@Repository
public class ItemDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param =new HashMap<>();
	
	public int maxnum() {
		return template.getMapper(ItemMapper.class).maxnum();
	}
	
	public List<Item> list(Integer category,Integer listAmount,String keyword, int limit) {
		param.clear();
		param.put("category", category);
		param.put("startrow",(listAmount-1)*12);
		param.put("limit", limit);
		param.put("keyword",keyword);
		return template.getMapper(ItemMapper.class).select(param);
	}
	
	public List<Item> list2(Integer category,Integer pageNum,String keyword, int limit) {
		param.clear();
		param.put("category", category);
		param.put("startrow",(pageNum-1)*4);
		param.put("limit", limit);
		param.put("keyword",keyword);
		return template.getMapper(ItemMapper.class).select2(param);
	}

	public void insert(Item item) {

		template.getMapper(ItemMapper.class).insert(item);
	}

	public Item selectOne(Integer item_no) {
		param.clear();
		param.put("item_no", item_no);
		return template.getMapper(ItemMapper.class).select(param).get(0);
	}
	
	public Item selectOne2(Integer item_no) {
		param.clear();
		param.put("item_no", item_no);
		return template.getMapper(ItemMapper.class).select3(param).get(0);
	}

	public int count(String searchtype, String searchcontent) {
		return template.getMapper(ItemMapper.class).count(param);
	}
	
	public int count2(String keyword,Integer category) {
		param.clear();
		param.put("keyword",keyword);
		param.put("category",category);
		return template.getMapper(ItemMapper.class).count2(param);
	}



	//조회수 증가
	public void readcntadd(Integer item_no) {
		param.clear();
		param.put("item_no", item_no);
		template.getMapper(ItemMapper.class).readcntadd(item_no);
	}

	public void update(Item item) {
		template.getMapper(ItemMapper.class).update(item);
	}

	public void delete(int item_no) {
		template.getMapper(ItemMapper.class).delete(item_no);
	}

	public List<Item> rankItems() {		
		return template.getMapper(ItemMapper.class).selectRank();
	}

	public List<Item> newItems() {
		return template.getMapper(ItemMapper.class).selectNew();
	}

	public List<Sns> reviewSns(Integer item_no,Integer pageNum,int limit) {
		param.clear();
		param.put("item_no",item_no);
		param.put("startrow",(pageNum-1)*4);
		param.put("limit", limit);
		return template.getMapper(ItemMapper.class).selectSns(param);
	}


	
}
