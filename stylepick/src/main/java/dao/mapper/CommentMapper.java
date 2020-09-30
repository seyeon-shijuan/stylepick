package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Comment;

public interface CommentMapper {
	@Select("select ifnull(max(reply_no),0) from comment where sns_no=#{sns_no}")
	int maxnum(Map<String, Object> param);

	@Insert("insert into comment (sns_no,reply_no,userid,content,regdate) values (#{sns_no},#{reply_no},#{userid},#{content},now())")
	void insert(Comment comment);

	@Select("select sns_no,reply_no,userid,content,regdate from comment where sns_no=#{sns_no} order by regdate")
	List<Comment> select(Map<String, Object> param);
}
