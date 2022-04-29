package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// Scanner로 삭제할 아이디를 입력받으면
		// DB에 삭제용 쿼리문을 날려주는 로직을 작성해주세요.
		// 삭제되었는지는 SELECT 코드나 혹은 Workbench를 이용해 확인해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("삭제할 아이디를 입력해주세요.");
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
					String delete = "DELETE FROM userinfo WHERE user_id = '" + userId + "';";
					stmt.executeUpdate(delete);
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
