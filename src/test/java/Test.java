
public class Test {
	static{
		int x=5;
	}
	static int x,y;
	
	public static void main(String args[]){
		System.out.println(x+"---1");
		System.out.println(y+"---1");
		x--;
		System.out.println(x+"---2");
		myMethod();
		System.out.println(x+y+ ++x);
	}
	
	public static void myMethod(){
		System.out.println(x+"---3");
		System.out.println(y+"---3");
		y=x++ + ++x;
		System.out.println(x+"---4");
		System.out.println(y+"---4");
	}
}
