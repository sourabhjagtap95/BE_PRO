/*
	This is a java file for Calculator app, whose methods are native i.e they are defined in another language
	(here in C language)
*/
public class Example{
	private native void print();
	private native int read();
	private native int addition(int a,int b);
	private native int subtraction(int a,int b);
	private native float division(int a,int b);
	private native int multiplication(int a,int b);
	public static void main(String[] args){
		Example ex = new Example();
		int ch;
		int a,b;
		do{
		ex.print();
		ch = ex.read();
		switch(ch)
		{
			case 1: System.out.println("\nAddition:\n");
					System.out.println("Enter two numbers:\t");
					a = ex.read();
					b = ex.read();
					System.out.println("\nAddition of "+a+" and "+b+" is : "+ex.addition(a,b));
					break;
			case 2: System.out.println("\nSubtraction:\n");
					System.out.println("Enter two numbers:\t");
					a = ex.read();
					b = ex.read();
					System.out.println("\nSubtraction of "+a+" and "+b+" is : "+ex.subtraction(a,b));
					break;
			case 3: System.out.println("\nDivision:\n");
					System.out.println("Enter two numbers:\t");
					a = ex.read();
					b = ex.read();
					System.out.println("\nDivision of "+a+" and "+b+" is : "+ex.division(a,b));
					break;
			case 4: System.out.println("\nMultiplication:\n");
					System.out.println("Enter two numbers:\t");
					a = ex.read();
					b = ex.read();
					System.out.println("\nMultiplication of "+a+" and "+b+" is : "+ex.multiplication(a,b));
					break;

					
		}
			System.out.println("\nDo you want to continue ? (0/1) ");
			ch = ex.read();
		}while(ch!=0);
	}
	static {
		System.loadLibrary("hello");	//No need to give libhello.so in Linux
	}
}
