package com.ict.recursion;

public class RecursionBasic {
	
	public static void recursive(int num) {
		
		System.out.println("recursive : " + num);
		
		if (num == 0) {
			return; // 코드를 종료시킬 구간
		}
		
		recursive(num - 1); // 자기자신을 부르는 구간, 값이 변하는 구간
		
	}

	public static void main(String[] args) {
		
		recursive(5);
		
	}

}
