package com.xskq.service;

import com.github.pagehelper.PageInfo;
import com.xskq.model.Admin;

import java.util.List;


public interface AdminService {
	int addAdmin(Admin admin);
	int delAdmin(int id);
	int updateAdmin(Admin admin);
	Admin selAdminById(int id);
	PageInfo<Admin> getAdminPageInfo(Admin admin, int pageNum, int pageSize);
	int selCount(Admin admin,int pagesize);
}
