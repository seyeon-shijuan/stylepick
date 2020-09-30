package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Reply;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	public List<Board> list(int seq) {
		List<Board> list = template.getMapper(BoardMapper.class).list(seq);
		int i = 1;
		for (Board b : list) {
			b.setCount(i++);
		}
		return list;
	}

	public List<Board> qnalist(String stat, String author, String admin) {
		param.put("stat", stat);
		param.put("author", author);
		param.put("admin", admin);
		
		List<Board> list = template.getMapper(BoardMapper.class).qnalist(param);
		int i = 1;
		for (Board b : list) {
			b.setCount(i++);
			if (b.getStat().equals("complete")) {
				b.setStat("답변완료");
			} else {
				b.setStat("처리중");
			}
		}
		return list;
	}
	
	public List<Board> faqlist(String category) {
		param.put("category", category);
		List<Board> list = template.getMapper(BoardMapper.class).faqlist(param);
		int i = 1;
		for (Board b : list) {
			b.setCount(i++);
		}
		return list;
	}

	public void readcnt(Integer no) {
		param.clear();
		param.put("no", no);
		template.getMapper(BoardMapper.class).readcnt(param);
	}

	public Board selectOne(Integer no) {
		return template.getMapper(BoardMapper.class).selectOne(no);
	}

	public int maxno() {
		return template.getMapper(BoardMapper.class).maxno();
	}

	public void insert(Board board) {
		template.getMapper(BoardMapper.class).insert(board);
	}

	public List<String> categoryList() {
		return template.getMapper(BoardMapper.class).clist();
	}

	public void delete(int no) {
		template.getMapper(BoardMapper.class).delete(no);
	}

	public List<Reply> replyList(Integer no) {
		return template.getMapper(BoardMapper.class).rlist(no);
	}

	public void regReply(Reply reply) {
		template.getMapper(BoardMapper.class).rinsert(reply);
	}

	public int maxrno() {
		return template.getMapper(BoardMapper.class).maxrno();
	}

	public void statComplete(int bno) {
		template.getMapper(BoardMapper.class).updateStatComplete(bno);
	}

	public void update(Board board) {
		template.getMapper(BoardMapper.class).update(board);
	}

}
