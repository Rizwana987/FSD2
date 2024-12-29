<%@ page import="java.sql.*"%>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%
// Check if the session is present
String uname = (String)session.getAttribute("username");
if(uname != null) {
    // Session is present, display the content
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Dance Academy</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #fff;
            background-image: url('https://t3.ftcdn.net/jpg/01/18/01/94/360_F_118019445_YcBJgIXL32WiujBaA8OOHozfGy3059CT.jpg');
            background-size: cover;
            background-position: center;
        }

        header {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black background */
            padding: 20px;
            text-align: center;
        }

        .main-content {
            padding: 20px;
            line-height: 1.6;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black background */
            color: #fff;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>About Us</h1>
        <%
        // Display username if logged in
        out.print("Welcome, " + uname + "!");
        %>
    </header>

    <div class="main-content">
        <section class="overview">
            <h2>Our Story</h2>
            <p>Welcome to Dance Academy, where passion meets performance! Established in 2005, we are dedicated to providing a platform for dance enthusiasts to learn, grow, and express themselves through the art of dance.</p>
        </section>

        <section class="mission-vision">
            <h2>Mission & Vision</h2>
            <p>Our mission is to inspire and empower individuals through the art of dance. We strive to provide exceptional dance education in a supportive and inclusive environment, fostering creativity, discipline, and self-expression.</p>
        </section>

        <section class="values">
            <h2>Core Values</h2>
            <ul>
                <li>Passion for Dance</li>
                <li>Inclusivity and Diversity</li>
                <li>Continuous Learning and Growth</li>
                <li>Artistic Excellence</li>
                <li>Community Engagement</li>
            </ul>
        </section>
    </div>

    <footer>
        <p>CopyRights @ Rabiyabi Rizwana Shaik 22761A05B7</p>
    </footer>
</body>
</html>

<%
} else {
    // Redirect to login page if session is not present
    response.sendRedirect("login.html");
}
%>
