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
            margin: 0;
            padding: 0;
            background-color: #fff;
            color: #333;
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: #666;
            font-family: Arial, sans-serif;
            font-size: 24px;
            color: #fff;
        }

        #title-frame {
            width: 100%;
            height: 100px;
            border-bottom: 1px solid #ccc;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #title {
            font-size: 30px;
            color: #fff;
            font-family: 'Times New Roman', Times, serif;
            font-weight: 200; 
            text-align: center;
            padding: 10px;
        }

        #links-frame {
            width: calc(100% - 40px);
            height: 50px;
            border-bottom: 1px solid #ccc;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        #links {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        #welcome-message {
            font-family: Arial, sans-serif;
            font-size: 16px;
            color: #fff;
        }

        #links a {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #fff;
            transition: background-color 0.3s;
            margin-left: 5px;
        }

        #links a:first-child {
            margin-left: 0;
        }

        #links a:hover {
            background-color: #333;
            text-decoration: none;
        }

        .container {
            background-image: url('https://images.unsplash.com/photo-1525092390494-3e63dcbbb174');
            background-size: cover;
            background-position: center;
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
        }

        #content {
            width: calc(100% - 40px);
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 200px);
            border: none;
        }

        footer {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <div id="title-frame">
        <div id="title"><strong>Welcome to Our Dance Academy</strong></div>
    </div>

    <div id="links-frame">
        <div id="welcome-message">Welcome, <%= session.getAttribute("username") %></div>
        <div id="links">
    <%
        String uname = (String)session.getAttribute("username");
        if(uname!=null)
            {
             
        %>
                    
                    <a href="content.jsp">About Us</a>
                    <a href="schedules.jsp">Schedules</a>
                    <a href="trainers.jsp">Trainers</a>
            <a href="profile.jsp">profile</a>
                    <a href="logout.jsp">Logout</a>
            <%
             
             }
         else
         {
         %>
            <jsp:include page="login.jsp"/>
    <%
         }
        %>
        </div>
    </div>

    <div class="container">
        <center><h2>Welcome to Our Dance academy... </h2></center>
    </div>

<footer>
  <p>CopyRights@ Shaik Rabiyabi Rizwana 22761A05B7</p>
</footer>


</body>
</html>
