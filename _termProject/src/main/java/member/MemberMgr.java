package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class MemberMgr {
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mem";
	String username = "root";
	String password = "123456";

	public MemberMgr() {
		try {
			Class.forName(driverName);
		}catch(Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}
	
	
	//회원가입__(signup_process.jsp와 연동)
	public boolean insertMember(MemberBean bean) {
		boolean flag = false;
		String sql = null;
		Connection conn = null;
		PreparedStatement prestm = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
			sql = "insert into member(id, pwd, name, birthday, email) values (?, ?, ?, ?, ?)";
			
			prestm = conn.prepareStatement(sql);
			
			prestm.setString(1, bean.getId());
		    prestm.setString(2, bean.getPwd());
		    prestm.setString(3, bean.getName());
		    prestm.setString(4, bean.getBirthday());
		    prestm.setString(5, bean.getEmail());

			int count = prestm.executeUpdate();
			if (count == 1) flag = true;
			
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			try {
				prestm.close();
			} catch (SQLException e) {	}
			try {
				conn.close();
			} catch (SQLException e) {	}
		}
		return flag;
	}
	
	
	//회원목록보기__(membersList.jsp와 연동)
	public Vector<MemberBean> getMembersList(){
		Connection conn = null;
		Statement sm = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<MemberBean> vectorList = new Vector<MemberBean>();

		try {
			conn = DriverManager.getConnection(url, username, password);
			sql = "select * from member";
			sm = conn.createStatement();
			rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				vectorList.addElement(bean);
				
			}
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {	}
			try {
				sm.close();
			} catch (SQLException e) {	}
			try {
				conn.close();
			} catch (SQLException e) {	}
		}
		return vectorList;
	}
	
	
	//회원수정__(updateMember.jsp와 연동)
	public boolean updateMember(MemberBean bean) {
		boolean flag = false;
		String sql = null;
		Connection conn = null;
		PreparedStatement prestm = null;
		
		try {
	        conn = DriverManager.getConnection(url, username, password);

	        sql = "update member set pwd = ?, name = ?, birthday = ?, email = ? where id = ?";
	        prestm = conn.prepareStatement(sql);

	        prestm.setString(1, bean.getPwd());
	        prestm.setString(2, bean.getName());
	        prestm.setString(3, bean.getBirthday());
	        prestm.setString(4, bean.getEmail());
	        prestm.setString(5, bean.getId());

	        int count = prestm.executeUpdate();
	        if (count == 1) flag = true;

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            prestm.close();
	        } catch (SQLException e) {}
	        try {
	            conn.close();
	        } catch (SQLException e) {}
	    }

		return flag;
	}
		
	
	//회원정보 불러오기__(update_process.jsp와 연동)
	public MemberBean getMember(String userId) {
		MemberBean bean= null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement prestm = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
			sql = "select * from member where id = ?";
			prestm = conn.prepareStatement(sql);
			prestm.setString(1, userId);
			rs = prestm.executeQuery();
			if ( rs.next()) {
				bean= new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
			}
		}catch(Exception e) {
			System.out.println("Exception" + e);	
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {	}
			try {
				prestm.close();
			} catch (SQLException e) {	}
			try {
				conn.close();
			} catch (SQLException e) {	}
		}
		
		return bean;
		
	}
	
	//회원탈퇴__(withdraw_process.jsp와 연동)
	public boolean withdrawMember(String userId) {
		boolean flag = false;
		String sql = null;
		Connection conn = null;
		PreparedStatement prestm = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
			sql = "delete from member where id=?";
			prestm = conn.prepareStatement(sql);
			prestm.setString(1, userId);
			int count = prestm.executeUpdate();
			if ( count == 1) flag = true;
			
		}catch(Exception e) {
			System.out.println("Exception" + e);
		}finally {
			try {
				prestm.close();
			} catch (SQLException e) {	}
			try {
				conn.close();
			} catch (SQLException e) {	}
		}
		return flag;
	}
}
