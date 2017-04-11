
public class Ognl {
	public static boolean isNull(String whereParam){
		if(whereParam==null || "".equals(whereParam)){
			return false;
		}
		return true;
	}
	
}
