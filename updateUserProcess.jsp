<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String fname = request.getParameter("fname");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String phno = request.getParameter("phno");
    String dance_style = request.getParameter("dance_style");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");
        PreparedStatement pst = con.prepareStatement(
            "UPDATE student SET FNAME=?, AGE=?, GENDER=?, PHNO=?, DANCE_STYLE=? WHERE USERNAME=?");

        pst.setString(1, fname);
        pst.setInt(2, age);
        pst.setString(3, gender);
        pst.setString(4, phno);
        pst.setString(5, dance_style);
        pst.setString(6, username);

        int rowsUpdated = pst.executeUpdate();
        con.close();

        if (rowsUpdated > 0) {
            response.sendRedirect("adminDashboard.jsp"); // Redirect after update
        } else {
            out.println("<h3>Error: User update failed.</h3>");
        }
    } catch (Exception e) {
        out.print(e);
    }
%>
