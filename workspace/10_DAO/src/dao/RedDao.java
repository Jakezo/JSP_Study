package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.RedDto;

// DAO: Database Access Object
// 데이터베이스 처리를 담당하는 클래스

public class RedDao {

	// 필드
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	// 생성자 (Singleton Pattern)
	// 1. RedDao 클래스 내부에서만 new RedDao()를 허용해서 외부에서는 RedDao를 생성할 수 없다.
	// 2. RedDao 클래스 내부에서 1개의 인스턴스를 생성한다.
	// 3. 생성된 인스턴스를 가져다 사용할 수 있는 메소드(getInstance)를 생성한다.
	private RedDao() {}
	private static RedDao redDao = new RedDao();
	public static RedDao getInstance() {  // new RedDao() 없이(객체,인스턴스 없이) 호출할 수 있도록 클래스메소드로 만든다. (static)
		return redDao;  // 클래스메소드는 static만 포함할 수 있다. 따라서 redDao 역시 static 처리한다.
	}
	
	// 메소드 (CRUD)
	
	/***** 1. 접속 *****/
	public Connection getConnection() {
		try {
			// 접속정보 준비
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "spring";
			String password = "1111";
			// jdbc(OracleDriver) 준비
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 접속
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/***** 2. 접속해제 *****/
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/***** 접속(Connection)은 무조건 메소드마다 열고 닫는다. *****/	
	
	
	/***** 3. 삽입하기 *****/
	public int insert(RedDto redDto) {
		int result = 0;
		try {
			// id, pw, name, age, email 찍어보기
			System.out.println(redDto.getId());
			System.out.println(redDto.getPw());
			System.out.println(redDto.getName());
			System.out.println(redDto.getAge());
			System.out.println(redDto.getEmail());
			// 접속
			con = getConnection();
			// **수동 커밋 처리 방법(한 번만 해 봅시다.)
			con.setAutoCommit(false);
			// 미리 sql 준비
			sql = "INSERT INTO RED VALUES (RED_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
			// ps: SQL 전달 및 실행 담당
			// ps에게 SQL 전달
			ps = con.prepareStatement(sql);
			// 변수(?) 채우기
			ps.setString(1, redDto.getId());  // 1번째 ?에 아이디 채우기
			ps.setString(2, redDto.getPw());
			ps.setString(3,  redDto.getName());
			ps.setInt(4, redDto.getAge());
			ps.setString(5, redDto.getEmail());
			// SQL 실행
			result = ps.executeUpdate();  // insert, update, delete 모두 사용
			// **커밋은 성공했을 때 실시
			if (result == 1) {
				con.commit();  // 수동으로 직접 커밋
			}
		} catch (Exception e) {
			// **catch 블록은 실패하면 도착
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			// 접속해제
			// ResultSet이 없는 경우는 insert, update, delete문 처리할 때
			close(con, ps, null);
		}
		return result;
	}
	
	
	/***** 4. 전체 목록 *****/
	public ArrayList<RedDto> list() {
		ArrayList<RedDto> list = new ArrayList<RedDto>();
		try {
			con = getConnection();
			sql = "SELECT * FROM RED";
			ps = con.prepareStatement(sql);
			// SQL 실행: select문은 executeQuery(), 반환타입은 ResultSet
			rs = ps.executeQuery();
			// ResultSet은 그냥 사용할 수 없다.
			// ResultSet -> ArrayList<RedDto>
			// rs.next()는 ResultSet에 저장된 데이터 한 개
			// rs.next()를 통해서 얻어낸 rs는 RedDto 한 개를 의미한다.
			while (rs.next()) {
				RedDto redDto = new RedDto();
				// rs -> redDto
				redDto.setNo(rs.getInt("NO"));
				redDto.setId(rs.getString("ID"));
				redDto.setPw(rs.getString("PW"));
				redDto.setName(rs.getString("NAME"));
				redDto.setAge(rs.getInt("AGE"));
				redDto.setEmail(rs.getString("EMAIL"));
				redDto.setRegDate(rs.getDate("REGDATE"));
				// redDto -> ArrayList에 추가
				list.add(redDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	/***** 5. 아이디 중복 체크 *****/
	public boolean idCheck(String id) {
		boolean result = false;
		try {
			con = getConnection();
			sql = "SELECT ID FROM RED WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if ( !rs.next() ) {  // 검색결과가 없으면 해당 아이디를 가진 회원이 없다.
				result = true;
			}
			// result = !rs.next();  // if문 없이 그냥 이렇게 하면 됩니다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return result;
	}
	
	/***** 6. 회원 정보 가져오기 *****/
	public RedDto view(int no) {
		
		RedDto redDto = null;
		
		try {
			con = getConnection();	// 연결
			sql = "SELECT * FROM RED WHERE NO = ?";	// 쿼리문
			ps = con.prepareStatement(sql);	// 쿼리문 준비
			ps.setInt(1, no);	// 첫번째 ?에 no값 넣기
			rs = ps.executeQuery();	// 실행, Select문 전용 메소드 executeQuery
			// rs는 꼭 next()를 해야 데이터를 빼서 사용할 수 있음, 처리를 안 할시 결과값이 안 나옴
			
			if (rs.next()) {
				redDto = new RedDto();
				redDto.setNo(rs.getInt("NO")); // redDto.setNo(rs.getInt(1));
				redDto.setId(rs.getString("ID"));	//redDto.setId(rs.getNString("2"));
				redDto.setPw(rs.getString("PW"));
				redDto.setName(rs.getString("NAME"));
				redDto.setAge(rs.getInt("AGE"));
				redDto.setEmail(rs.getString("EMAIL"));
				redDto.setRegDate(rs.getDate("REGDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// select문 3개의 파라미터 
			close(con, ps, rs);
			
			// 접속해제
			// ResultSet이 없는 경우는 insert, update, delete문 처리할 때
			// rs 값은  null
			// close(con, ps, null);
		}
		
		return redDto;
	}
	
	/***** 7. 회원 정보 수정하기 *****/
	public int update(RedDto redDto) {
		
		int result = 0;
		try {
			con = getConnection();
			sql = "UPDATE RED SET NAME = ?, AGE = ?, EMAIL = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, redDto.getName());
			ps.setInt(2, redDto.getAge());
			ps.setString(3, redDto.getEmail());
			ps.setInt(4, redDto.getNo());
			
			result = ps.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	/***** 8. 비밀번호 변경하기 *****/
	public int updatePw(RedDto redDto) {
		
		int result = 0;
		try {
			con = getConnection();
			sql = "UPDATE RED SET PW = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, redDto.getPw());
			ps.setInt(2, redDto.getNo());
			
			result = ps.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	/***** 9. 계정 삭제하기 *****/
	public int delete(int no) {
		int result = 0;
		try {
			con = getConnection();
			sql = "DELETE FROM RED WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	
	}
	
}
