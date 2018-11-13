package com.controller;

import com.entity.Emp;
import com.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private EmpService empService;
    @RequestMapping("/findByPage")
    public @ResponseBody Map<String, Object> findByPage(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();
        //当前总记录数
        List<Emp> emps = empService.queryByPage(page,rows);
        //当前总条数
        long totals = empService.allTotals();
        results.put("total",totals);
        results.put("rows",emps);
        return results;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object>  save(Emp emp){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            empService.save(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("/delete")
    public @ResponseBody void   delete(String id){
        //Map<String,Object> results=new HashMap<String, Object>();

            empService.delete(id);

    }
    @RequestMapping("/deleteMany")
    public @ResponseBody Map<String,Object>  deleteMany(String[] id){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            for(int i=0;i<id.length;i++){
                empService.delete(id[i]);
                System.out.println(id[i]);
            }
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object>  update(Emp emp){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            empService.update(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/findOne")
    public @ResponseBody Emp findOne(String id){
        Emp emp = empService.queryById(id);
        return emp;
    }
}
