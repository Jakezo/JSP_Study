package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.WhiteDto;
import mybatis.config.DBService;

public class WhiteDao {

	private SqlSessionFactory factory;

	private WhiteDao() {
		factory = DBService.getInstance().getFactory();
	}
	
	private static WhiteDao whiteDao = new WhiteDao();
	 
	public static WhiteDao getInsetance() {
		return whiteDao;
	}
	
	public List<WhiteDto> list() {
		SqlSession ss = factory.openSession();
		List<WhiteDto> list = ss.selectList("mybatis.mapper.white.getList");
		ss.close();
		
		return list;
	}
	
	public List<WhiteDto> titleList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> title = ss.selectList("mybatis.mapper.white.getTitle", query);
		ss.close();
		
		return title;
	}
	
	public List<WhiteDto> contentList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> content = ss.selectList("mybatis.mapper.white.getContent", query);
		ss.close();
		
		return content;
	}
	
	public List<WhiteDto> bothList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> content = ss.selectList("mybatis.mapper.white.getBoth", query);
		ss.close();
		
		return content;
	}
	
}
