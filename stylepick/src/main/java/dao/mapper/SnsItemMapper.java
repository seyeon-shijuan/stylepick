package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.SnsItem;

public interface SnsItemMapper {
	

	@Insert("insert into snsitem (sns_no,seq,category,detail,isshopitem) values (#{sns_no},#{seq},#{category},#{detail},#{isshopitem})")
	void insert(SnsItem snsItem);
	
	@Select("select sns_no,seq,category,detail,isshopitem from snsitem where sns_no=#{sns_no}")
	List<SnsItem> select(Map<String,Object> param);

	@Delete("delete from snsitem where sns_no=#{sns_no}")
	void delete(SnsItem si);

	@Delete("delete from snsitem where sns_no=#{sns_no}")
	void delete2(Map<String, Object> param);

	@Select("select sns_no,seq,category,detail,isshopitem from snsitem where sns_no=#{sns_no} and isshopitem != 0")
	List<SnsItem> select2(Map<String, Object> param);
}
