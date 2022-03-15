package com.xskq.controller;

import com.xskq.model.Aop;
import com.xskq.service.AopService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 *
 * @author zwq
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/excel")
public class ExcelController {

    @Autowired
    private AopService aopservice;

    @RequestMapping(value = "/getExcelForAop")
    @ResponseBody
    public void getExcel(HttpServletResponse response, String name, String beginTime, String endTime,
                         String fileName) throws Exception {
        List<Aop> list = aopservice.getAop(name, beginTime, endTime);
        HSSFWorkbook workbook = aopservice.getExcel(name, beginTime, endTime);
        returnExcel(response, workbook, fileName);
    }

    private void returnExcel(HttpServletResponse response,HSSFWorkbook workbook,String fileName) throws IOException {
        String[] fileNames = fileName.split(",");
        OutputStream outputStream = response.getOutputStream();
        //response.reset();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename="+new String(fileNames[0].getBytes("gbk"), "iso8859-1")+".xls");
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        workbook.close();
    }
}
