package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Reply;

public interface BoardMapper {
	@Select("select * from board where seq=#{seq}")
	List<Board> list(int seq);
	
	@Select({"<script>",
		"select no, title, category, if(author = 'admin', '관리자', if(author = '비회원', author, REPLACE(author, SUBSTR(author,-2,2),'**'))) author, seq, regtime, stat from board where seq=2",
		"<if test='stat != null'> and stat=#{stat}</if>",
		"<if test='author != null'> and author=#{author}</if>",
		"<if test='admin == null'> and openstatus=1</if>",
		" order by no",
		"</script>"
	})
	List<Board> qnalist(Map<String, Object> param);
	
	@Select({"<script>",
		"select * from board where seq=3",
		"<if test='category != null'> and substring_index(category,',',1)=#{category}</if>",
		" order by category desc",
		"</script>"
	})
	List<Board> faqlist(Map<String, Object> param);

	@Update("UPDATE board SET readcnt = readcnt + 1 WHERE no = #{no}")
	void readcnt(Map<String, Object> param);

	@Select("select * from board where no=#{no}")
	Board selectOne(int no);

	@Select("SELECT IFNULL(MAX(no),0) FROM board")
	int maxno();

	@Insert("INSERT INTO board " 
			+ " (no, title, author, seq, category, stat, regtime, readcnt, content, file1, openstatus, mail, email) "
			+ " VALUES (#{no}, #{title}, #{author}, #{seq}, #{category}, #{stat}, NOW(), 0, #{content}, #{fileurl}, #{openstatus}, #{mail}, #{email}) ")
	void insert(Board board);

	@Select("SELECT IFNULL(SUBSTRING_INDEX(category,',',1),'선택안함') FROM board GROUP BY 1")
	List<String> clist();
	
	@Delete("DELETE FROM board WHERE no=#{no}")
	void delete(int no);

	@Select("SELECT * FROM reply WHERE bno=#{no}")
	List<Reply> rlist(Integer no);

	@Insert("INSERT INTO reply " 
			+ " (rno, bno, regtime, author, content) "
			+ " VALUES (#{rno}, #{bno}, NOW(), #{author}, #{content}) ")
	void rinsert(Reply reply);
	
	@Select("SELECT IFNULL(MAX(rno),0) FROM reply")
	int maxrno();

	@Update("UPDATE board SET stat = 'complete' WHERE no = #{no}")
	void updateStatComplete(int bno);

	@Update("UPDATE board SET title=#{title}, content=#{content}, file1=#{fileurl} WHERE no=#{no}")
	void update(Board board);

}
