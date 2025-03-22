<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Dance Academy</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://img.freepik.com/premium-photo/abstract-art-dance-light-theme-that-out-formless-darkness-style-simple-intricate-beautiful-generative-ai-aig32_31965-198728.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            color: #fff;
        }

        #navbar {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-sizing: border-box;
        }

        #welcome-message {
            font-size: 18px;
            color: white;
            font-weight: bold;
        }

        #links {
            display: flex;
            gap: 15px;
        }

        #links a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
            border: 1px solid white;
        }

        #links a:hover {
            background-color: #333;
        }

        .admin-link {
            background-color: transparent;
            border: 1px solid white;
        }

        .container {
            text-align: center;
            padding: 50px 20px;
        }

        /* Body Welcome Message */
        .body-welcome-message {
            font-size: 24px;
            color: black;
            font-weight: bold;
        }

        .body-description {
            font-size: 18px;
            color: black;
        }

        footer {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

   <div id="navbar">
        <div id="welcome-message">
            Welcome, <%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "Guest" %>
        </div>
        <div id="links">
            <%
            String uname = (String) session.getAttribute("username");
            if (uname != null) {
            %>
                <a href="content.jsp">About Us</a>
                <a href="schedules.jsp">Schedules</a>
                <a href="trainers.jsp">Trainers</a>
                <a href="profile.jsp">Profile</a>

                <%-- Show Admin Dashboard link only for Admin --%>
                <% if (uname.equals("Admin@123")) { %>
                    <a href="adminDashboard.jsp" class="admin-link">Admin Dashboard</a>
                <% } %>

                <a href="logout.jsp">Logout</a>
            <%
            } else {
            %>
                <a href="login.jsp">Login</a>
            <%
            }
            %>
        </div>
    </div>

    <div class="container">
        <h2 class="body-welcome-message">Welcome to Our Dance Academy</h2>
        <p class="body-description">Explore our dance schedules, trainers, and more!</p>
    </div>

    <footer>
        <p>CopyRights@ Shaik Rabiyabi Rizwana 22761A05B7</p>
    </footer>

</body>
</html>
