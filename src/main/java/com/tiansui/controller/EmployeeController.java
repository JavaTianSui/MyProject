package com.tiansui.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tiansui.pojo.Employee;
import com.tiansui.pojo.Msg;
import com.tiansui.service.EmployeeService;
import jdk.nashorn.internal.runtime.regexp.joni.exception.InternalException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/staff")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    public String getAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Employee> emp = employeeService.queryAll();

        PageInfo<Employee> pageInfo = new PageInfo<>(emp);

        model.addAttribute("list",pageInfo);

        return "list";
    }
    @RequestMapping("/emps1")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Employee> emp = employeeService.queryAll();

        PageInfo<Employee> pageInfo = new PageInfo<>(emp);

        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 员工保存
     * @return
     */
    @RequestMapping(value = "/emps1",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmployee(Employee employee){
        employeeService.insertSelective(employee);

        return Msg.success();
    }

    /**
     *
     * @param empName
     * @return true:用户名可用 false:用户名不可用
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkName(@RequestParam("empName") String empName){
        boolean f = employeeService.queryByName(empName);
        System.out.println(empName);
        System.out.println(f);
        if (f){
            return Msg.success();
        }else {
            return Msg.fail();
        }

    }

    /**
     *单个-批量删除二合一
     * ids:1-2-3
     * split函数的用法
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delete(@PathVariable("id") String ids){
        List<Integer> list = new ArrayList<>();
        if (ids.contains("-")){
            String[] split = ids.split("-");
            for (String s : split) {
                int i = Integer.parseInt(s);
                list.add(i);
            }
            employeeService.deleteBatch(list);

        }else {
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }
}
