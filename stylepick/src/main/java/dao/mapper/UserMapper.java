package dao.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Buy;
import logic.Item;
import logic.Line;
import logic.Sale;
import logic.SaleItem;
import logic.User;
import logic.Userorder;

public interface UserMapper {
	
	@Select("select count(*) from user where ${key} = #{val}")
	int joincompare(@Param("key")String key,@Param("val") String val);
	
	@Select("select ifnull(max(no),0) from user")
	int getmaxno();
	
	@Insert("insert into user (no,userid,password,nickname,email,seller,imgurl,regdate)"
			+ "values(#{no},#{userid},#{password},#{nickname},#{email},0,#{imgurl},now())")
	void insert(User user);

	@Update("update user set seller=1, name=#{name}, tel=#{tel}, com_name=#{com_name}, "
			+ "com_regist=#{com_regist}, com_tel=#{com_tel}, com_img=#{com_img} "
			+ "where userid=#{userid}")
	void sellerinsert(User user);
	
	
	@Select({"<script>",
		"select * from user",
		"<if test='userid !=null'> where userid = #{userid}</if>",
		"<if test='userid ==null'> where userid != 'admin'</if>",
		"<if test='searchtype!=null and searchcontent!=null'> and ${searchtype} LIKE #{searchcontent}</if>",
		"<if test='userids !=null'> and userid in ",
		"<foreach collection='userids' item='id' separator=',' ",
		"open='(' close=')'>#{id}</foreach></if>",
		"</script>"})
	List<User> select(Map<String, Object> param);
	
	/*
	 * 	// ***** '%${searchcontent}%'에서 #와 다르게 $는 '가 안붙는다.
	@Select({"<script>",
		"SELECT num,name,pass,subject,content,file1 fileurl,regdate,readcnt,grp,grplevel,grpstep FROM board",
		"<if test='searchtype!=null and searchcontent!=null'>WHERE ${searchtype} LIKE #{searchcontent}</if>",
		" order by grp desc, grpstep limit #{startrow}, #{limit}",
		"</script>"})
	 */

	@Update("update user set nickname=#{nickname},age=#{age},"
			+ "gender=#{gender},tel=#{tel},comment=#{comment},imgurl=#{imgurl} where userid=#{userid}")
	void update(User user);
	
	@Update("update user set com_name=#{com_name}, com_regist=#{com_regist}, "
			+ "com_tel=#{com_tel}, com_img=#{com_img} where userid=#{userid}")
	void sellerupdate(User user);

	@Delete("delete from user where userid=#{userid}")
	void delete(Map<String, Object> param);

	@Select("select i.item_name, b.orderdate, d.quantity*i.price price, "
			+ " d.stat FROM item i,buy b,buy_detail d WHERE "
			+ " i.item_no=d.item_no AND b.order_no=d.order_no "
			+ " AND b.userid=#{userid} order by orderdate desc")
	List<Userorder> getuserorder(String userid);
	
	@Select("select i.item_name, l.evaluation,l.content from line l,item i where "
			+ "i.item_no=l.item_no and l.userid=#{userid} order by l.line_no desc")
	List<Userorder> getuserline(String userid);
	
	@Select("SELECT COUNT(*) FROM buy_detail, buy "
			+ "WHERE buy.order_no=buy_detail.order_no AND buy.userid=#{userid}")
	int getmyshipping(String userid);
	
	@Select("SELECT * FROM buy WHERE userid=#{userid} ORDER BY order_no DESC")
	List<Sale> getusersale(String userid);
	
	@Select("select * from buy_detail where order_no=#{order_no}")
	List<SaleItem> usersalelist(int order_no);

	//[admin] storelist 스토어 관리 0822
	@Select({"<script>",
		"select * from user",
		"<if test='userid !=null'> where userid = #{userid} and seller=1</if>",
		"<if test='userid ==null'> where seller = 1</if>",
		"<if test='searchtype!=null and searchcontent!=null'>${searchtype} LIKE #{searchcontent}</if>",
		"<if test='userids !=null'> and userid in ",
		"<foreach collection='userids' item='id' separator=',' ",
		"open='(' close=')'>#{id}</foreach></if>",
		"</script>"})
	List<User> storelist(Object object);

	@Select("SELECT * FROM item WHERE userid = #{userid}")
	List<Item> myitem(String userid);
	
	@Select("select count(*) from item where userid = #{userid}")
	int sellcount(String userid);

	@Select("select * from item_qna ")
	int notmentionedQna(int item_no);

	@Select("SELECT * FROM buy_detail WHERE item_no IN(SELECT item_no FROM item WHERE userid=#{userid}) ORDER BY order_no DESC ,seq asc")
	List<SaleItem> getmysalelist(String userid);

	@Select("select * from buy where order_no=#{order_no}")
	Sale getsale(int order_no);

	@Select("select * from buy_detail where order_no in(select order_no from buy where userid=#{userid}) order by order_no desc,seq asc")
	List<SaleItem> getusersaleItem(String userid);

	@Select("select orderdate from buy where order_no=#{order_no}")
	Date getorderdate(int order_no);

	@Select("select * from buy_detail where order_no=#{order_no} and seq=#{seq}")
	SaleItem getsaleItem(@Param("order_no")int order_no,@Param("seq")int seq);

	//[admin] user 유저리스트 페이지 카운트(1p,2p..)
	@Select({"<script>",
		"SELECT COUNT(*) FROM user",
		"<if test='searchtype!=null and searchcontent!=null'>WHERE ${searchtype} LIKE #{searchcontent}</if>",
		"</script>"})
	int usercount(Map<String, Object> param);

}
