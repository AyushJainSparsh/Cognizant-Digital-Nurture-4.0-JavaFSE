package com.cognizant.difference.controller;

import com.cognizant.difference.entity.Employee;
import com.cognizant.difference.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/springdata")
public class SpringDataEmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @PostMapping("/add")
    public String addEmployee(@RequestBody Employee employee) {
        Employee saved = employeeService.addEmployee(employee);
        return "Employee added with ID (Spring Data JPA): " + saved.getId();
    }
}

