import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import top.macaulish.PLS.dao.TestDao;


public class TestSpring {
    ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
    TestDao testDao = context.getBean("testDao",TestDao.class);

    @Test
    public void testHibernate(){
        System.out.println("hello world");
        testDao.addUser();

    }

}

