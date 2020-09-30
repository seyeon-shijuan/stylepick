package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.AdminMapper;
import dao.mapper.BoardMapper;
import dao.mapper.SnsItemMapper;
import dao.mapper.SnsMapper;
import dao.mapper.UserMapper;
import logic.Board;
import logic.Buy;
import logic.Line;
import logic.Sns;
import logic.SnsItem;
import logic.Statistics;
import logic.Todolist;
import logic.User;

@Repository
public class AdminDao {
   
   @Autowired
   private SqlSessionTemplate template;
   private Map<String,Object> param = new HashMap<>();

   //dashboard index 1-1 이달 가입회원
   public int newusers() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).newusers();
   }
   //dashboard index 1-2 전체 회원
   public long numofusers() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).numofusers();
   }
   //dashboard index 1-3 이달 매출
   public long salesofthismonth() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).salesofthismonth();
   }
   //dashboard index 1-4 누적 매출
   public long salesdata() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).salesdata();
   }
   //dashboard index 1-5 누적 리뷰
   public long numofreviews() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).numofreviews();
   }
   //dashboard index 2-1 주간 매출
   public List<Buy> weeklyrevenue() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).weeklyrevenue();
   }
   //dashboard index 2-2 최근 4주간 매출
   public List<Buy> monthlyrevenue() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).monthlyrevenue();
   }
   //widgets index 1-1 daily sales report
   public List<Buy> getSales() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).getSales(param);
   }
   //widgets index 1-2 recently joined users
   public List<User> getUsers() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).getUsers(param);
   }
   //widgets index 2-1 이번 달 구매 회원 랭킹
   public List<Buy> monthlyheavyusers() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).monthlyheavyusers(param);
   }
   //widgets index 2-2 올해 최다 구매 회원 랭킹
   public List<Buy> yearlyheavyusers() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).yearlyheavyusers(param);
   }
   //widgets index 3-1 우수 입점 스토어 차트
   public List<Line> topthreestores() {
      // TODO Auto-generated method stub
      return template.getMapper(AdminMapper.class).topthreestores(param);
   }
   //dashboard index 3-1 To-do list
   public void addtodolist() {
      // TODO Auto-generated method stub
//      template.getMapper(AdminMapper.class).addtodolist();
   }
   //widgets index 3-2 최근 4주 별점 평균 상위 3개 스토어
   public List<Line> getEvaluation() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).getEvaluation(param);
   }
   //charts index 3 Yearly : 연 매출 현황
   public List<Buy> yearlyrevenue() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).yearlyrevenue(param);
   }
   //charts index 5 구매건 기준 매출 산점도
   public List<Buy> scatterplot() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).scatterplot(param);
   }
   //charts index 6-1 카테고리별 판매 현황(월)
   public List<Buy> salesbycategories() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).salesbycategories(param);
   }
   //charts index 1 스타일픽 회원 수
   public List<User> totnumofusers() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).totnumofusers(param);
   }
   //charts index 7-2 상위 10개 스토어 (월 매출 기준)
   public List<Buy> toptenstores() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).toptenstores(param);
   }
   // charts index 4-1 지역별 매출 평균 boxplot
   public List<Buy> boxplot() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).boxplot(param);
   }
   //salesmgr 매출 관리 0822
   public List<Buy> saleslist(String searchtype, String searchcontent,int pageNum,int limit) {
      param.clear();
      if (searchtype != null && searchcontent != null) {
         //sql += " WHERE " + searchtype + " LIKE :searchcontent ";
         param.put("searchtype", searchtype);
         param.put("searchcontent", "%"+searchcontent+"%");
      }
      param.put("startrow", (pageNum - 1) * limit);
      param.put("limit", limit);
      return template.getMapper(AdminMapper.class).saleslist(param);
   }
   //storelist 스토어 관리
   public List<User> storelist(String searchtype, String searchcontent,int pageNum,int limit) {
      param.clear();
      if (searchtype != null && searchcontent != null) {
         //sql += " WHERE " + searchtype + " LIKE :searchcontent ";
         param.put("searchtype", searchtype);
         param.put("searchcontent", "%"+searchcontent+"%");
      }
      param.put("startrow", (pageNum - 1) * limit);
      param.put("limit", limit);
      return template.getMapper(AdminMapper.class).storelist(param);
   }
   
   //[admin] user list 유저리스트
   public List<User> list(String searchtype, String searchcontent, Integer pageNum, int limit) {
      param.clear();
      if (searchtype != null && searchcontent != null) {
         //sql += " WHERE " + searchtype + " LIKE :searchcontent ";
         param.put("searchtype", searchtype);
         param.put("searchcontent", "%"+searchcontent+"%");
      }
      param.put("startrow", (pageNum - 1) * limit);
      param.put("limit", limit);
      return template.getMapper(AdminMapper.class).select(param);
   }
      
   //[admin] 판매자수   
   public int storecount(String searchtype, String searchcontent) {
      param.put("searchtype", searchtype);
      param.put("searchcontent", "%"+searchcontent+"%");
      return template.getMapper(AdminMapper.class).storecount(param);
   }
   //[admin] 거래수
   public int salecount(String searchtype, String searchcontent) {
      param.put("searchtype", searchtype);
      param.put("searchcontent", "%"+searchcontent+"%");
      return template.getMapper(AdminMapper.class).salecount(param);
   }
   //[admin] charts index 7-1 스토어 매출 점유율
   public List<Buy> storeshare() {
      // TODO Auto-generated method stub
      param.clear();
      return template.getMapper(AdminMapper.class).storeshare(param);
   }
   //[admin] 메일보낼 때 클릭한 아이디 목록 0715-2
   public List<User> emailList(String[] idchks) {
      // TODO Auto-generated method stub
      param.clear();
      param.put("userids", idchks);
      return template.getMapper(AdminMapper.class).emailselect(param);
   }
      
      

   
   
}