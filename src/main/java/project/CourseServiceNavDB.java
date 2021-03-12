package project;

import java.sql.*;

public class CourseServiceNavDB implements AutoCloseable {

    private String url = "jdbc:postgresql://127.0.0.1:5432/cookschool";
    private String userName = "postgres";
    private String password = "";
    private final Connection connection;
    private final Statement statement;
    private final ResultSet resultSet;

    public CourseServiceNavDB() throws SQLException {
        this.connection = DriverManager.getConnection(this.url, this.userName, this.password);
        this.statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        this.resultSet = statement.executeQuery("SELECT * FROM courses");
    }

    public String next() throws SQLException {
        String result;
        if (!resultSet.next()) {
            resultSet.first();
        }
        result = display(resultSet);
        return result;
    }

    public String previous() throws SQLException {
        String result = "";
        if (!resultSet.previous()) {
            resultSet.last();
        }
        result = display(resultSet);
        return result;
    }

    private String display(ResultSet resultSet) throws SQLException {
        int courseId = resultSet.getInt(1);
        String title = resultSet.getString("title");
        int price = resultSet.getInt(3);
        Date date = resultSet.getDate(4);
        int chefCookId = resultSet.getInt(5);
        return String.format("%d, %s, %d, %s, %s", courseId, title, price, date, chefCookId);
    }

    @Override
    public void close() throws Exception {
        this.connection.close();
        this.statement.close();
    }
}
