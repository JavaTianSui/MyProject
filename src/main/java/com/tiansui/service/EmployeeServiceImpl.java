package com.tiansui.service;

import com.tiansui.dao.EmployeeMapper;
import com.tiansui.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public int insertSelective(Employee employee) {
        return employeeMapper.insertSelective(employee);
    }

    @Override
    public int insert(Employee employee) {
        return employeeMapper.insert(employee);
    }

    @Override
    public List<Employee> queryAll() {
        return employeeMapper.queryAll();
    }

    @Override
    public Boolean queryByName(String empName) {
       // boolean f = true;
        if (employeeMapper.queryByName(empName)==0){
            return true;
        }else {
            return false;
        }
        //return null;
    }

    @Override
    public int deleteEmp(int empId) {
        return employeeMapper.deleteEmp(empId);
    }

    @Override
    public int deleteBatch(List<Integer> list) {
        return employeeMapper.deleteBatch(list);
    }
}
