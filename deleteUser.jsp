<%@ page import="java.sql.*" %>
<%
    // Get username from request
    String username = request.getParameter("username");

    // Check if username is null
    if (username == null || username.isEmpty()) {
        out.println("<h3>Error: No username provided for deletion.</h3>");
        return; // Stop execution if username is missing
    }

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");

        // Delete user by username
        PreparedStatement pst = con.prepareStatement("DELETE FROM student WHERE USERNAME = ?");
        pst.setString(1, username);
        int rowsDeleted = pst.executeUpdate();
        con.close();

        if (rowsDeleted > 0) {
            response.sendRedirect("adminDashboard.jsp"); // Redirect to admin dashboard after delete
        } else {
            out.println("<h3>Error: User not found.</h3>");
        }

    } catch (Exception e) {
        out.print(e);
    }
%>
