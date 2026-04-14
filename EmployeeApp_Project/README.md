# 👨‍💼 Employee Management System

A modern, role-based employee management web application built with Java 25 (LTS), Jakarta Servlets, JSP, and Hibernate. Managers can manage employee records with full CRUD operations, while employees can access their dashboards and manage their profiles.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
- [Building the Project](#building-the-project)
- [Running the Application](#running-the-application)
- [Database Configuration](#database-configuration)
- [API & Routes](#api--routes)
- [Security Features](#security-features)
- [Known Issues & Troubleshooting](#known-issues--troubleshooting)
- [Development Notes](#development-notes)

## 🚀 Features

### Authentication & Authorization
- ✅ Secure login and signup with password hashing (PBKDF2)
- ✅ Session-based authentication
- ✅ Role-based access control (Manager / Employee)
- ✅ Manager promotion system

### Role-Based Functionality
- **Managers:**
  - Add, update, and delete employee records
  - View all employees in the system
  - Promote employees to manager roles
  - Access manager dashboard with management tools

- **Employees:**
  - View personal employee record
  - Access employee dashboard
  - View other employees (readonly)
  - Manage own profile information

### User Interface
- 🎨 Modern, clean, and responsive design
- 📱 Mobile-friendly layout (works on tablets and phones)
- ✨ Centered hero sections and intuitive navigation
- 🌐 Professional UI with integrated styling

### Data Management
- 📊 Complete CRUD operations for employee records
- 📍 Address management with employee association
- 📅 Database-backed persistence
- 🔄 Real-time data synchronization

## 🛠️ Tech Stack

### Backend
- **Runtime:** Java 25 (LTS)
- **Web Framework:** Jakarta Servlet API 6.1.0 & JSP
- **ORM:** Hibernate 6.6.18 (JPA annotations)
- **Database:** H2 2.2.224 (embedded)
- **Build Tool:** Maven 3.9.14+
- **Application Server:** Apache Tomcat 11.0.18

### Frontend
- **Templates:** JSP (Java Server Pages)
- **Styling:** Custom CSS3 with responsive design
- **HTML:** HTML5
- **Scripting:** JavaScript (form validation, interactions)

### Security
- **Password Hashing:** PBKDF2 with random salt
- **Session Management:** Tomcat servlet sessions
- **Authorization Filter:** Request-level access control

## 📁 Project Structure

```
EmployeeApp_Project/
├── src/
│   ├── main/
│   │   ├── java/com/example/
│   │   │   ├── Employee.java              # JPA entity for employee data
│   │   │   ├── Address.java               # JPA entity for addresses
│   │   │   ├── User.java                  # JPA entity for users/authentication
│   │   │   ├── EmployeeDAO.java           # Data access object for employees
│   │   │   ├── UserDAO.java               # Data access object for users
│   │   │   ├── HibernateUtil.java         # Hibernate session factory wrapper
│   │   │   ├── PasswordUtil.java          # PBKDF2 password hashing utility
│   │   │   ├── AuthorizationFilter.java   # Request-level authorization filter
│   │   │   ├── LoginServlet.java          # Login request handler
│   │   │   ├── SignupServlet.java         # Registration handler
│   │   │   ├── EmployeeServlet.java       # Employee creation handler
│   │   │   ├── EmployeeListServlet.java   # List all employees
│   │   │   ├── EmployeeEditServlet.java   # Edit employee record
│   │   │   ├── EmployeeUpdateServlet.java # Update employee record
│   │   │   ├── EmployeeDeleteServlet.java # Delete employee record
│   │   │   └── [Other servlets...]        # Additional request handlers
│   │   ├── resources/
│   │   │   ├── hibernate.cfg.xml          # Hibernate configuration
│   │   │   └── META-INF/persistence.xml   # JPA persistence config
│   │   └── webapp/
│   │       ├── *.jsp                      # JSP templates (login, signup, dashboards, etc.)
│   │       ├── style.css                  # Main stylesheet (responsive design)
│   │       ├── WEB-INF/
│   │       │   ├── web.xml                # Servlet configuration
│   │       │   └── classes/               # Compiled classes (built by Maven)
│   │       └── META-INF/                  # Webapp metadata
│   └── test/                              # Test sources (if any)
├── target/                                # Build output directory
│   ├── ROOT.war                           # Deployable WAR package
│   ├── classes/                           # Compiled Java classes
│   └── [other build artifacts]
├── data/                                  # H2 database files (created at runtime)
│   └── employeeDB.mv.db                   # H2 embedded database file
├── pom.xml                                # Maven build configuration
├── README.md                              # This file
└── database.sql                           # MySQL schema reference (legacy)
```

## 📋 Prerequisites

### Required Software
- **Java 25 (LTS)** - [Download Eclipse Adoptium](https://adoptium.net/)
- **Maven 3.9.14+** - [Download Apache Maven](https://maven.apache.org/download.cgi)
- **Apache Tomcat 11.0.18** - [Download Tomcat](https://tomcat.apache.org/download-11.cgi)
- **Git** (optional, for cloning the repository)

### System Requirements
- OS: Windows 10+, macOS, or Linux
- RAM: 2GB minimum (4GB recommended)
- Disk Space: 500MB (for Java, Maven, and Tomcat installation)

### Verify Installation
```bash
java -version
mvn --version
```

## ⚙️ Setup & Installation

### 1. Clone or Download the Project
```bash
# Clone from repository (if using Git)
git clone https://github.com/yourname/Employee-Management-System.git
cd Employee-Management-System/EmployeeApp_Project
```

### 2. Install Java 25 LTS
1. Download from [Eclipse Adoptium](https://adoptium.net/installation/)
2. Install and set `JAVA_HOME` environment variable:
   - **Windows:** Add `C:\path\to\jdk-25` to `JAVA_HOME`
   - **macOS/Linux:** Add to `.bash_profile` or `.zshrc`:
     ```bash
     export JAVA_HOME=/path/to/jdk-25
     export PATH=$JAVA_HOME/bin:$PATH
     ```
3. Verify: `java -version`

### 3. Install Maven
1. Download from [Apache Maven](https://maven.apache.org/download.cgi)
2. Extract and add to `PATH`
3. Verify: `mvn --version`

### 4. Download & Configure Tomcat
1. Download Apache Tomcat 11.0.18
2. Extract to a known location (e.g., `C:\apache-tomcat-11.0.18`)
3. This will be referenced as `$TOMCAT_HOME` in build instructions

## 🏗️ Building the Project

### Build with Maven
```bash
cd /path/to/EmployeeApp_Project
mvn clean package -DskipTests
```

This creates `target/ROOT.war` (the deployable package).

### Build with Tests (if configured)
```bash
mvn clean package
```

## 🚀 Running the Application

### Step 1: Deploy the WAR File
1. Navigate to your Tomcat installation:
   ```bash
   cd $TOMCAT_HOME/webapps
   ```

2. Remove any existing deployments:
   ```bash
   rm -rf ROOT ROOT.war EmployeeApp*
   ```

3. Copy the build WAR to Tomcat:
   ```bash
   cp /path/to/EmployeeApp_Project/target/ROOT.war $TOMCAT_HOME/webapps/
   ```

### Step 2: Start Tomcat
```bash
# Windows
$TOMCAT_HOME\bin\startup.bat

# macOS/Linux
$TOMCAT_HOME/bin/startup.sh
```

Tomcat will automatically extract and deploy the WAR.

### Step 3: Access the Application
1. Open your browser
2. Navigate to: `http://localhost:8080/`
3. You should see the Employee Management System homepage

### Stop Tomcat
```bash
# Windows
$TOMCAT_HOME\bin\shutdown.bat

# macOS/Linux
$TOMCAT_HOME/bin/shutdown.sh
```

## 🗄️ Database Configuration

### H2 Database
The application uses H2, a lightweight embedded Java database that requires no prior setup.

**Why H2?**
- Zero configuration needed
- File-backed persistence
- Embedded in the application
- Perfect for local development and testing

### Database Location
- **File Path:** `{project-root}/EmployeeApp_Project/data/employeeDB.mv.db`
- **Created:** Automatically on first run
- **Connection:** `jdbc:h2:file:D:/path/to/EmployeeApp_Project/data/employeeDB;MODE=MySQL;DATABASE_TO_LOWER=TRUE`

### Hibernate Configuration
Located in `src/main/resources/hibernate.cfg.xml`:
- Database: H2 (file-based)
- Auto DDL: `update` (creates/updates tables automatically)
- Show SQL: `true` (logs all executed SQL)
- Session Context: `thread` (thread-scoped sessions)

## 🌐 API & Routes

### Public Routes (No Authentication Required)
- `GET /` - Landing page
- `GET /login.jsp` - Login page
- `POST /LoginServlet` - Process login
- `GET /signup.jsp` - Signup page
- `POST /SignupServlet` - Process registration

### Protected Routes (Authentication Required)

#### Employee Routes (All Authenticated Users)
- `GET /employeeDashboard.jsp` - Employee personal dashboard
- `GET /EmployeeListServlet` - View all employees
- `GET /employeeList.jsp` - Employees list page

#### Manager-Only Routes
- `GET /managerDashboard.jsp` - Manager dashboard
- `GET /employeeForm.jsp` - Add employee form
- `POST /EmployeeServlet` - Create new employee
- `GET /editEmployee.jsp` - Edit employee form
- `POST /EmployeeUpdateServlet` - Update employee
- `POST /EmployeeDeleteServlet` - Delete employee
- `GET /manageRoles.jsp` - Manage user roles
- `POST /PromoteManagerServlet` - Promote user to manager

#### Utility Routes
- `GET /logout.jsp` - Logout & session clearance
- `GET /success.jsp` - Success message page

## 🔐 Security Features

### Password Security
- **Hashing:** PBKDF2 (Password-Based Key Derivation Function 2)
- **Salt:** Random salt generated per password
- **Iterations:** Multiple iterations for brute-force resistance
- Implementation: `PasswordUtil.java`

### Session Management
- **Type:** HTTP session-based (Tomcat managed)
- **Storage:** Server-side session storage
- **Attributes:** User object stored in session
- **Authentication Filter:** `AuthorizationFilter.java` validates all requests

### Authorization
- **Role-Based:** Manager vs. Employee roles
- **Access Control:** Routes checked against user role
- **Promotion System:** Managers can promote employees

### Data Protection
- **Input Validation:** Form validation on signup/login
- **SQL Injection Prevention:** Hibernate parameterized queries (HQL)
- **CSRF Protection:** Session-based validation

## ⚠️ Known Issues & Troubleshooting

### Issue: Hibernate SessionFactory Initialization Fails
**Symptom:** `ExceptionInInitializerError: Hibernate initialization failed!`

**Possible Causes:**
1. H2 database file is locked by another process
2. Incorrect H2 file path in `hibernate.cfg.xml`
3. Hibernate configuration file not found in classpath

**Solutions:**
- Verify H2 file exists: Check `{project}/EmployeeApp_Project/data/employeeDB.mv.db`
- Kill any stale Tomcat processes: `taskkill /F /IM java.exe`
- Verify path in hibernat e.cfg.xml matches actual location
- Rebuild and redeploy: `mvn clean package`

### Issue: Port 8080 Already in Use
**Symptom:** Tomcat fails to start with "Address already in use" error

**Solution:**
```bash
# Windows - Find and kill process on port 8080
netstat -ano | findstr :8080
taskkill /F /PID <PID>

# macOS/Linux
lsof -i :8080
kill -9 <PID>
```

### Issue: Database File Not Accessible
**Symptom:** Authentication fails immediately after startup

**Solution:**
- Check file permissions on `data/` directory
- Ensure directory is writable: `chmod 755 data/`
- Run Tomcat with appropriate user privileges

## 💻 Development Notes

### Project Modernization
This project has been upgraded from earlier versions with the following improvements:

**Java Runtime:**
- Upgraded to Java 25 (LTS) for latest language features
- Uses modern modules and new APIs

**Web Framework:**
- Migrated to Jakarta EE (from legacy javax.*)
- Updated Servlet API to version 6.1.0
- Modern annotation-based servlet registration

**ORM:**
- Hibernate 6.6.18 with full JPA support
- Entity mapping with annotations
- Cascading relationships (Employee ↔ Address)

**Database:**
- Transitioned to H2 for simplified development
- Auto schema generation and updates
- File-backed persistence

**UI/UX:**
- Complete redesign with modern responsive layout
- Mobile-friendly interface
- Centered hero sections and focused card-based design

**Security:**
- Enhanced password hashing (PBKDF2)
- Role-based access control
- Authorization filter for centralized security

### Code Structure Best Practices
- **DAO Pattern:** Data access separated into dedicated DAO classes
- **Service Layer:** Business logic in DAOs
- **JSP Templating:** Clean separation of presentation
- **Servlet Controllers:** Request handling in dedicated servlets
- **Utility Classes:** Reusable components (PasswordUtil, HibernateUtil)

### Adding New Features
1. **Create Entity:** Add new JPA entity in `src/main/java/com/example/`
2. **Create DAO:** Add data access methods in a new DAO class
3. **Create Servlet:** Add request handler for the feature
4. **Update JSP:** Add UI templates in `webapp/`
5. **Update web.xml:** Register new servlet if needed
6. **Rebuild:** `mvn clean package`

## 📝 License

This project is developed as part of the Applied Internet Programming (AIP) course.

## 👥 Contributing

For issues, feature requests, or contributions, please follow standard Git workflow:
1. Create a feature branch
2. Make your changes
3. Test thoroughly
4. Submit a pull request

---

**Last Updated:** April 15, 2026