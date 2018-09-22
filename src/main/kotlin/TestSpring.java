import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import top.macaulish.PLS.dao.TaskDao;


public class TestSpring {
    ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
    private static Logger logger = LoggerFactory.getLogger(TestSpring.class);
    @Test
    public void testHibernate(){
        System.out.println("hello world");
        TaskDao taskDao = (TaskDao) context.getBean("taskDao");
        logger.info(taskDao.queryTask("6a2b8aa3-a239-4b44-ae8d-fd14f7d5061f").getTaskname());
    }

}

