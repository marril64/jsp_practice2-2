package com.ict.datastructure;

import java.util.Arrays;

public class IntArray {
	
	static int scount = 0; // 시작 카운트
	static int count = 0; // 끝 카운트
	
	// 데이터 넣는 메서드
	public static void addArr(int num, int[] arr) {
		
		if (count > 4) {
			System.out.println("데이터를 추가로 넣을 수 없습니다.");
		} else {
			arr[count] = num;
			count++;
		}
		
		System.out.println("현재 리스트 내에 자료가 " + count + "개 있습니다.");
		
	}
	
	// 데이터 빼는 메서드 removeArr();
	// 빼는 메서드를 실행하면 count-1해서 하나 내리고 그 자리를 0으로 만듭니다.
	// count -1 이 -1이면 삭제할 데이터가 없습니다 라고 띄우고, count를 0인채로 유지합니다.
	public static void removeArr(int[] arr) {
		
		if (count == 0) {
			System.out.println("더이상 삭제할 자료가 없습니다.");
		} else {
			count--;
			arr[count] = 0;
		}
		
		System.out.println("현재 리스트 내에 자료가 " + count + "개 있습니다.");
		
	}
	
	public static void removeFirstArr(int[] arr) { // 미완성
		
		if (scount == count) {
			System.out.println("Front와 Rear가 같은 위치입니다!");
		} else {
			arr[scount] = 0;
			scount++;
		}
	}
	
	// 내장된 데이터가 몇갠지 파악해주는 기능이 없습니다.
	// getArrLength(int[] arr); 를 이용해 배열이 몇개인지 콘솔에 띄워주도록 작성해주세요.
	public static int getArrLength(int[] arr) {
		
		int cnt = 0;
		
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != 0) {
				cnt++;
			}
		}
		
		return cnt;
		
	}

	public static void main(String[] args) {
		int[] iArr = new int[5];
		System.out.println(Arrays.toString(iArr));
		addArr(10, iArr);
		addArr(3, iArr);
		addArr(4, iArr);
		addArr(5, iArr);
		addArr(6, iArr);
		addArr(7, iArr);
		System.out.println(Arrays.toString(iArr));
		System.out.println(iArr.length);
		removeArr(iArr);
		removeArr(iArr);
		removeArr(iArr);
		removeArr(iArr);
		removeArr(iArr);
		removeArr(iArr);
		removeArr(iArr);
		System.out.println(getArrLength(iArr));

	}

}
