package com.xskq.controller;

import com.github.pagehelper.PageInfo;
import com.xskq.model.DataGrid;
import com.xskq.model.Kao;
import com.xskq.model.KaoExt;
import com.xskq.service.KaoService;
import org.apache.commons.collections4.MapUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@RequestMapping("/kao")
public class KaoController {

    @Autowired
    KaoService kaoService;

    public HttpSession getSession() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public String getDownloadFileName() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd ");
        String downloadFileName = (sf.format(new Date()).toString())+"考勤统计表.xls";
        try {
            downloadFileName = new String(downloadFileName.getBytes(),"ISO8859-1");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return downloadFileName;
    }

    @RequestMapping(value = "/doAdd")
    @ResponseBody
    public void doAdd(Kao kao){
        kaoService.addKao(kao);
    }

    @RequestMapping(value = "/doDel")
    @ResponseBody
    public void doDel(Kao kao){
        kaoService.delKao(kao.getKaoid());
    }

    @RequestMapping(value = "/doList")
    @ResponseBody
    public void doList(KaoExt kao){
        int pageSize = 10;
        int pageindex = 1;
        int pagecount = kaoService.selCount(kao, pageSize);
        PageInfo<KaoExt> kaolist = kaoService.getPageKao(kao, pageindex, pageSize);
        HttpSession session = getSession();
        session.setAttribute("kaolist", kaolist);
        session.setAttribute("pageindex", pageindex);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("kao", kao);
    }

    @RequestMapping(value = "/doMlist")
    @ResponseBody
    public void doMlist(KaoExt kao){
        HttpSession session = getSession();
        String name = (String) session.getAttribute("user");
        kao.setStuname(name);
        //kao.setCourse(c);
        int pageSize = 10;
        int pageindex = 1;
        int pagecount = kaoService.selCount(kao, pageSize);
        PageInfo<KaoExt> kaolist = kaoService.getPageKao(kao, pageindex, pageSize);
        session.setAttribute("kaolist", kaolist);
        session.setAttribute("pageindex", pageindex);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("kao", kao);
    }

    @RequestMapping(value = "/doClist")
    @ResponseBody
    public void doClist(KaoExt kao){
        //k.setCourse(c);
        int pageSize = 10;
        int pageindex = 1;
        int pagecount = kaoService.selCountByNumber(kao, pageSize);
        PageInfo<Kao> kaolist = kaoService.getPageKaoByUser(kao, pageindex, pageSize);
        HttpSession session = getSession();
        session.setAttribute("kaolist", kaolist);
        session.setAttribute("pageindex", pageindex);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("kao", kao);
    }

    @RequestMapping(value = "/doClist")
    @ResponseBody
    public void getShow(KaoExt kao){
        //k.setCourse(c);
        int pageSize = 10;
        int pageindex = 1;
        int pagecount = kaoService.selCount(kao, pageSize);
        PageInfo<KaoExt> kaolist = kaoService.getPageKao(kao, pageindex, pageSize);
        HttpSession session = getSession();
        session.setAttribute("kaolist", kaolist);
        session.setAttribute("pageindex", pageindex);
        session.setAttribute("pagecount", pagecount);
        session.setAttribute("kao", kao);
        session.setAttribute("name", kao.getStuname());
    }

    @RequestMapping(value = "/getExcel")
    @ResponseBody
    public void getExcel(KaoExt kao) throws Exception {
        //k.setCourse(c);
        HSSFWorkbook workbook = kaoService.getExcel(kao);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        workbook.write(output);
        byte[] ba = output.toByteArray();
        InputStream excelFile = new ByteArrayInputStream(ba);
        output.flush();
        output.close();
    }

    @RequestMapping(value = "/getExcel1")
    @ResponseBody
    public void getExcel1(KaoExt kao) throws Exception {
        HSSFWorkbook workbook = kaoService.getExcel1(kao);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        workbook.write(output);
        byte[] ba = output.toByteArray();
        InputStream excelFile = new ByteArrayInputStream(ba);
        output.flush();
        output.close();
    }

    @RequestMapping(value = "/getJsonHistogram")
    @ResponseBody
    public String getJsonHistogram() {
        HttpSession session = getSession();
        String name = (String) session.getAttribute("name");
        List<Map<String, Object>> list = kaoService.getNumberByName(name);
        DataGrid dataGrid = new DataGrid();
        List<String> typelist = new ArrayList<String>();
        List<java.math.BigInteger> numberlist = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            typelist.add(MapUtils.getString(map, "coursename"));
            numberlist.add(new BigInteger(MapUtils.getString(map, "number")));
        }
        dataGrid.setTypename(typelist);
        dataGrid.setNumber(numberlist);
        return null;
    }

    @RequestMapping(value = "/getJsonQuery")
    @ResponseBody
    public String getJsonQuery(KaoExt kao) {
        //k.setCourse(c);
        HttpSession session = getSession();
        String name = (String) session.getAttribute("name");
        kao.setStuname(name);
        List<KaoExt> kaolist = kaoService.getKao(kao);
        List<Kao> list = new ArrayList<>();
        for (Kao k : kaolist) {
            Kao ko = new Kao();
            ko.setStunumber(k.getStunumber());
            ko.setStuname(k.getStuname());
            ko.setBanji(k.getBanji());
            ko.setAdate(k.getAdate());
            ko.setQin(k.getQin());
//            Course course = new Course();
//            course.setCoursename(k.getCourse().getCoursename());
//            ko.setCourse(course);
            list.add(ko);
            DataGrid dataGrid = new DataGrid();
            dataGrid.setTypename(list);
        }
        return null;
    }

    @RequestMapping(value = "/getJsonHistogram1")
    @ResponseBody
    public String getJsonHistogram1() {
        List<Map<String, Object>> list = kaoService.getNumberByBanji();
        DataGrid dataGrid = new DataGrid();
        List<String> typelist = new ArrayList<String>();
        List<java.math.BigInteger> numberlist = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            typelist.add(MapUtils.getString(map, "banji"));
            numberlist.add(new BigInteger(MapUtils.getString(map, "number")));
        }
        dataGrid.setTypename(typelist);
        dataGrid.setNumber(numberlist);
        return null;
    }

    @RequestMapping(value = "/getJsonQuery1")
    @ResponseBody
    public String getJsonQuery1(KaoExt kao) {
        List<KaoExt> kaolist = kaoService.getKao(kao);
        List<Kao> list = new ArrayList<>();
        for (Kao k : kaolist) {
            Kao ko = new Kao();
            ko.setStunumber(k.getStunumber());
            ko.setStuname(k.getStuname());
            ko.setBanji(k.getBanji());
            ko.setAdate(k.getAdate());
            ko.setQin(k.getQin());
            /*Course course = new Course();
            course.setCoursename(k.getCourse().getCoursename());
            ko.setCourse(course);*/
            list.add(ko);
            DataGrid dataGrid = new DataGrid();
            dataGrid.setTypename(list);
        }
        return null;
    }
}
