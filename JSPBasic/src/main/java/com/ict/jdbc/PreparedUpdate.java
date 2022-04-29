package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class PreparedUpdate {

	public static void main(String[] args) {
		// id, pw, name, email을 입력받아서
		// 특정 id인 계정의 pw, name, email을 입력받은 값으로 갱신하는
		// UPDATE 로직을 작성해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
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
			String idCheck = "SELECT * FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(idCheck);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("user_pw").equals(userPw)) {
					System.out.println("변경하실 비밀번호를 입력해주세요.");
					String userPassword = scan.nextLine();
					System.out.println("변경하실 이름을 입력해주세요.");
					String userName = scan.nextLine();
					System.out.println("변경하실 이메일을 입력해주세요.");
					String userEmail = scan.nextLine();
					
					String insert = "UPDATE userinfo SET user_pw = ?, user_name = ?, email = ? WHERE user_id = ?";
					pstmt = con.prepareStatement(insert);
					pstmt.setString(1, userPassword);
					pstmt.setString(2, userName);
					pstmt.setString(3, userEmail);
					pstmt.setString(4, userId);
					pstmt.executeUpdate();
					System.out.println("업데이트가 완료되었습니다.");
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
				}
			} else {
				System.out.println("아이디가 존재하지 않습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}

	}

}
