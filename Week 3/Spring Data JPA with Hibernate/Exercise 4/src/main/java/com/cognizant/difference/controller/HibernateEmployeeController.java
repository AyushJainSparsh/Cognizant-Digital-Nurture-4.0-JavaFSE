package com.cognizant.difference.controller;

import com.cognizant.difference.entity.Employee;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hibernate")
public class HibernateEmployeeController {
    @PersistenceContext
    private EntityManager entityManager;

    @PostMapping("/add")
    @Transactional
    public String addEmployee(@RequestBody Employee employee) {
        Session session = entityManager.unwrap(org.hibernate.SessionFactory.class).openSession();
        Transaction tx = null;
        Integer employeeID = null;

        try {
            tx = session.beginTransaction();
            employeeID = (Integer) session.save(employee);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            return "Error: " + e.getMessage();
        } finally {
            session.close();
        }
        return "Employee added with ID (Hibernate): " + employeeID;
    }
}

