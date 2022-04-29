package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class PreparedDelete {

	public static void main(String[] args) {
		// 특정 아이디를 Scanner로 입력받아 입력받은 아이디를 삭제하는 로직을 작성해주세요.
		// PreparedStatement 형식으로 작성해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("삭제할 아이디를 입력해주세요.");
		String userId = scan.nextLine();
		System.out.println("비밀번호를 입력해주세요.");
		String userPw = scan.nextLine();
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "1111";
		
		try {
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sql = "SELECT * FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("user_pw").equals(userPw)) {
					String delete = "DELETE FROM userinfo WHERE user_id = ?";
					pstmt = con.prepareStatement(delete);
					pstmt.setString(1, userId);
					pstmt.executeUpdate();
					System.out.println("아이디가 삭제되었습니다.");
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
				}
			} else {
				System.out.println("존재하지 않는 아이디입니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}

	}

}
