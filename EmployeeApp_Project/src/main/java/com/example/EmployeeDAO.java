package com.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class EmployeeDAO {
    private static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public static boolean saveEmployee(Employee employee) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.save(employee);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public static Employee getEmployeeById(int id) {
        try (Session session = factory.openSession()) {
            return session.get(Employee.class, id);
        }
    }

    public static List<Employee> getAllEmployees() {
        try (Session session = factory.openSession()) {
            return session.createQuery("from Employee", Employee.class).list();
        }
    }

    public static Employee getEmployeeByEmail(String email) {
        if (email == null || email.isBlank()) {
            return null;
        }

        try (Session session = factory.openSession()) {
            Query<Employee> query = session.createQuery("FROM Employee WHERE lower(email) = :email", Employee.class);
            query.setParameter("email", email.trim().toLowerCase());
            return query.uniqueResult();
        }
    }

    public static boolean createEmployeeIfMissing(String name, String email) {
        if (name == null || name.isBlank() || email == null || email.isBlank()) {
            return false;
        }

        if (getEmployeeByEmail(email) != null) {
            return true;
        }

        Employee employee = new Employee();
        employee.setName(name.trim());
        employee.setEmail(email.trim());

        return saveEmployee(employee);
    }

    public static boolean deleteEmployee(int id) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            Employee emp = session.get(Employee.class, id);
            if (emp == null) {
                transaction.rollback();
                return false;
            }

            session.delete(emp);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateEmployee(Employee employee) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.update(employee);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

}
