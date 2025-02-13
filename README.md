# Java Film Service

## Overview
Film_Service_Project is a web application built on Jakarta EE technology. It allows users to search for movies by entering criteria such as title, director, genre, actor, and production year on the main page (`index.jsp`). Once the form is submitted, the request is handled by a servlet (`MovieServlet`), which uses a DAO class (`MovieDAO`) to query a MySQL database. The results are then forwarded to a view (`results.jsp`), where detailed information about each movie is displayed.

## Project Structure
### Folders & Directories
- **java/pjwstk/tpo/tposervlet**: Contains Java source code including the business logic class (`MovieDAO`) and the controller servlet (`MovieServlet`).
- **webapp**: 
  Holds web resources such as:
  - The configuration file (`web.xml`)
  - The main page (`index.jsp`)
  - The results page (`results.jsp`)
  - A folder for images

### Main Source Files
- **MovieDAO.java**: 
  - **Objective**:
    - Acts as the Data Access Object (DAO) to handle communication with the MySQL database (movies_db).
  - **Key Features**:
    - **Connection Configuration**: Uses constants for the JDBC URL, username, and password.
    - **Driver Loading**: Loads the MySQL driver with `Class.forName("com.mysql.cj.jdbc.Driver")` in the getMovies method.
    - **Query Preparation**: Constructs an SQL query using multiple `LEFT JOIN` clauses to fetch data about movies, directors, genres, actors, and related details.
    - **Parameterization**: Utilizes `PreparedStatement` to dynamically build search conditions. If a parameter is empty, it passes `NULL` to accommodate flexible searching.
    - **Result**: Returns a `ResultSet` object containing the query results.
- **MovieServlet.java**:
  - **Objective**: Serves as the controller to handle HTTP GET requests to the `/movies` URL.
  - **Key Features**:
    - **Parameter Retrieval**: Reads search parameters (title, director, genre, actor, year) from the request. Defaults to an empty string if a parameter is missing.
    - **DAO Invocation**: Calls the `getMovies` method from `MovieDAO`, passing the search criteria.
    - **Forwarding Results**: Sets the `ResultSet` as a request attribute and forwards the request to `results.jsp` using: `request.getRequestDispatcher("/results.jsp").forward(request, response);`
    - **Exception Handling**: Catches potential exceptions (SQL issues, missing driver, invalid year format, forwarding errors) and displays appropriate error messages.

## Views & Configuration
- **index.jsp**:
  - **Functionality**: Provides a search form for users to input movie criteria (title, director, genre, actor, production year).
  - ** Form Submission**: Data is sent via the GET method to `/movies`, which is handled by `MovieServlet`.
- **results.jsp**:
  - **Functionality**: Displays the search results.
  - **Implementation**: Iterates over the `ResultSet` passed from the servlet, displaying each movie's details (title, release year, director, rating, description) along with an image.
  - **Styling**: Utilizes simple CSS to enhance the appearance (backgrounds, borders, colors).
- **web.xml**:
  - **Role**: Provides minimal but essential configuration to register the web application with a servlet container (Tomcat).

## Technologies & Design Patterns
- **Java SE & Jakarta EE (Servlet API)**: Leverages traditional Java web development techniques with servlets and JSP.
- **JDBC & MySQL**: Uses JDBC for database connectivity. The `MovieDAO` class exemplifies the DAO pattern, separating data access logic from business logic.
- **MVC Pattern**:
  - **Model**: Data related to movies stored in the database and retrieved by `MovieDAO`.
  - **View**: JSP pages (`index.jsp` and `results.jsp`) that handle data presentation.
  - **Controller**: `MovieServlet` managing the request-response flow.

## Example Workflow
- **User Interaction**:
  - The user opens `index.jsp` and sees the search form.
  - The user enters search criteria and submits the form.
- **Request Processing**:
  - The request is sent to `MovieServlet` via the GET method.
  - `MovieServlet` retrieves the parameters and calls `MovieDAO.getMovies(...)` to query the database.
- **Result Display**:
  - The results are stored in a `ResultSet` and forwarded to `results.jsp`.
  - `results.jsp` iterates over the results and displays detailed information about each movie, including images.
