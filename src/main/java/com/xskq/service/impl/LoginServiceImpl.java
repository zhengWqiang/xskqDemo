package com.xskq.service.impl;

import com.xskq.dao.AdminMapper;
import com.xskq.dao.StudentMapper;
import com.xskq.dao.TeacherMapper;
import com.xskq.model.Admin;
import com.xskq.model.Student;
import com.xskq.model.Teacher;
import com.xskq.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * File：LoginServiceImpl.java <br>
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 * Datetime: 2020/7/10 17:13
 *
 * @author zwq
 * @version 1.0
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Admin selectAdmin(Admin admin) {
        return adminMapper.selectAdmin(admin);
    }

    @Override
    public Teacher selectTeacher(Teacher teacher) {
        return teacherMapper.selectTeacher(teacher);
    }

    @Override
    public Student selectStudent(Student student) {
        return studentMapper.selectStudent(student);
    }
}
