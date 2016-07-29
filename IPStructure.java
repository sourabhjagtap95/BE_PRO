public class IPStructure{
	private native void print(int version);
	private native int read();
	public static void main(String[] args){

		IPStructure ip = new IPStructure();
		int ch = ip.read();

		switch(ch)
		{
			case 1: ip.print(4);
							break;
		  case 2: ip.print(6);
							break;

		}
	}
	static {
		System.loadLibrary("ip");
	}

}
