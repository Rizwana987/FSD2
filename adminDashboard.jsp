<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Ensure the session has an admin username before showing the dashboard
    String adminUser = (String) session.getAttribute("username");
    if (adminUser == null || !adminUser.equals("Admin@123")) {
        response.sendRedirect("welcome.jsp"); // Redirect to welcome page instead of login
        return; // Stop further execution
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 2px solid #333;
            background: white;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background: #333;
            color: white;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        .delete-btn, .update-btn {
            text-decoration: none;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .delete-btn {
            background: red;
        }
        .update-btn {
            background: green;
        }
    </style>
</head>
<body>

    <h2>Admin Dashboard</h2>

    <table>
        <tr>
            <th>Full Name</th>
            <th>Age</th>
            <th>Username</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Dance Style</th>
            <th>Actions</th>
        </tr>

        <% 
        try {
            // Load the Oracle Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a connection
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");
            Statement stmt = con.createStatement();
            
            // Execute Query to Fetch Users
            ResultSet rs = stmt.executeQuery("SELECT FNAME, AGE, USERNAME, GENDER, PHNO, DANCE_STYLE FROM student");

            while (rs.next()) {
        %>
                <tr>
                    <td><%= rs.getString("FNAME") %></td>
                    <td><%= rs.getInt("AGE") %></td>
                    <td><%= rs.getString("USERNAME") %></td>
                    <td><%= rs.getString("GENDER") %></td>
                    <td><%= rs.getString("PHNO") %></td>
                    <td><%= rs.getString("DANCE_STYLE") %></td>
                    <td>
                        <a href="updateUser.jsp?username=<%= rs.getString("USERNAME") %>" class="update-btn">Update</a>
                        <a href="deleteUser.jsp?username=<%= rs.getString("USERNAME") %>" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
        <% 
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            out.println("<h3>Error fetching users: " + e.getMessage() + "</h3>");
        }
        %>
    </table>

</body>
</html>
