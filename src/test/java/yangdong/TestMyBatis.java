package yangdong;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cn.yd.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class TestMyBatis {
	
	private static Logger logger = Logger.getLogger(TestMyBatis.class);  
	
	@Autowired  
	  private UserService userService;
	
	@Value("${driver}")  
	private String driver;
	
	 
//	 @Test  
//	  public void test1() {
//		 UserDto u=userService.selectById(1);
//		 System.out.println(u.getId()+"------"+u.getUserName()+"------"+u.getPassword()+"-----"+u.getAge()); 
//	 }
	 
//	 @Test
//	 public void createTest(){
//		 User user=new User();
//		 user.setUserName("yangdong7");
//		 user.setPassword("dongyang7");
//		 user.setAge(25);
//		 userService.create(user);
//		 
//	 }
	
//	@Test
//	public void redisTest(){
//		new RedisClient().show();
//	}
//	 
//	@Test
//	public void testDriver(){
//		System.out.println(driver+"--------------------------");
//	}
	
//	@Test
//	public void testJedis(){
//		Jedis j=new Jedis("192.168.117.128",6379);
//		j.auth("123456");
//		String s=j.get("name");
//		System.out.println("-----------------------------"+s);	
//	}
	
	@Test
	public void finallyOrRetuenTest(){
		String s=fr();
		System.out.println(s+"------------------------");
	}
	
	private String fr(){
		try{
			return "123";
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return "789";
		}
		
	}
	
	
	

}
