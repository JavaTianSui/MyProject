package com.tiansui.service;

import com.tiansui.dao.DepartmentMapper;
import com.tiansui.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService{
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public int insertDepartment(Department department) {
        return departmentMapper.insertDepartment(department);
    }

    @Override
    public List<Department> queryDepart() {
        return departmentMapper.queryDepart();
    }
}
