<%@ page import="jakarta.servlet.http.HttpSession"%>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null) {
        sessionObj.invalidate();
    }
    response.sendRedirect("login.jsp?msg=Logged out successfully!");
%>