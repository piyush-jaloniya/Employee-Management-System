   package com.example;

   import org.hibernate.Session;
   import org.hibernate.Transaction;
   import org.hibernate.query.Query;
   import java.util.List;

   public class UserDAO {

       public static boolean registerUser(String name, String email, String password, String role) {
           Transaction transaction = null;
           boolean isRegistered = false;

           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();

               Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
               query.setParameter("email", email);
               User existingUser = query.uniqueResult();

               if (existingUser != null) {
                   System.out.println("User already exists with email: " + email);
                   return false;
               }

               User user = new User(name, email, password, role);
               session.persist(user);

               transaction.commit();
               isRegistered = true;
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           }
           return isRegistered;
       }

       public static User getUserByEmail(String email) {
           Transaction transaction = null;
           User user = null;
           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();
               user = session.createQuery("FROM User WHERE email = :email", User.class)
                             .setParameter("email", email)
                             .uniqueResult();
               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           }
           return user;
       }

       public static List<User> getAllEmployees() {
           Transaction transaction = null;
           List<User> employees = null;

           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();
               Query<User> query = session.createQuery("FROM User WHERE role = :role", User.class);
               query.setParameter("role", "employee");
               employees = query.getResultList();

               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           }
           return employees;
       }
   }
