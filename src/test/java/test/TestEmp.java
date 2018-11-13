package test;

import com.entity.Emp;
import com.service.EmpService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;


public class TestEmp extends BasicTest{
    @Autowired
    private EmpService empService;
    @Test
    public void test1(){
        Emp emp = new Emp();
        emp.setName("小黄");
        emp.setAge(16);
        emp.setBir(new Date());
        emp.setAddress("北京市朝阳区");
        empService.save(emp);
    }
    @Test
    public void test2(){
        List<Emp> emps = empService.queryByPage(1, 2);
        for(Emp emp:emps){
            System.out.println(emp);
        }
    }
    @Test
    public void test3(){
        long allTotals = empService.allTotals();
        System.out.println(allTotals);
    }
    @Test
    public void test4(){
        empService.delete("bbd746ff-dfa4-40b9-a5e6-e6b70557f74e");
    }
    @Test
    public void update(){
        Emp emp = new Emp();
        emp.setId("5e856867-af4d-4e47-b220-42c5c2e40de0");
        emp.setName("Rose");
        emp.setBir(new Date());
        emp.setAge(20);
        emp.setAddress("北京市海淀区");
        empService.update(emp);
    }
    @Test
    public void test5(){
        Emp emp = empService.queryById("7633f2d1-cd5e-43a9-a2d7-0dc2c998d7be");
        System.out.println(emp);
    }

}
