package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class PreparedInsert {

	public static void main(String[] args) {
		// insert구문을 구현해보세요.
		// Scanner로 id, pw, name, email을 입력받아서
		// INSERT 구문의 ?를 채워주시면 됩니다.
		// ?가 네 개이므로 주의해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
		String userId = scan.nextLine();
		System.out.println("비밀번호를 입력해주세요.");
		String userPw = scan.nextLine();
		System.out.println("이름을 입력해주세요.");
		String userName = scan.nextLine();
		System.out.println("이메일을 입력해주세요.");
		String userEmail = scan.nextLine();
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "1111";
		
		try {
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String idCheck = "SELECT * FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(idCheck);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("중복된 아이디입니다.");
			} else {
				String insert = "INSERT INTO userinfo VALUES (?, ?, ?, ?)";
				pstmt = con.prepareStatement(insert);
				pstmt.setString(1, userId);
				pstmt.setString(2, userPw);
				pstmt.setString(3, userName);
				pstmt.setString(4, userEmail);
				pstmt.executeUpdate();
				System.out.println("DB에 정보가 추가되었습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}

}
