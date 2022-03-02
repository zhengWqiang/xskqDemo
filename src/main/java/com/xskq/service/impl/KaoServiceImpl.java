package com.xskq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xskq.dao.KaoMapper;
import com.xskq.model.Kao;
import com.xskq.model.KaoExt;
import com.xskq.service.KaoService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
@Service
public class KaoServiceImpl implements KaoService {

    @Autowired
    KaoMapper kaoMapper;

    @Override
    public int addKao(Kao k) {
        return kaoMapper.insert(k);
    }

    @Override
    public int delKao(int kaoid) {
        return kaoMapper.deleteByPrimaryKey(kaoid);
    }

    @Override
    public int updateKao(Kao k) {
        return kaoMapper.updateByPrimaryKeySelective(k);
    }

    @Override
    public Kao selKaoById(int kaoid) {
        return kaoMapper.selectByPrimaryKey(kaoid);
    }

    @Override
    public PageInfo<KaoExt> getPageKao(KaoExt k, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<KaoExt> adminList = kaoMapper.getKao(k);
        return new PageInfo<>(adminList);
    }

    @Override
    public List<KaoExt> getKao(KaoExt k) {
        List<KaoExt> adminList = kaoMapper.getKao(k);
        return adminList;
    }

    @Override
    public int selCount(KaoExt k, int pagesize) {
        int rscount = kaoMapper.selectCount(k);
        if (pagesize == 0) {
            return rscount;
        } else {
            return (rscount + pagesize - 1) / pagesize;
        }
    }

    @Override
    public PageInfo<Kao> getPageKaoByUser(Kao k, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Kao> adminList = kaoMapper.getKaoByUser(k);
        return new PageInfo<>(adminList);
    }

    @Override
    public int selCountByNumber(Kao k, int pagesize) {
        int rscount = kaoMapper.selCountByNumber(k);
        return (rscount + pagesize - 1) / pagesize;
    }

    @Override
    public HSSFWorkbook getExcel(KaoExt k) {
        //创建Hssfworkbook对象（Excel的文档对象）
        HSSFWorkbook hw = new HSSFWorkbook();
        //建立新的sheet对象（Excel的表单）
        HSSFSheet sheet = hw.createSheet("学生考勤表");
        //在第一个sheet中创建第一行，参数为行索引（Excel的行），可是0~65535之间的任意一个
        HSSFRow row1 = sheet.createRow(0);
        //创建单元格（Excel得到单元格，参数为列索引，可以是0~255之间的任何一个）
        HSSFCell cell = row1.createCell(0);
        //水平居中
        cell.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //垂直居中
        cell.getCellStyle().setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //设置单元格内容
        cell.setCellValue("学生考勤表");
        //合并单元格CellRangeAddress构造函数依次表示起始行，截止行，起始列，截止列
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
        // 根据你数据里面的记录有多少列，就设置多少列
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(1, 3000);
        sheet.setColumnWidth(2, 2000);
        sheet.setColumnWidth(3, 2300);
        sheet.setColumnWidth(4, 4000);
        sheet.setColumnWidth(5, 3000);
        sheet.setColumnWidth(6, 3000);
        //创建第二行
        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("序号");
        row2.createCell(1).setCellValue("学号");
        row2.createCell(2).setCellValue("姓名");
        row2.createCell(3).setCellValue("班级");
        row2.createCell(4).setCellValue("课程");
        row2.createCell(5).setCellValue("入学日期");
        row2.createCell(6).setCellValue("是否缺勤");
        List<KaoExt> kaolist = kaoMapper.getKao(k);
        for (int i = 0; i < kaolist.size(); i++) {
            KaoExt kao = kaolist.get(i);
            HSSFRow row = sheet.createRow(2 + i);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(kao.getStunumber());
            row.createCell(2).setCellValue(kao.getStuname());
            row.createCell(3).setCellValue(kao.getBanji());
            row.createCell(4).setCellValue(kao.getCourseName());
            row.createCell(5).setCellValue(kao.getAdate());
            row.createCell(6).setCellValue(kao.getQin());
        }
        return hw;
    }

    @Override
    public HSSFWorkbook getExcel1(KaoExt k) {
        //创建Hssfworkbook对象（Excel的文档对象）
        HSSFWorkbook hw = new HSSFWorkbook();
        //建立新的sheet对象（Excel的表单）
        HSSFSheet sheet = hw.createSheet("学生考勤统计表");
        //在第一个sheet中创建第一行，参数为行索引（Excel的行），可是0~65535之间的任意一个
        HSSFRow row1 = sheet.createRow(0);
        //创建单元格（Excel得到单元格，参数为列索引，可以是0~255之间的任何一个）
        HSSFCell cell = row1.createCell(0);
        //水平居中
        cell.getCellStyle().setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //垂直居中
        cell.getCellStyle().setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //设置单元格内容
        cell.setCellValue("学生考勤统计表");
        //合并单元格CellRangeAddress构造函数依次表示起始行，截止行，起始列，截止列
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
        // 根据你数据里面的记录有多少列，就设置多少列
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(1, 3000);
        sheet.setColumnWidth(2, 2000);
        sheet.setColumnWidth(3, 2300);
        sheet.setColumnWidth(4, 2000);
        //创建第二行
        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("序号");
        row2.createCell(1).setCellValue("学号");
        row2.createCell(2).setCellValue("姓名");
        row2.createCell(3).setCellValue("班级");
        row2.createCell(4).setCellValue("缺勤次数");
        List<Kao> kaolist = kaoMapper.getKaoByUser(k);
        for (int i = 0; i < kaolist.size(); i++) {
            Kao kao = kaolist.get(i);
            HSSFRow row = sheet.createRow(2 + i);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(kao.getStunumber());
            row.createCell(2).setCellValue(kao.getStuname());
            row.createCell(3).setCellValue(kao.getBanji());
            row.createCell(4).setCellValue(kao.getSid());
        }
        return hw;
    }

    @Override
    public List<Map<String, Object>> getNumberByName(String name) {
        return kaoMapper.getNumberByName(name);
    }

    @Override
    public List<Map<String, Object>> getNumberByBanji() {
        return kaoMapper.getNumberByBanji();
    }
}
