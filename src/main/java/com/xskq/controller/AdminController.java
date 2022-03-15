package com.xskq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xskq.model.Admin;
import com.xskq.model.Aop;
import com.xskq.service.AdminService;
import com.xskq.service.AopService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    private AopService aopservice;

    @RequestMapping(value = "/goAop")
    public ModelAndView goIndex() {
        return new ModelAndView("admin/aop");
    }

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

    @RequestMapping(value = "/getAdminById")
    @ResponseBody
    public void getAdminById(Admin admin) {
        Admin a = service.selAdminById(admin.getId());
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("admin", a);
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

    @RequestMapping(value = "/getList")
    @ResponseBody
    public void getList(Admin admin) {
        int pageSize = 10;
        int pageNum = 1;
        int pagecount = service.selCount(admin, pageSize);
        PageInfo<Admin> adminlist = service.getAdminPageInfo(admin, pageNum, pageSize);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("adminlist", adminlist);
        session.setAttribute("pageindex", pageNum);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("admin", admin);
    }

    //todo 入参中的map会通过org.springframework.web.servlet.DispatcherServlet一层层匹配到ModelAndView中
    @RequestMapping(value = "/getAopList1")
    @ResponseBody
    public ModelAndView getAopList1(String name, Integer currentPage, String beginTime, String endTime,
                                    Map<String, Object> map) {
        int pageSize = 10;
        if (currentPage == null) {
            currentPage = 1;
        }
        PageHelper.startPage(currentPage, pageSize);
        List<Aop> aopList = aopservice.getAop(name, beginTime, endTime);
        PageInfo<Aop> aopPageInfo = new PageInfo<>(aopList);
        /*mv.addObject("aopPageInfo", aopPageInfo);
        mv.addObject("beginTime", beginTime);
        mv.addObject("endTime", endTime);
        mv.addObject("name", name);
        mv.setViewName("admin/aop");
        return mv*/
        map.put("aopPageInfo", aopPageInfo);
        map.put("beginTime", beginTime);
        map.put("endTime", endTime);
        map.put("name", name);
        return new ModelAndView("admin/aop1");
    }

    @RequestMapping(value = "/getAopList")
    @ResponseBody
    public Object getAopList(String name, Integer currentPage, String beginTime, String endTime) {
        int pageSize = 10;
        if (currentPage == null) {
            currentPage = 1;
        }
        PageHelper.startPage(currentPage, pageSize);
        List<Aop> aopList = aopservice.getAop(name, beginTime, endTime);
        PageInfo<Aop> aopPageInfo = new PageInfo<>(aopList);
        /*mv.addObject("aopPageInfo", aopPageInfo);
        mv.addObject("beginTime", beginTime);
        mv.addObject("endTime", endTime);
        mv.addObject("name", name);
        mv.setViewName("admin/aop");
        return mv*/
        Map<String, Object> map = new HashMap<>();
        map.put("aopPageInfo", aopPageInfo);
        map.put("beginTime", beginTime);
        map.put("endTime", endTime);
        map.put("name", name);
        return map;
    }

    @RequestMapping(value = "/getExcel")
    @ResponseBody
    public void getExcel(HttpServletResponse response, String name, String beginTime, String endTime,
                         String fileName) throws Exception {
        HSSFWorkbook workbook = aopservice.getExcel(name, beginTime, endTime);
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + new String(fileName.getBytes(), "iso8859-1") + ".xls");
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        workbook.close();
    }
}
