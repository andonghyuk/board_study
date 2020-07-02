package test;

public class ExceptionTest {
	static void test(){
		String numStr = "1.1";
		
		try {
			int num = Integer.parseInt(numStr);
		}catch(Exception e) {
			System.out.println("왜 숫자가... 아니냐?");
		}
	}
	public static void main(String[] args) {
		test();
	}
}
