package pjwstk.tpo.tposervelet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/movies_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "MyStrongPass123";

    public ResultSet getMovies(String title, String director, String genre, String year, String actor) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

        String sql = "SELECT DISTINCT m.title, m.release_year, d.name AS director, m.rating, m.description, m.image_path, m.url "
                + "FROM movies m "
                + "LEFT JOIN directors d ON m.director_id = d.id "
                + "LEFT JOIN movie_genres mg ON m.id = mg.movie_id "
                + "LEFT JOIN genres g ON mg.genre_id = g.id "
                + "LEFT JOIN movie_actors ma ON m.id = ma.movie_id "
                + "LEFT JOIN actors a ON ma.actor_id = a.id "
                + "WHERE (? IS NULL OR m.title LIKE ?) "
                + "AND (? IS NULL OR d.name LIKE ?) "
                + "AND (? IS NULL OR g.name LIKE ?) "
                + "AND (? IS NULL OR m.release_year = ?) "
                + "AND (? IS NULL OR a.name LIKE ?)";

        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, title.isEmpty() ? null : title);
        statement.setString(2, title.isEmpty() ? null : "%" + title + "%");
        statement.setString(3, director.isEmpty() ? null : director);
        statement.setString(4, director.isEmpty() ? null : "%" + director + "%");
        statement.setString(5, genre.isEmpty() ? null : genre);
        statement.setString(6, genre.isEmpty() ? null : "%" + genre + "%");
        statement.setString(7, year.isEmpty() ? null : year);
        statement.setString(8, year.isEmpty() ? null : year);
        statement.setString(9, actor.isEmpty() ? null : actor);
        statement.setString(10, actor.isEmpty() ? null : "%" + actor + "%");

        return statement.executeQuery();
    }
}