package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Qna;

public interface QnaMapper {

	@Select("select ifnull(max(qna_no),0) from item_qna")
	int maxnum();

	@Insert("insert into item_qna (qna_no,item_no, type, userid,content, regdate,grp,grplevel,grpstep) values (#{qna_no},#{item_no},#{type},#{userid},#{content}, now(),#{grp},#{grplevel},#{grpstep})")
	void insert(Qna qna);

	

	@Select({"<script>",
		"select count(*) from item_qna ",
		"<if test='searchcontent != null'>where ${searchtype} like '%${searchcontent}%'</if>",
		"<if test='item_no != null'> where item_no=#{item_no} </if>",
		"</script>"
	})
	int count(Map<String, Object> param);
	
	@Select({"<script>",
		"select * from item_qna ",
		"<if test='searchcontent != null'>where ${searchtype} like '%${searchcontent}%'</if>",
		"<if test='item_no != null'> where item_no=#{item_no} </if>",
		"<if test='qna_no != null'> where qna_no=#{qna_no} </if>",
		"<if test='limit != null'>order by grp desc, grpstep limit #{startrow}, #{limit}</if>",
		"</script>"
		
	})
	List<Qna> select(Map<String, Object> param);

	@Update("update item_qna set grpstep = grpstep +1 where grp =#{grp} and grpstep >#{grpstep}")
	void grpStep(Map<String, Object> param);

	@Update("update item_qna set content=#{content} where qna_no=#{qna_no}")
	void update(Qna qna);

	
	@Delete("delete from item_qna where qna_no=#{qna_no}")
	void delete(Map<String, Object> param);

	

}
