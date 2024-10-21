package pjwstk.tpo.tposervelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "moviesServlet", value = "/movies")
public class MovieServlet extends HttpServlet {
    private final MovieDAO movieDAO = new MovieDAO();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String title = request.getParameter("title") == null ? "" : request.getParameter("title");
        String director = request.getParameter("director") == null ? "" : request.getParameter("director");
        String genre = request.getParameter("genre") == null ? "" : request.getParameter("genre");
        String actor = request.getParameter("actor") == null ? "" : request.getParameter("actor");
        String year = request.getParameter("year") == null ? "" : request.getParameter("year");

        try {
            ResultSet resultSet = movieDAO.getMovies(title, director, genre, year, actor);
            request.setAttribute("movies", resultSet);
            request.getRequestDispatcher("/results.jsp").forward(request, response);
        } catch (SQLException e) {
            out.println("<p>failed to connect to the database " + e.getMessage() + "</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p>failed to load the mysql jdbc driver " + e.getMessage() + "</p>");
        } catch (NumberFormatException e) {
            out.println("<p>invalid year format " + e.getMessage() + "</p>");
        } catch (ServletException e) {
            out.println("<p>failed to forward the request " + e.getMessage() + "</p>");
        }
    }

    public void destroy() {
    }
}