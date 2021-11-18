package jspbook.ch04;

public class Calculator {
	public int process(int n) {
//		return n * n * n;
		int result = 1;
		for(int i=1;i<=n;i++) {
			result *= i;
		}
		return result;
	}
}
