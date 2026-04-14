   package com.example;

   import org.hibernate.Session;
   import org.hibernate.Transaction;
   import org.hibernate.query.Query;
   import java.util.List;

   public class UserDAO {

       public static boolean managerExists() {
           Transaction transaction = null;
           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();
               Long count = session.createQuery(
                       "SELECT COUNT(u.id) FROM User u WHERE lower(u.role) = :role",
                       Long.class
               ).setParameter("role", "manager").uniqueResult();
               transaction.commit();
               return count != null && count > 0;
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
               return true;
           }
       }

       public static boolean registerUser(String name, String email, String password, boolean requestManagerRole) {
           Transaction transaction = null;
           boolean isRegistered = false;

           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();

               Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
               query.setParameter("email", email);
               User existingUser = query.uniqueResult();

               if (existingUser != null) {
                   System.out.println("User already exists with email: " + email);
                   transaction.rollback();
                   return false;
               }

               String hashedPassword = PasswordUtil.hashPassword(password);
                   Query<Long> managerCountQuery = session.createQuery(
                       "SELECT COUNT(u.id) FROM User u WHERE lower(u.role) = :role",
                       Long.class
                   );
                   managerCountQuery.setParameter("role", "manager");
                   Long managerCount = managerCountQuery.uniqueResult();
                   boolean canCreateManager = managerCount == null || managerCount == 0;

                   String role = (requestManagerRole && canCreateManager) ? "MANAGER" : "EMPLOYEE";
                   User user = new User(name, email, hashedPassword, role);
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
               Query<User> query = session.createQuery("FROM User WHERE lower(role) = :role", User.class);
               query.setParameter("role", "employee");
               employees = query.getResultList();

               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           }
           return employees;
       }

       public static List<User> getAllUsers() {
           Transaction transaction = null;
           List<User> users = null;

           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();
               Query<User> query = session.createQuery("FROM User ORDER BY id ASC", User.class);
               users = query.getResultList();
               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
           }
           return users;
       }

       public static boolean promoteUserToManager(int userId) {
           Transaction transaction = null;
           try (Session session = HibernateUtil.getSessionFactory().openSession()) {
               transaction = session.beginTransaction();
               User user = session.get(User.class, userId);

               if (user == null) {
                   transaction.rollback();
                   return false;
               }

               if ("manager".equalsIgnoreCase(user.getRole())) {
                   transaction.commit();
                   return true;
               }

               user.setRole("MANAGER");
               session.merge(user);
               transaction.commit();
               return true;
           } catch (Exception e) {
               if (transaction != null) transaction.rollback();
               e.printStackTrace();
               return false;
           }
       }
   }
