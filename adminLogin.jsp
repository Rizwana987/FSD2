<%@ page import="java.sql.*" %>
<%
    String adminUsername = request.getParameter("adminUsername");
    String adminPassword = request.getParameter("adminPassword");

    // Hardcoded admin credentials (Replace this with database verification if needed)
    String validAdminUsername = "Admin@123";
    String validAdminPassword = "admin123";  // Change as per your actual password

    if (adminUsername.equals(validAdminUsername) && adminPassword.equals(validAdminPassword)) {
        // Set admin session
        session.setAttribute("username", "Admin@123");  
        response.sendRedirect("adminDashboard.jsp"); // Redirect to admin dashboard
    } else {
%>
        <script>
            alert("Invalid Admin Credentials! Try Again.");
            window.location.href = "adminLogin.html";
        </script>
<%
    }
%>
