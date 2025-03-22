<%@ page import="java.sql.*" %>
<%
    // Get username from request parameter instead of ID
    String username = request.getParameter("username");

    // Check if username is null
    if (username == null || username.isEmpty()) {
        out.println("<h3>Error: No username provided for update.</h3>");
        return; // Stop execution if username is missing
    }

    String fname = "", gender = "", phno = "", dance_style = "";
    int age = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");
        PreparedStatement pst = con.prepareStatement("SELECT * FROM student WHERE USERNAME = ?");
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            fname = rs.getString("FNAME");
            age = rs.getInt("AGE");
            gender = rs.getString("GENDER");
            phno = rs.getString("PHNO");
            dance_style = rs.getString("DANCE_STYLE");
        } else {
            out.println("<h3>Error: User not found.</h3>");
            return;
        }

        con.close();
    } catch (Exception e) {
        out.print(e);
    }
%>

<h2>Update User</h2>
<form action="updateUserProcess.jsp" method="post">
    <input type="hidden" name="username" value="<%= username %>">
    Full Name: <input type="text" name="fname" value="<%= fname %>" required><br>
    Age: <input type="number" name="age" value="<%= age %>" required><br>
    Gender: <input type="text" name="gender" value="<%= gender %>" required><br>
    Phone: <input type="text" name="phno" value="<%= phno %>" required><br>
    Dance Style: <input type="text" name="dance_style" value="<%= dance_style %>" required><br>
    <button type="submit">Update</button>
</form>
