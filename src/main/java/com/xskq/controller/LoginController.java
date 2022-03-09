package com.xskq.controller;

import com.xskq.model.Admin;
import com.xskq.model.Student;
import com.xskq.model.Teacher;
import com.xskq.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public ModelAndView goIndex() {
        ModelAndView mv = new ModelAndView("index/index");
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
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        if (type == 1) {
            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setUserPw(userpwd);
            Admin a = loginService.selectAdmin(admin);
            if (a != null) {
                session.setAttribute("id", a.getId());
                session.setAttribute("username", a.getUsername());
                session.setAttribute("user", a.getUsername());
                session.setAttribute("type", "管理员");
                session.setAttribute("code", a.getId() + a.getUsername());
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
                session.setAttribute("id", t.getId());
                session.setAttribute("username", t.getNumber());
                session.setAttribute("user", t.getName());
                session.setAttribute("type", "老师");
                session.setAttribute("code", t.getNumber() + t.getName());
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
                session.setAttribute("id", s.getId());
                session.setAttribute("username", s.getNumber());
                session.setAttribute("user", s.getName());
                session.setAttribute("type", "学生");
                session.setAttribute("code", s.getNumber() + s.getName());
            } else {
                warn = "用户名或密码错误";
                map.put("warn", warn);
            }
        }
        return map;
    }

    /**
     * @param username
     * @param userpwd
     * @param type     1：管理员，2：老师，3：学生
     * @return
     */
    @RequestMapping(value = "/doLogin1")
    @ResponseBody
    public ModelAndView doLogin1(String username, String userpwd, Short type) {
        ModelAndView mv = new ModelAndView();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        if (type == 1) {
            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setUserPw(userpwd);
            Admin a = loginService.selectAdmin(admin);
            if (a != null) {
                session.setAttribute("id", a.getId());
                session.setAttribute("username", a.getUsername());
                session.setAttribute("user", a.getUsername());
                session.setAttribute("type", "管理员");
                session.setAttribute("code", a.getId() + a.getUsername());
                mv.setViewName("index/index");
            } else {
                mv.addObject("warn", "用户名或密码错误");
                mv.setViewName("/login1");
            }
        } else if (type == 2) {
            Teacher teacher = new Teacher();
            teacher.setNumber(username);
            teacher.setPassword(userpwd);
            Teacher t = loginService.selectTeacher(teacher);
            if (t != null) {
                session.setAttribute("id", t.getId());
                session.setAttribute("username", t.getNumber());
                session.setAttribute("user", t.getName());
                session.setAttribute("type", "老师");
                session.setAttribute("code", t.getNumber() + t.getName());
                mv.setViewName("index/index");
            } else {
                mv.addObject("warn", "用户名或密码错误");
                mv.setViewName("/login1");
            }
        } else {
            Student student = new Student();
            student.setNumber(username);
            student.setPassword(userpwd);
            Student s = loginService.selectStudent(student);
            if (s != null) {
                session.setAttribute("id", s.getId());
                session.setAttribute("username", s.getNumber());
                session.setAttribute("user", s.getName());
                session.setAttribute("type", "学生");
                session.setAttribute("code", s.getNumber() + s.getName());
                mv.setViewName("index/index");
            } else {
                mv.addObject("warn", "用户名或密码错误");
                mv.setViewName("/login1");
            }
        }
        return mv;
    }
}
