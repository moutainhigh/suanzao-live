package live.task;

import com.longlian.mq.task.CdnLogTask;
import live.process.SeriesCourseTimeTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by liuhan on 2017-11-08.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class CdnLogTaskTest {
    private static Logger log = LoggerFactory.getLogger(SeriesCourseTimeTest.class);

    @Autowired
    private CdnLogTask cdnLogTask;


    @Test
    public void testDoJob() throws Exception {
        cdnLogTask.doJob();
    }
}
