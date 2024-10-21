<%--
  Created by IntelliJ IDEA.
  User: lukaszpodoba
  Date: 01/06/2024
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies List</title>
    <style>
        body {
            background-color: black;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .movie {
            border: 1px solid #ff0000;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #1a1a80;
            display: flex;
            align-items: flex-start;
            text-decoration: none;
            color: inherit;
        }
        .movie img {
            margin-right: 20px;
            border-radius: 5px;
        }
        .movie h2 {
            margin-top: 0;
            color: #ffcc00;
        }
        .movie p {
            margin: 5px 0;
        }
        .movie .rating {
            color: #ffcc00;
            font-weight: bold;
        }
        .no-results {
            color: #ffcc00;
            font-size: 20px;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<%
    ResultSet movies = (ResultSet) request.getAttribute("movies");
    if (!movies.next()) {
%>
<div class="no-results">
    No movies found matching your search criteria.
</div>
<%
} else {
    do {
        String movieTitle = movies.getString("title");
        int releaseYearResult = movies.getInt("release_year");
        String movieDirector = movies.getString("director");
        double rating = movies.getDouble("rating");
        String description = movies.getString("description");
        String imageFileName = movies.getString("image_path");
        String movieUrl = movies.getString("url");
%>
<a class="movie" href="<%= movieUrl %>">
    <img src="<%= request.getContextPath() %>/images/<%= imageFileName %>" alt="<%= movieTitle %>" width="150">
    <div>
        <h2><%= movieTitle %></h2>
        <p><strong>Release Year:</strong> <%= releaseYearResult %></p>
        <p><strong>Director:</strong> <%= movieDirector %></p>
        <p><strong>Rating:</strong> <span class="rating"><%= rating %></span></p>
        <p><strong>Description:</strong> <%= description %></p>
    </div>
</a>
<%
        } while (movies.next());
    }
%>

</body>
</html>
