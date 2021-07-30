package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BlackDto;
import mybatis.config.DBService;

public class BlackDao {

	// 필드: SqlSessionFactory
	// 모든 메소드는 factory에서 SqlSession을 생성하고
	// SqlSession으로 DB 처리를 한다.
	
	private SqlSessionFactory factory;
	
	// Dao는 항상 Singleton 처리한다.
	private BlackDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BlackDao blackDao = new BlackDao();
	public static BlackDao getInstance() {
		return blackDao;
	}
	
	
	// DB처리 메소드
	public List<BlackDto> list() {  
		SqlSession ss = factory.openSession();
		
		// mapper의 namespace(mybatis.mapper.black), id(blackList)
		List<BlackDto> list = ss.selectList("mybatis.mapper.black.blackList");
		ss.close();
		
		return list;
	}
	
	
	
	
}