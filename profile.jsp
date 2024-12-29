<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://t3.ftcdn.net/jpg/01/18/01/94/360_F_118019445_YcBJgIXL32WiujBaA8OOHozfGy3059CT.jpg');
            background-size: cover;
            background-position: center;
        }

        .profile-container {
            width: 60%;
            margin: 0 auto;
            padding-top: 50px;
            color: white;
            background-color: rgba(0, 0, 0, 0.5); /* Dark background color for profile */
            border-radius: 10px;
        }

        .profile-box {
            padding: 20px;
        }

        table.styled-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        table.styled-table th, table.styled-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            color: black;
        }

        table.styled-table th {
            background-color: #333; /* Dark background color for header */
            color: white; /* White text color for header */
        }

        p.welcome-message {
            text-align: center;
            color: white; /* White color for welcome message */
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-box">
            <h2 style="text-align: center;">User Profile</h2>
            <% 
            String uname = (String)session.getAttribute("username");
            if(uname != null) {
                out.print("<p class='welcome-message'>Welcome, Mr/Ms. " + uname + "</p>");

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "karimun");
                    String query = "SELECT * FROM student WHERE username = ?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, uname);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("fNAME");
                        int age = rs.getInt("AGE");
                        String pwd = rs.getString("Password");
                        String gen = rs.getString("GENDER");
                        String phno = rs.getString("PHNO");
            %>

            <table class="styled-table">
                <tr>
                    <th>Attribute</th>
                    <th>Details</th>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%= name %></td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td><%= age %></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><%= uname %></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><%= pwd %></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%= gen %></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><%= phno %></td>
                </tr>
            </table>

            <% 
                    } else {
                        out.println("<p class='welcome-message'>Please login first</p>");
                        response.sendRedirect("login.html");
                    }
                    con.close();
                } catch(Exception e) {
                    out.print("<p class='welcome-message'>An error occurred: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p class='welcome-message'>Please login first</p>");
                response.sendRedirect("login.html");
            }
            %>
        </div>
    </div>
</body>
</html>

