package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BlueDto;


public class BlueDao {
	//필드
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
//그동안 사용하던 DriverManager 클래스를 사용하지 않는다.(jdbc??)
//--> getConnection() 메소드를 만들어서 사용하지 않는다.
	
//DBCP는 더이상 connection을 DataSource 클래스가 관리한다.
//앞으로는 DataSoruce 객체가 제공하는 getConnection()메소드를 사용한다.

	//DataSource 객체 만들기 (BlueDao에서의 새로운 작업!)
	private static DataSource dataSource;
	//static {} //static 블록: static 필드의 초기화를 할 수 있음
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			//Tomcat의 경우 java:comp/env/  를 prefix값으로 사용한다.. (ㄴ앞에 붙여줘야 함)
			//Context.xml의 <resource>태그의 name속성이 jdbc/oracle이다.
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	//Singleton pattern
	private BlueDao() {}
	private static BlueDao blueDao = new BlueDao(); //밑에껄 쓰려고 이거도 static 처리를 해준다..
	public static BlueDao getInstance() { //getInstance를 밖에서 쓰려고 static을 붙이고
		return blueDao;
	}
	
	//메소드
	/* --------1. 접속 종료 ---------- */
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) {rs.close(); }
			if(ps != null) {ps.close(); }
			if(con != null) {con.close(); }
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/* --------2. 목록 가져오기 ---------- */
	public ArrayList<BlueDto> list() { //ArrayList에는 BlueDto가 여러개 들어있음.
		ArrayList<BlueDto> list = new ArrayList<BlueDto>();
		try {
			con = dataSource.getConnection();
			sql = "SELECT NO, WRITER, TITLE, CONTENT, FILENAME, POSTDATE FROM BLUE"; //*는 성능을 떨어트리는 요인이 될 수 있어서 쓰지 않음..
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//rs.next() -> BlueDto -> list.add() 작업하기
			while(rs.next()) { //rs.next() 결과가 있으면..(결과가 없으면 중단
				BlueDto blueDto = new BlueDto();
				blueDto.setNo(rs.getInt("NO")); //rs.getInt(1) 과 동일
				blueDto.setWriter(rs.getString("WRITER"));
				blueDto.setTitle(rs.getString("TITLE"));
				blueDto.setContent(rs.getString("CONTENT"));
				blueDto.setFilename(rs.getString("FILENAME"));
				blueDto.setPostDate(rs.getDate("POSTDATE"));
				list.add(blueDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return list;
	}//2 list

	/* --------3. 게시글 삽입하기 ---------- */
	public int insert(BlueDto blueDto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO BLUE VALUES (BLUE_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, blueDto.getWriter());
			ps.setString(2, blueDto.getTitle());
			ps.setString(3, blueDto.getContent());
			ps.setString(4, blueDto.getFilename());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		return result;
	}
	/* --------4. 게시글 가져오기 ---------- */
	public BlueDto view(int no) {
		BlueDto blueDto = null; //no가 0일 때..\
		try {
			con = dataSource.getConnection();
			sql = "SELECT NO, WRITER, TITLE, CONTENT, FILENAME, POSTDATE FROM BLUE WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				blueDto = new BlueDto();
				blueDto.setNo(no); //blueDto.setNo(rs.getInt("NO"));
				blueDto.setWriter(rs.getString("WRITER"));
				blueDto.setTitle(rs.getString("TITLE"));
				blueDto.setContent(rs.getString("CONTENT"));
				blueDto.setFilename(rs.getString("FILENAME"));
				blueDto.setPostDate(rs.getDate("POSTDATE"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		
		return blueDto;
	}
	/* --------5. 게시글 삭제하기 ---------- */
	public int delete(int no) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "DELETE FROM BLUE WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		
		return result;
	}
	/* --------6. 게시글 수정하기 ---------- */
	public int update(BlueDto blueDto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "UPDATE BLUE SET TITLE = ?, CONTENT = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, blueDto.getTitle());
			ps.setString(2, blueDto.getContent());
			ps.setInt(3, blueDto.getNo());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
}//end
