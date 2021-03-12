package project;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CourseServiceDB {

    private String url;
    private String userName;
    private String password;

    public CourseServiceDB(String url, String userName, String password) throws SQLException {
        this.url = url;
        this.userName = userName;
        this.password = password;
    }

    public Connection connect() throws SQLException {
        return DriverManager.getConnection(this.url, this.userName, this.password);
    }

    public List<Course> getAllCourses() throws SQLException {
        String query = "SELECT * FROM courses";
        List<Course> courseList = new ArrayList<>();
        try (Connection connection = connect()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Course course = new Course();
                course.setCourseId(Integer.parseInt(resultSet.getString(1)));
                course.setTitle(resultSet.getString(2));
                course.setPrice(Integer.parseInt(resultSet.getString(3)));
                course.setDate(LocalDate.parse(resultSet.getString("date")));
                course.setChefCookId(Integer.parseInt(resultSet.getString(5)));
                courseList.add(course);
            }
            return courseList;
        }
    }

    public void insertCourse(Course course) throws SQLException {
        String query =
                "INSERT INTO courses(courseid, title, price, date, chefcookid)" +
                        "VALUES(?, ?, ?, ?, ?)";

        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, course.getCourseId());
            preparedStatement.setString(2, course.getTitle());
            preparedStatement.setInt(3, course.getPrice());
            preparedStatement.setDate(4, Date.valueOf(course.getDate()));
            preparedStatement.setInt(5, course.getChefCookId());

            preparedStatement.executeUpdate();

        }
    }

    public int deleteFromCourse(int courseId) throws SQLException {
        int affectedRows;
        String query = "DELETE FROM courses WHERE courseId = ?";
        try(Connection connection = connect();
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, courseId);
            affectedRows = preparedStatement.executeUpdate();
        }

        return affectedRows;
    }

}
