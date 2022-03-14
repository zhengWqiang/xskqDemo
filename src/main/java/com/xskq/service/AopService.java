package com.xskq.service;

import com.xskq.model.Aop;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.Date;
import java.util.List;

public interface AopService {
	int addAop(Aop aop);
	List<Aop> getAop(String name, String beginTime, String endTime);
	HSSFWorkbook getExcel(String name, String beginTime, String endTime);
}
