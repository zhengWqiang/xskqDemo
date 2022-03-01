package com.sxkq.test;

import com.xskq.dao.AdminMapper;
import com.xskq.model.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 *
 * @author zwq
 * @version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class test {

    @Autowired
    private AdminMapper adminMapper;

    @Test
    public void test() {
        System.out.println("进来了");
        List<Admin> admins = adminMapper.getAdmin(null);
        for (Admin admin : admins) {
            System.out.println(admin.getUsername());
        }
    }
}
