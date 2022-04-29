package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		// 스캐너를 이용해서
		// 수정할 아이디, 해당아이디에 대한 새로운 비번, 새로운 이름, 새로운 이메일을 입력받아 주시면 됩니다.
		// DB연동 후 쿼리문을 날려서 수정로직을 돌려주신 다음
		// Workbench를 이용해 수정된 내역이 반영되었는지 확인해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
		String userId = scan.nextLine();
		System.out.println("비밀번호를 입력해주세요.");
		String userPw = scan.nextLine();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC", "root", "1111");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE user_id = '" + userId + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				if (rs.getString("user_pw").equals(userPw)) {
					System.out.println("변경하실 비밀번호를 입력해주세요.");
					String userPassword = scan.nextLine();
					
					System.out.println("변경하실 이메일을 입력해주세요.");
					String userEmail = scan.nextLine();
					
					System.out.println("변경하실 이름을 입력해주세요.");
					String userName = scan.nextLine();
					
					String update = "UPDATE userinfo SET user_pw = '" + userPassword
													+ "', user_name = '" + userName
													+ "', email = '" + userEmail
													+ "' WHERE user_id = '" + userId + "';";
					stmt.executeUpdate(update);
					System.out.println("회원정보의 수정이 완료되었습니다.");
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
