package com.ict.datastructure;

public class NodeMain {

	public static void main(String[] args) {
		
		Node n1 = new Node();
		Node n2 = new Node();
		Node n3 = new Node();
		Node n4 = new Node();
		Node n5 = new Node();
		n1.data = 100;
		n1.next = n2;
		n1.prev = null;
		n2.data = 200;
		n2.next = n3;
		n2.prev = n1;
		n3.data = 300;
		n3.next = n4;
		n3.prev = n2;
		n4.data = 400;
		n4.next = n5;
		n4.prev = n3;
		n5.data = 500;
		n5.next = null;
		n5.prev = n4;
		
		Node start = n1;
		System.out.println(start.next.prev.next.prev.data);
		// 메세지 큐, 래빗mq, 카프카 (태스크가 많이 쌓이는 프로그램을 다룰때 큐를 잘써야한다.)
	}

}
