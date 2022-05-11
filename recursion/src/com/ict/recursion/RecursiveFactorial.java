package com.ict.recursion;

public class RecursiveFactorial {
	
	public static int factorial(int num) {
		
		if (num == 1) {
			return 1;
		}
		
		return num * factorial(num - 1);
		
	}

	public static void main(String[] args) {
		
		System.out.println(factorial(6));

	}

}
