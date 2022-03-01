package com.xskq.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xskq.dao.AdminMapper;
import com.xskq.model.Admin;
import com.xskq.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public int addAdmin(Admin admin) {
        return adminMapper.insert(admin);
    }

    @Override
    public int delAdmin(int id) {
        return adminMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminMapper.updateByPrimaryKey(admin);
    }

    @Override
    public Admin selAdminById(int id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Admin> getAdminPageInfo(Admin admin, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Admin> adminList = adminMapper.getAdmin(admin);
        return new PageInfo<>(adminList);
    }

    @Override
    public int selCount(Admin admin, int pagesize) {
        int rscount = adminMapper.selCount(admin);
        int pagecount = (rscount + pagesize - 1) / pagesize;
        return pagecount;
    }

}
