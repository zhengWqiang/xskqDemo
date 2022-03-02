package com.xskq.controller;

import com.github.pagehelper.PageInfo;
import com.xskq.model.Admin;
import com.xskq.model.Aop;
import com.xskq.service.AdminService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 *
 * @author zwq
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService service;
    @Autowired
    //private AopService aopservice;

    public String getDownloadFileName() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd ");
        String downloadFileName = (sf.format(new Date()).toString()) + "日志信息.xls";
        try {
            downloadFileName = new String(downloadFileName.getBytes(), "ISO8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return downloadFileName;
    }

    @RequestMapping(value = "/doAdd")
    @ResponseBody
    public void doAdd(Admin admin) {
        int result = service.addAdmin(admin);
    }

    @RequestMapping(value = "/doDel")
    @ResponseBody
    public void doDel(Admin admin) {
        int result = service.delAdmin(admin.getId());
    }

    @RequestMapping(value = "/toEdit")
    @ResponseBody
    public void toEdit(Admin admin) {
        Admin a = service.selAdminById(admin.getId());
    }

    @RequestMapping(value = "/doEdit")
    @ResponseBody
    public void doEdit(Admin admin) {
        int result = service.updateAdmin(admin);
    }

    @RequestMapping(value = "/doModify")
    @ResponseBody
    public Object doModify(Integer adminId, String userPw1, String userPw3) {
        Map<String, Object> map = new HashMap<>();
        Admin a = service.selAdminById(adminId);
        if (a.getUserPw().equals(userPw1)) {
            a.setUserPw(userPw3);
            service.updateAdmin(a);
        } else {
            map.put("error", "原密码错误");
        }
        return map;
    }

    @RequestMapping(value = "/doList")
    @ResponseBody
    public void doList(Admin admin) {
        int pageSize = 10;
        int pageNum = 1;
        int pagecount = service.selCount(admin, pageSize);
        System.out.println("pageindex:" + pageNum);
        PageInfo<Admin> adminlist = service.getAdminPageInfo(admin, pageNum, pageSize);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("adminlist", adminlist);
        session.setAttribute("pageindex", pageNum);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("admin", admin);
    }

    @RequestMapping(value = "/doAopList")
    @ResponseBody
    public void doAopList(Aop aop, String begintime, String endtime) {
        /*int pagesize = 10;
        int page = 1;
        int pagecount = aopservice.selCount(aop, pagesize, begintime, endtime);
        List<Aop> aoplist = aopservice.selAop(aop, page, pagesize, begintime, endtime);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("aoplist", aoplist);
        session.setAttribute("pageindex", page);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("aop", aop);
        session.setAttribute("begintime", begintime);
        session.setAttribute("endtime", endtime);*/
    }

    @RequestMapping(value = "/getExcel")
    @ResponseBody
    public void getExcel(Aop aop, String begintime, String endtime) throws Exception {
        /*HSSFWorkbook workbook = aopservice.getExcel(aop, begintime, endtime);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        workbook.write(output);
        byte[] ba = output.toByteArray();
        InputStream excelFile = new ByteArrayInputStream(ba);
        output.flush();
        output.close();*/
    }
}
