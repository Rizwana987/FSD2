<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('background.jpg');
            background-size: cover;
            background-position: center;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 2px solid #333;
            background-color: rgba(255, 255, 255, 0.7);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .registration-success {
            text-align: center;
            margin-bottom: 20px;
            color: green;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Registration Details</h2>
    <div class="registration-success">
        Registration successful!
    </div>
    <table>
        <tr>
            <th>Full Name</th>
            <th>Age</th>
            <th>Username</th>
            <th>Password</th>
            <th>Gender</th>
            <th>Phone Number</th>
            <th>Dance Style</th>
        </tr>
        <% 
        String fname = request.getParameter("fname");
        String ageParam = request.getParameter("age");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String phno = request.getParameter("phno");
        String dance_style = request.getParameter("dance_style");

        if (fname != null && ageParam != null && username != null && password != null && gender != null && phno != null && dance_style != null) {
            int age = Integer.parseInt(ageParam);

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");

                // Insert new user
                PreparedStatement pst = con.prepareStatement("INSERT INTO student (fname, age, username, password, gender, phno, dance_style) VALUES (?, ?, ?, ?, ?, ?, ?)");
                pst.setString(1, fname);
                pst.setInt(2, age);
                pst.setString(3, username);
                pst.setString(4, password);
                pst.setString(5, gender);
                pst.setString(6, phno);
                pst.setString(7, dance_style);
                pst.executeUpdate();
                pst.close();

                // Fetch only the newly registered user's data
                PreparedStatement pstSelect = con.prepareStatement("SELECT * FROM student WHERE username = ?");
                pstSelect.setString(1, username);
                ResultSet rs = pstSelect.executeQuery();

                while (rs.next()) {
        %>
                <tr>
                    <td><%= rs.getString("fname") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("password") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("phno") %></td>
                    <td><%= rs.getString("dance_style") %></td>
                </tr>
        <% 
                }

                rs.close();
                pstSelect.close();
                con.close();

            } catch (Exception e) {
                out.print(e);
            }
        }
        %>
    </table>
    <div class="login-link">
        <a href="login.html" style="text-decoration: none; color: #333; background-color: #ddd; padding: 10px 20px; border-radius: 5px;">Click here to login</a>
    </div>
</body>
</html>
