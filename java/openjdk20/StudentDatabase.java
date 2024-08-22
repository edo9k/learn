import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDatabase {

  private Connection connection;

  public StudentDatabase() {
    try {
      // Connect to the SQLite database
        connection = DriverManager.getConnection("jdbc:sqlite:students.db");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void createStudent(String name, int age, String grade) {
    try {
      // Create a new student
      String sql = "INSERT INTO students (name, age, grade) VALUES (?, ?, ?)";
      PreparedStatement preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setString(1, name);
      preparedStatement.setInt(2, age);
      preparedStatement.setString(3, grade);
      preparedStatement.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void updateStudent(int id, String name, int age, String grade) {
    try {
      // Update an existing student
      String sql = "UPDATE students SET name=?, age=?, grade=? WHERE id=?";
      PreparedStatement preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setString(1, name);
      preparedStatement.setInt(2, age);
      preparedStatement.setString(3, grade);
      preparedStatement.setInt(4, id);
      preparedStatement.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void deleteStudent(int id) {
    try {
      // Delete a student by ID
      String sql = "DELETE FROM students WHERE id=?";
      PreparedStatement preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);
      preparedStatement.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void readStudents() {
    try {
      // Read all students
      String sql = "SELECT * FROM students";
      PreparedStatement preparedStatement = connection.prepareStatement(sql);
      ResultSet resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("name");
        int age = resultSet.getInt("age");
        String grade = resultSet.getString("grade");
        System.out.println("ID: " + id + ", Name: " + name + ", Age: " + age + ", Grade: " + grade);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public static void main(String[] args) {
    StudentDatabase database = new StudentDatabase();
    // Example usage:
    database.createStudent("John Doe", 20, "A");
    database.updateStudent(1, "Jane Smith", 21, "B");
    database.deleteStudent(1);
    database.readStudents();
  }
}

