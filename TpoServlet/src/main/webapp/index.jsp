<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Movie Search</title>
    <style>
        body {
            background-image: url('images/background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .header {
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            font-size: 2em;
            position: fixed;
            top: 50px;
            text-align: center;
            width: 100%;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 60px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="header">
    <h2>Movie Search</h2>
</div>
<div class="container">
    <form action="movies" method="get">
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title"><br>
        <label for="director">Director:</label><br>
        <input type="text" id="director" name="director"><br>
        <label for="genre">Genre:</label><br>
        <input type="text" id="genre" name="genre"><br>
        <label for="actor">Actor:</label><br>
        <input type="text" id="actor" name="actor"><br>
        <label for="year">Production year:</label><br>
        <input type="text" id="year" name="year"><br>
        <input type="submit" value="Search">
    </form>
</div>
</body>
</html>
