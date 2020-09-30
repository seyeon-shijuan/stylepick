package logic;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import dao.SnsDao;
import dao.SnsItemDao;
import dao.AdminDao;
import dao.BoardDao;

import dao.CommentDao;
import dao.ItemDao;
import dao.LineDao;
import dao.QnaDao;
import dao.SaleDao;
import dao.SaleItemDao;
import dao.UserDao;

@Service   //@Component + service ( Controller와 dao의 중간)
public class ShopService {

   @Autowired
   private UserDao userDao;
    
   @Autowired
   private SnsDao snsDao;

   @Autowired
   private ItemDao itemDao;
   
   @Autowired
   private QnaDao qnaDao;

   @Autowired
   private SnsItemDao snsItemDao;
   
   @Autowired
   private AdminDao adminDao;
   
   @Autowired
   private BoardDao boardDao;

   @Autowired
   private CommentDao commentDao;
   
   @Autowired
   private LineDao lineDao;
   
   @Autowired
   private SaleDao saleDao;
   
   @Autowired
   private SaleItemDao saleItemDao;
 
   //[user] 입력창 중복확인
   public int joincompare(String key, String val) {
      return userDao.joincompare(key,val);
   }
   
   //[user] no 최댓값확인
   public int getmaxno() {
      return userDao.getmaxno();
   }
   
   //[user] 일반회원가입
   public void userInsert(User user,HttpServletRequest request) {
      if(user.getImg() != null && !user.getImg().isEmpty()) {
         uploadFileCreate(user.getImg(),request,"user/file/");
         user.setImgurl(user.getImg().getOriginalFilename());
      }
      userDao.insert(user);
   }
   
   //[user] 판매자 회원 가입
   public void sellerEntry(User user,HttpServletRequest request) {
      if(user.getCom_imgM()!=null&&!user.getCom_imgM().isEmpty()) {
         uploadFileCreate(user.getCom_imgM(),request,"user/file/");
         user.setCom_img(user.getCom_imgM().getOriginalFilename());
      }
      userDao.sellerinsert(user);
   }
   
   //[user] 1명 정보 가져오기
   public User getUser(String userid) {
      return userDao.selectOne(userid);
   }
   
   //[user] 일반회원 정보 수정
   public void userUpdate(User user,HttpServletRequest request) {
      if(user.getImg() != null && !user.getImg().isEmpty()) {
         uploadFileCreate(user.getImg(),request,"user/file/");
         user.setImgurl(user.getImg().getOriginalFilename());
      }
      userDao.update(user);
   }
   
   //[user] 판매자 정보 수정
   public void sellerUpdate(User user,HttpServletRequest request) {
      if(user.getCom_imgM()!=null&&!user.getCom_imgM().isEmpty()) {
         uploadFileCreate(user.getCom_imgM(),request,"user/file/");
         user.setCom_img(user.getCom_imgM().getOriginalFilename());
      }
      userDao.sellerupdate(user);
   }

   //[user] 회원 삭제
   public void delete(String userid) {
      userDao.delete(userid);
   }

   //[user] 유저 리스트로 가져오기
   public List<User> getUserList() {
      return userDao.list();
   }
   
   //[user] 내 주문리스트 요약보기
   public List<Userorder> getUserOrder(String userid) {
      return userDao.userorder(userid);
   }
   
   //[user] 내 한줄평 요약보기
   public List<Userorder> getline(String userid) {
      return userDao.userline(userid);
   }
   
   //[user] 주문배송 - 배송중
   public int getmyshipping(String userid) {
      return userDao.getmyshipping(userid);
   }
   
   //[user] 내 주문내역
   public List<Sale> getusersale(String userid) {
      return userDao.getusersale(userid);
   }
   

   
   //[admin] 그래프1 0728
   public Map<String, Object> graph1() {
      // TODO Auto-generated method stub
      Map<String,Object> map = new HashMap<String,Object>();
//      for(Map<String,Object> m : boardDao.graph1()) {
//         map.put((String)m.get("name"), m.get("cnt"));
//      }
      return map;
   }
   
   //[admin] 유저리스트 가져오기 0827 0822 0728
   public List<User> list(String searchtype, String searchcontent, Integer pageNum, int limit) {
      return adminDao.list(searchtype, searchcontent, pageNum, limit);
      }

   //[admin] 그래프2 0728
   public Map<String, Object> graph2() {
      // TODO Auto-generated method stub
      Map<String,Object> map = new HashMap<String,Object>();
//      for(Map<String,Object> m : boardDao.graph2()) {
//         map.put((String)m.get("regdate"), m.get("cnt"));
//      }
      return map;
   }
   

         

   //[sns] ootd 번호
   public int snsNum() {
      int max = snsDao.maxnum();
      return ++max;
   }
   
   //[sns] ootd 작성
   public void snsWrite(Sns sns,HttpServletRequest request) {
      if(sns.getImg1() != null && !sns.getImg1().isEmpty()) {
         uploadFileCreate(sns.getImg1(),request,"sns/file/");
         sns.setImg1url(sns.getImg1().getOriginalFilename());
      }
      snsDao.insert(sns);
      for(SnsItem si : sns.getItemList()) {
         snsItemDao.insert(si);
      }      
   }
   
   //[sns] ootd 작성 관련 이미지 파일 업로드
   private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
      String orgFile = picture.getOriginalFilename();
      String uploadPath = request.getServletContext().getRealPath("/") + path;
      File fpath = new File(uploadPath);
      if(!fpath.exists()) fpath.mkdirs();
      try {
         picture.transferTo(new File(uploadPath + orgFile));
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   //[sns] ootd 상세보기
   public Sns getSns(int sns_no) {
      return snsDao.selectOne(sns_no);
   }
   
   //[sns] ootd 상세보기 - 스타일정보
   public List<SnsItem> getSnsItem(int sns_no) {
      return snsItemDao.list(sns_no);
   }

   
   //[sns] ootd 댓글 번호
   public int replyNum(int sns_no) {
      int max = commentDao.maxnum(sns_no);
      return ++max;
   }
   
   //[sns] ootd 댓글 작성
   public void replyWrite(Comment comment) {
      commentDao.insert(comment);   
   }
   
   //[sns] ootd 댓글 목록
   public List<Comment> getCommentList(int sns_no) {
      return commentDao.list(sns_no);
   }
   
   //[sns] ootd 목록 
   public List<Sns> getSnsList(String ksb,String type,int listAmount,int limit) {
      return snsDao.list(ksb,type,listAmount,limit);
   }
   
   //[sns] ootd 게시물 갯수
   public int getSnsCount(String type,String searchcontent) {
      return snsDao.listcount(type,searchcontent);
   }
   
   //[sns] ootd 좋아요
   public void addlike(int sns_no, String userid) {
       snsDao.like(sns_no,userid);
   }
   
   //[sns] ootd 좋아요수
   public int getlikenum(int sns_no) {
      return snsDao.likenum(sns_no);
   }

   //[sns] ootd 댓글수
   public int getcommentnum(int sns_no) {
      return snsDao.commentnum(sns_no);
   }
   
   //[sns] ootd 수정
   public void snsUpdate(Sns sns, HttpServletRequest request) {
      if(sns.getImg1() != null && !sns.getImg1().isEmpty()) {
         uploadFileCreate(sns.getImg1(),request,"sns/file/");
         sns.setImg1url(sns.getImg1().getOriginalFilename());
      }
      snsDao.update(sns);
      for(SnsItem si : sns.getItemList()) {
         snsItemDao.update(si);
      }      
   }
   
   //[sns] ootd 삭제
   public void deleteSns(int sns_no) {
      snsDao.delete(sns_no);
      snsItemDao.delete(sns_no);
   }
   
   //[sns] mypage 내가쓴글
   public List<Sns> mysns(String userid,int listAmount,int limit) {
      return snsDao.mylist(userid,listAmount,limit);
   }
   
   //[sns] mypage sns수
   public int getmySnsCount(String userid) {
      return snsDao.mysnscount(userid);
   }
   
   //[sns] 팔로우 기능
   public void Follow(String loginuser, String followuser) {
      snsDao.userFollow(loginuser,followuser);
   }
   
   //[sns] 팔로잉수
   public int getFollowCount(String userid) {
      return snsDao.FollowCount(userid);
   }

   //[sns] 팔로워수
   public int getFollowerCount(String userid) {
      return snsDao.FollowerCount(userid);
   }
   
   //[sns] 쇼핑몰 아이템
   public List<SnsItem> getshopItem(int sns_no) {
      return snsItemDao.list2(sns_no);
   }
   
   //[sns] ootd 검색
   public List<Sns> getSnsSearch(int listAmount,int limit,String keyword) {
      return snsDao.searchList(listAmount,limit,keyword);
   }


   
   // [아이템]상품 리스트 정보
   public List<Item> getItemList(Integer listAmount, int limit,String keyword,Integer category) {
      return itemDao.list(category,listAmount,keyword,limit);
   }
   
   public List<Item> getItemList2(Integer pageNum, int limit,String keyword,Integer category) {
      return itemDao.list2(category,pageNum,keyword,limit);
   }
   
   public int getItemCount(String searchtype, String searchcontent) {
      return itemDao.count(searchtype, searchcontent);
   }
   public int getItemCount2(String keyword,Integer category) {
      return itemDao.count2(keyword,category);
   }
   //[아이템]상품 상세보기
   public Item getItem(Integer item_no, boolean able) {
      if(able) {
         itemDao.readcntadd(item_no);
      }
      return itemDao.selectOne(item_no);
   }
   
   public Item getItem2(Integer item_no, boolean able) {
      if(able) {
         itemDao.readcntadd(item_no);
      }
      return itemDao.selectOne2(item_no);
   }
   
   public int getmaxnum() {
      // TODO Auto-generated method stub
      return itemDao.maxnum();
   }
   


   // [아이템]상품 작성

   public void itmeCreate(Item item, HttpServletRequest request) {
      if (item.getImgurl() != null && !item.getImgurl().isEmpty()) {
         uploadFileCreate(item.getImgurl(), request, "item/img/");
         item.setPictureUrl(item.getImgurl().getOriginalFilename());
      }

      itemDao.insert(item);   
   }
   
   //[아이템]상품 한줄평
   public void lineWrite(Line line, HttpServletRequest request) {
      int max= lineDao.maxnum();
      line.setLine_no(++max);
      lineDao.insert(line);
      saleItemDao.reviewed(line.getOrder_no(),line.getSeq());
   }
   


   //[아이템]한줄평 리스트
   public List<Line> linelist(Integer pageNum1, int limit1, Integer item_no, Integer line_no) {
      return lineDao.linelist(pageNum1,limit1,item_no,line_no);
   }
   
   //[아이템]한줄평 수정
      public void lineupdate(Line line, HttpServletRequest request) {
         lineDao.update(line);
      }

      public Line getlineno(Integer line_no) {
         return lineDao.selectOne(line_no);
      }
      
      //[아이템]한줄평 삭제
      public void lineDelete(Line line) {
         lineDao.delete(line.getLine_no());
         saleItemDao.rmreview(line.getOrder_no(),line.getSeq());
      }
   
   //[item] 상품 수정
   public void itemUpdate(Item item, HttpServletRequest request) {
      if (item.getImgurl() != null && !item.getImgurl().isEmpty()) {
         uploadFileCreate(item.getImgurl(), request, "item/img/");
         item.setPictureUrl(item.getImgurl().getOriginalFilename());
      }

      itemDao.update(item);   
   }
   
   //[아이템]한줄평
   public int linecount(String searchtype1, String searchcontent1, Integer item_no) {
      return lineDao.count(searchtype1, searchcontent1,item_no);

   }
   
   //[item] 상품 삭제
   public void itemDelete(int item_no) {
      itemDao.delete(item_no);
      
   }
   
   //[item] 인기상품
   public List<Item> getRankItems() {
      return itemDao.rankItems();
   }
   
   //[item] 최신상품
   public List<Item> getNewItems() {
      return itemDao.newItems();
   }
   
   //[item] sns 리뷰
   public List<Sns> getReviewSns(Integer item_no,Integer pageNum,int limit) {
      return itemDao.reviewSns(item_no,pageNum,limit);
   }


   //장바구니
   public Item getItem(Integer item_no) {
      return itemDao.selectOne(item_no);
   }
   
   
   // [admin] dashboard index 1-1 이달 가입회원 0813
   public int newusers() {
      // TODO Auto-generated method stub
      return adminDao.newusers();
   }

   // [admin] dashboard index 1-2 전체 회원 0813
   public long numofusers() {
      // TODO Auto-generated method stub
      return adminDao.numofusers();
   }

   // [admin] dashboard index 1-3 이달 매출 0813
   public long salesofthismonth() {
      // TODO Auto-generated method stub
      return adminDao.salesofthismonth();
   }

   // [admin] dashboard index 1-4 누적 매출 0813
   public long salesdata() {
      // TODO Auto-generated method stub
      return adminDao.salesdata();
   }

   // [admin] dashboard index 1-5 누적 리뷰 0813
   public long numofreviews() {
      // TODO Auto-generated method stub
      return adminDao.numofreviews();
   }

   // [admin] dashboard index 2-1 주간 매출 0814
   public List<Buy> weeklyrevenue() {
      // TODO Auto-generated method stub
      return adminDao.weeklyrevenue();
   }

   // [admin] dashboard index 2-2 최근 4주간 매출 0815
   public List<Buy> monthlyrevenue() {
      // TODO Auto-generated method stub
      return adminDao.monthlyrevenue();
   }

   // [admin] widgets index 1-1 daily sales report 0816
   public List<Buy> getSales() {
      // TODO Auto-generated method stub
      return adminDao.getSales();
   }

   // [admin] widgets index 1-2 recently joined users 0816
   public List<User> getUsers() {
      // TODO Auto-generated method stub
      return adminDao.getUsers();
   }

   // [admin] widgets index 2-1 이번 달 구매 회원 랭킹 0816
   public List<Buy> monthlyheavyusers() {
      // TODO Auto-generated method stub
      return adminDao.monthlyheavyusers();
   }

   // [admin] widgets index 2-2 올해 최다 구매 회원 랭킹 0817
   public List<Buy> yearlyheavyusers() {
      // TODO Auto-generated method stub
      return adminDao.yearlyheavyusers();
   }

   // [admin] widgets index 3-1 우수 입점 스토어 차트 0817
   public List<Line> topthreestores() {
      // TODO Auto-generated method stub
      return adminDao.topthreestores();
   }

   // [admin] widgets index 3-2 최근 4주 별점 평균 상위 3개 스토어 0818
   public List<Line> getEvaluation() {
      // TODO Auto-generated method stub
      return adminDao.getEvaluation();
   }

   // [admin] charts index 1 스타일픽 회원 수 0820
   public List<User> totnumofusers() {
      // TODO Auto-generated method stub
      return adminDao.totnumofusers();
   }

   // [admin] charts index 3 Yearly : 연 매출 현황 0818
   public List<Buy> yearlyrevenue() {
      // TODO Auto-generated method stub
      return adminDao.yearlyrevenue();
   }
   //[admin] charts index 4-1 지역별 매출 평균 boxplot 0822
   public List<Buy> boxplot() {
      // TODO Auto-generated method stub
      return adminDao.boxplot();
   }

   // [admin] charts index 5 구매건 기준 매출 산점도 0819
   public List<Buy> scatterplot() {
      // TODO Auto-generated method stub
      return adminDao.scatterplot();
   }

   // [admin] charts index 6-1 카테고리별 판매 현황(월) 0820
   public List<Buy> salesbycategories() {
      // TODO Auto-generated method stub
      return adminDao.salesbycategories();
   }

   // [admin] charts index 7-2 상위 10개 스토어 (월 매출 기준) 0820
   public List<Buy> toptenstores() {
      // TODO Auto-generated method stub
      return adminDao.toptenstores();
   }
   //[admin] storelist 스토어 관리 0822
   public List<User> storelist(String searchtype, String searchcontent,int pageNum,int limit) {
      return adminDao.storelist(searchtype, searchcontent,pageNum,limit);
   }
   
   //[admin] salesmgr 매출 관리 0822
   public List<Buy> saleslist(String searchtype, String searchcontent,int pageNum,int limit) {
      return adminDao.saleslist(searchtype, searchcontent,pageNum,limit);
   }

   //[admin] user 유저리스트 페이지 카운트(1p,2p..) 0827
   public int usercount(String searchtype, String searchcontent) {
      // TODO Auto-generated method stub
      return userDao.usercount(searchtype, searchcontent);
   }
   
   //[admin] charts index 7-1 스토어 매출 점유율 0827
   public List<Buy> storeshare() {
      // TODO Auto-generated method stub
      return adminDao.storeshare();
   }

   /**
    * Board
    */
   public List<Board> getBoardList(int seq) {
      return boardDao.list(seq);
   }

   public List<Board> getFaqList(String category) {
      return boardDao.faqlist(category);
   }

   public Board getBoard(Integer no, boolean readcntable) {
      if (readcntable) {
         boardDao.readcnt(no);
      }
      return boardDao.selectOne(no);
   }
   
   public List<String> getCategoryList() {
      return boardDao.categoryList();
   }
   
   public List<Board> getQnaList(String stat, String author, String admin) {
      return boardDao.qnalist(stat, author, admin);
   }
   
   public void boardWrite(Board board, HttpServletRequest request) {
      if(board.getFile1() != null && !board.getFile1().isEmpty()) {
         uploadFileCreate(board.getFile1(), request, "board/file/");
         board.setFileurl(board.getFile1().getOriginalFilename());
      }
      
      int max = boardDao.maxno();
      board.setNo(++max);
      boardDao.insert(board);
   }

   public void boardUpdate(Board board, HttpServletRequest request) {
      if(board.getFile1() != null && !board.getFile1().isEmpty()) {
         uploadFileCreate(board.getFile1(), request, "board/file/");
         board.setFileurl(board.getFile1().getOriginalFilename());
      }
      
      boardDao.update(board);
   }

   public void boardDelete(int no) {
      boardDao.delete(no);
   }
   
   public List<Reply> getReply(Integer no) {
      return boardDao.replyList(no);
   }
   
   public void regReply(Reply reply) {
      reply.setRno(boardDao.maxrno() + 1);
      boardDao.regReply(reply); 
   }
   
   public void boardStatComplete(int bno) {
      boardDao.statComplete(bno);
   }
   /** Board End **/

   public Sale checkend(Sale sale, Cart cart, User loginUser) {
      int maxno = saleDao.getMaxSaleid();
      sale.setOrder_no(++maxno);
      sale.setUser(loginUser);
      sale.setUserid(loginUser.getUserid());

      // 장바구니 판매 상품 정보
      List<ItemSet> itemList = cart.getItemSetList();
      int seq = 0;
      for(ItemSet itemSet : itemList) {
         ++seq;
         SaleItem saleItem = new SaleItem(sale.getOrder_no(), seq, itemSet);
         sale.getItemList().add(saleItem);
         saleItemDao.insert(saleItem);
      }
      saleDao.insert(sale);
      
      return sale;
   }

   
   
   //Q&A 작성
   public void qnaWrite(Qna qna, HttpServletRequest request) {
      int max= qnaDao.maxnum();
      qna.setQna_no(++max);
      qna.setGrp(max);
      qnaDao.insert(qna);
   }

   //Q&A
   public int qnacount(String searchtype, String searchcontent, Integer item_no) {
      return qnaDao.count(searchtype, searchcontent,item_no);
   }

   //Q&A 목록
   public List<Qna> qnalist(Integer pageNum, int limit, String searchtype, String searchcontent,Integer item_no) {
      return qnaDao.qnalist(pageNum,limit, searchtype, searchcontent,item_no);
   }


   //Q&A 답글
   public void qnaReply(Qna qna, HttpServletRequest request) {
      qnaDao.updateGrpStep(qna);
      int max=qnaDao.maxnum();
      qna.setQna_no(++max);
      qna.setGrplevel(qna.getGrplevel() + 1);
      qna.setGrpstep(qna.getGrpstep() +1);
       qnaDao.insert(qna);
      
   }
   
   //qna 수정값 가져오기
   public Qna getQna(int qna_no) {
      return qnaDao.selectOne(qna_no);
   }

   //qna 수정
   public void qnaupdate(Qna qna, HttpServletRequest request) {
      qnaDao.update(qna);
   }
   //qna 삭제
   public void qnaDelete(Qna qna) {
      qnaDao.delete(qna.getQna_no());
      
   }
   
   //[user] 내가 주문한 buy_item 목록 (order_no)
   public List<SaleItem> getusersalelist(int order_no) {
      return userDao.getusersalelist(order_no);
   }

   //[user] 내가 판매중인 item 목록
   public List<Item> getmyitem(String userid) {
      return userDao.getmyitem(userid);
   }
   
   //[user] 내 판매중인 item count
   public int getmysellcount(String userid) {
      return userDao.getmysellcount(userid);
   }

   //[user] qna가 답변되지 않은 내 상품의 문의  **미구현
   public int getNotmentionedQna(int item_no) {
      return userDao.getNotmentionedQna(item_no);
   }

   //[user] 내 판매 내역
   public List<SaleItem> getmysalelist(String userid) {
      return userDao.getmysalelist(userid);
   }
   
   //
   public Sale getsale(int order_no) {
      return userDao.getsale(order_no);
   }

   //[user] 판매물품 조회
   public SaleItem getsaleItem(int order_no, int seq) {
      return userDao.getsaleItem(order_no,seq);
   }

   //[user] 한줄평 작성하지않은 갯수
   public int getNotMentionedCount(String userid) {
      return lineDao.getNotMentionedCount(userid);
   }

   //[user] 내 구매내역
   public List<SaleItem> getusersaleitem(String userid) {
      return userDao.getusersaleitem(userid);
   }

   //[user] 주문날짜
   public Date getorderdate(int order_no) {
      return userDao.getorderdate(order_no);
   }



   public int updatestat(int order_no, int seq, int stat) {
      return saleItemDao.updatestat(order_no,seq,stat);
   }

   public int getmysoldcount(String userid) {
      return saleItemDao.mysoldcount(userid);
   }

   public int getmybalance(String userid) {
      return saleItemDao.mybalance(userid);
   }


   public int storecount(String searchtype, String searchcontent) {
      return adminDao.storecount(searchtype,searchcontent);
   }

   public int salecount(String searchtype, String searchcontent) {
      return adminDao.salecount(searchtype,searchcontent);
   }

   public Line getline(int order_no, int seq) {
      return lineDao.getline(order_no,seq);
   }

   //메일 보낼 유저 리스트
      public List<User> userList(String[] idchks) {
         // TODO Auto-generated method stub
         return adminDao.emailList(idchks);
      }


}