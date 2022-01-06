import com.tiansui.dao.DepartmentMapper;
import com.tiansui.dao.EmployeeMapper;
import com.tiansui.pojo.Department;
import com.tiansui.pojo.Employee;
import com.tiansui.service.EmployeeService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicacontext.xml"})
public class MyTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employee;

    @Autowired
    EmployeeService service;

    @Autowired
    SqlSession sqlSession;
    @Test
    public void insert(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicacontext.xml");
//        DepartmentMapper mapper = context.getBean(DepartmentMapper.class);
        System.out.println(departmentMapper);
//        departmentMapper.insertDepartment(new Department("开发部"));
//        departmentMapper.insertDepartment(new Department("开发部"));

        //2,生成员工数据，测试员工插入

        //employee.insertSelective(new Employee(null,"jerry","M","jerry@pl.com",1));

        //3.批量插入
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);

        for (int i=0;i<500;i++){
            String name = UUID.randomUUID().toString().substring(0,5)+i;
//            mapper.insertSelective(new Employee(null,name,"M",name+"@qq.com",1));
        }
        System.out.println("批量插入员工数据成功!");

    }

    @Test
    public void query(){
        List<Employee> employees = employee.queryAll();
        for (Employee employee1 : employees) {
            System.out.println(employee1.getDepartment().getDaptName());
        }
    }
    @Test
    public void queryDepart(){
        List<Department> depart = departmentMapper.queryDepart();
        for (Department department : depart) {
            System.out.println(department.getDaptName());
        }
    }

    @Test
    public void queryName(){
        int list = employee.queryByName("天岁");
//        System.out.println(list);
        boolean f = service.queryByName("天岁");
        System.out.println(f);
    }

    @Test
    public void delete(){
//        int i = employee.deleteEmp(300);
//        System.out.println(i+"删除成功!");
        List<Integer> list = new ArrayList<>();
        String ids = "499-500-501";
        String[] split = ids.split("-");
        for (String s : split) {
            int i = Integer.parseInt(s);
            list.add(i);
        }
        int i = employee.deleteBatch(list);
        System.out.println(i+"删除成功!");
    }
}
