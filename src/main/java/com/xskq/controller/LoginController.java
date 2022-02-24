package com.xskq.controller;

import com.alibaba.fastjson.JSON;
import com.xskq.model.Admin;
import com.xskq.model.Student;
import com.xskq.model.Teacher;
import com.xskq.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * File：LoginController.java <br>
 * Title: <br>
 * Description: <br>
 * Company: <br>
 * Datetime: 2020/7/10 16:41
 *
 * @author zwq
 * @version 1.0
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/goIndex")
    public ModelAndView goIndex(String userJson) {
        Map<String, Object> map = JSON.parseObject(userJson);
        ModelAndView mv = new ModelAndView("index/index");
        mv.addObject("id", map.get("id"));
        mv.addObject("username", map.get("username"));
        mv.addObject("user", map.get("user"));
        mv.addObject("type", map.get("type"));
        return mv;
    }

    /**
     * @param username
     * @param userpwd
     * @param type     1：管理员，2：老师，3：学生
     * @return
     */
    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public Object doLogin(String username, String userpwd, Short type) {
        String warn;
        Map<String, Object> map = new HashMap<>();
        if (type == 1) {
            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setUserpw(userpwd);
            Admin a = loginService.selectAdmin(admin);
            if (a != null) {
                map.put("id", a.getId());
                map.put("username", a.getUsername());
                map.put("user", a.getUsername());
                map.put("type", "管理员");
            } else {
                warn = "用户名或密码错误";
                map.put("warn", warn);
            }
        } else if (type == 2) {
            Teacher teacher = new Teacher();
            teacher.setNumber(username);
            teacher.setPassword(userpwd);
            Teacher t = loginService.selectTeacher(teacher);
            if (t != null) {
                map.put("id", t.getId());
                map.put("username", t.getNumber());
                map.put("user", t.getName());
                map.put("type", "老师");
                return map;
            } else {
                warn = "用户名或密码错误";
                map.put("warn", warn);
            }
        } else {
            Student student = new Student();
            student.setNumber(username);
            student.setPassword(userpwd);
            Student s = loginService.selectStudent(student);
            if (s != null) {
                map.put("id", s.getId());
                map.put("username", s.getNumber());
                map.put("user", s.getName());
                map.put("type", "学生");
            } else {
                warn = "用户名或密码错误";
                map.put("warn", warn);
            }
        }
        return map;
    }
}
