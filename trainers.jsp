<%@ page import="java.sql.*"%>

<%
String uname = (String)session.getAttribute("username");
if(uname != null) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events & Trainers - Dance Academy</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="events_style.css">
    <link rel="stylesheet" href="trainers_style.css">
</head>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("https://images.pexels.com/photos/751373/pexels-photo-751373.jpeg?cs=srgb&dl=pexels-namakuki-751373.jpg&fm=jpg");
    background-size: cover;
}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

.main-content {
    padding: 20px;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.event,
.trainer {
    width: 300px;
    margin: 20px;
    padding: 15px;
    background-color: rgba(255, 255, 255, 0.5); /* Transparent white background */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

img {
    width: 100%;
    border-radius: 5px;
    margin-bottom: 10px;
}

h2 {
    margin-top: 0;
}

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
}

.welcome-message {
    margin-bottom: 20px;
    color: white;
}

</style>
<body>
    <header>
        <h1>Upcoming Events & Our Trainers</h1>
        <p class="welcome-message">Welcome, <%= uname %>!</p>
    </header>

    <div class="main-content">
        <div class="event">
            <img src="https://i.ytimg.com/vi/w6JLlwCgIS0/maxresdefault.jpg" alt="Event 1">
            <h2>Annual Dance Showcase</h2>
            <p>Date: March 15, 2024</p>
            <p>Time: 7:00 PM - 9:00 PM</p>
            <p>Location: Rizz Dance Academy</p>
            <p>Come and witness the talent and creativity of our students in our annual dance showcase!</p>
        </div>

        <div class="event">
            <img src="https://media.timeout.com/images/103232610/750/422/image.jpg" alt="Event 2">
            <h2>Salsa Night</h2>
            <p>Date: April 5, 2024</p>
            <p>Time: 8:00 PM - 10:00 PM</p>
            <p>Location: Rizz Dance Academy</p>
            <p>Join us for a fun-filled night of salsa dancing! No experience necessary, all skill levels welcome.</p>
        </div>

        <div class="event">
            <img src="https://utsav.gov.in/public/event_category_banner/1656592649.png" alt="Event 3">
            <h2>Classical Dance Show</h2>
            <p>Date: October 1, 2024</p>
            <p>Time: 8:00 PM - 12:00 PM</p>
            <p>Location: Rizz Dance Academy</p>
            <p>Experience grace and beauty of classical dance on this special event.</p>
        </div>

        <div class="trainer">
            <img src="https://thumbs.wbm.im/pw/medium/095ff6b891e232c27db691e0653b0290.avif" alt="Trainer 1">
            <h2>John Doe</h2>
            <p>John is an experienced dance instructor specializing in contemporary dance. With over 10 years of teaching experience, he is passionate about helping students develop their skills and express themselves through movement.</p>
            <ul>
                <li>Styles: Contemporary, Jazz</li>
                <li>Certifications: Dance Education Degree</li>
                <li>Classes: Advanced Contemporary, Jazz Foundations</li>
            </ul>
        </div>

        <div class="trainer">
            <img src="https://dance-teacher.com/wp-content/uploads/2022/01/PNBSum19A-0205-1024x683.jpg" alt="Trainer 2">
            <h2>Jane Smith</h2>
            <p>Jane is a skilled ballet dancer and instructor with a background in classical dance. She holds a Master's degree in Dance Education and is dedicated to fostering a love for ballet in students of all ages.</p>
            <ul>
                <li>Styles: Ballet, Pointe</li>
                <li>Certifications: Master's in Dance Education</li>
                <li>Classes: Beginner Ballet, Pointe Technique</li>
            </ul>
        </div>
    </div>

    <footer>
        <p>CopyRights @ Rabiyabi Rizwana Shaik 22761A05B7</p>
    </footer>
</body>
</html>

<%
} else {
    response.sendRedirect("login.html");
}
%>
