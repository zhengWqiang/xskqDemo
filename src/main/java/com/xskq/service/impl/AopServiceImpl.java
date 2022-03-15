package com.xskq.service.impl;

import com.xskq.dao.AopMapper;
import com.xskq.model.Aop;
import com.xskq.service.AopService;
import com.xskq.utils.DateUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 *
 * @author zwq
 * @version 1.0
 */
@Service
public class AopServiceImpl implements AopService {

    @Autowired
    private AopMapper aopMapper;

    @Override
    public int addAop(Aop aop) {
        return aopMapper.insert(aop);
    }

    @Override
    public List<Aop> getAop(String name, String beginTime, String endTime) {
        return aopMapper.getAop(name, beginTime, endTime);
    }

    @Override
    public HSSFWorkbook getExcel(String name, String beginTime, String endTime) {
        //创建Hssfworkbook对象（Excel的文档对象）
        HSSFWorkbook hw = new HSSFWorkbook();
        //建立新的sheet对象（Excel的表单）
        HSSFSheet sheet = hw.createSheet("日志列表");
        //在第一个sheet中创建第一行，参数为行索引（Excel的行），可是0~65535之间的任意一个
        HSSFRow row1 = sheet.createRow(0);
        //创建单元格（Excel得到单元格，参数为列索引，可以是0~255之间的任何一个）
        HSSFCell cell = row1.createCell(0);
        //水平居中
        cell.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //垂直居中
        cell.getCellStyle().setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //设置单元格内容
        cell.setCellValue("日志列表");
        //合并单元格CellRangeAddress构造函数依次表示起始行，截止行，起始列，截止列
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
        // 根据你数据里面的记录有多少列，就设置多少列
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(1, 2000);
        sheet.setColumnWidth(2, 5000);
        sheet.setColumnWidth(3, 10000);
        //创建第二行
        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("序号");
        row2.createCell(1).setCellValue("操作者");
        row2.createCell(2).setCellValue("时间");
        row2.createCell(3).setCellValue("事件");
        List<Aop> aoplist = aopMapper.getAop(name, beginTime, endTime);
        for (int i = 0; i < aoplist.size(); i++) {
            Aop a = aoplist.get(i);
            HSSFRow row = sheet.createRow(2 + i);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(a.getName());
            row.createCell(2).setCellValue(a.getDate());
            row.createCell(3).setCellValue(a.getEvent());
        }
        return hw;
    }
}
