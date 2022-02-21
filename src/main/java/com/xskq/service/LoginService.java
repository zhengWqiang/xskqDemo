package com.xskq.service;

import com.xskq.model.Admin;
import com.xskq.model.Student;
import com.xskq.model.Teacher;

/**
 * File：LoginService.java <br>
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 * Datetime: 2020/7/10 17:12
 *
 * @author zwq
 * @version 1.0
 */
public interface LoginService {

    Admin selectAdmin(Admin admin);

    Teacher selectTeacher(Teacher teacher);

    Student selectStudent(Student student);
}
