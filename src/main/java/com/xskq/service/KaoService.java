package com.xskq.service;

import com.github.pagehelper.PageInfo;
import com.xskq.model.Kao;
import com.xskq.model.KaoExt;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;
import java.util.Map;

public interface KaoService {
	int addKao(Kao k);
	int delKao(int kaoid);
	int updateKao(Kao k);
	Kao selKaoById(int kaoid);
	PageInfo<KaoExt> getPageKao(KaoExt k, int pageIndex, int pageSize);
	List<KaoExt> getKao(KaoExt k);
	int selCount(KaoExt k, int pagesize);
	PageInfo<Kao> getPageKaoByUser(Kao k, int pageIndex, int pageSize);
	int selCountByNumber(Kao k, int pagesize);
	HSSFWorkbook getExcel(KaoExt k);
	HSSFWorkbook getExcel1(KaoExt k);
	List<Map<String, Object>> getNumberByName(String name);
	List<Map<String, Object>> getNumberByBanji();
}
