package project;

import java.sql.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

public class App {

    public static void main(String[] args) throws Exception {

        String url = "jdbc:postgresql://127.0.0.1:5432/cookschool";
        String userName = "postgres";
        String password = "";

        CourseServiceDB jdbcConnection = new CourseServiceDB(url, userName, password);

        Scanner scanner = new Scanner(System.in);
        boolean run = true;
        while (run) {
            System.out.println("choose mod:\n" +
                    "a -add mode\n" +
                    "l -auflisten mode\n" +
                    "nav -navigation  mode\n" +
                    "d -delete mode\n" +
                    "q -exit programm");
            System.out.print(">");
            String userInput = scanner.nextLine();

            if (Command.q.toString().equalsIgnoreCase(userInput)) {
                System.out.println("Quitting the program");
                run = false;
            }
            if (Command.l.toString().equalsIgnoreCase(userInput)) {
                System.out.println("list mode active: ");
                List<Course> allCourses = jdbcConnection.getAllCourses();
                allCourses.forEach(course -> System.out.println(course.toString()));
            }
            if (Command.a.toString().equalsIgnoreCase(userInput)) {
                System.out.println("add mode active: ");
                System.out.println("Insert courseId (should be whole number):");
                String courseId = scanner.nextLine();
                System.out.println("Insert title of course: ");
                String title = scanner.nextLine();
                System.out.println("Insert price (should be whole number): ");
                String price = scanner.nextLine();
                System.out.println("Insert date (example yyyy-mm-dd): ");
                String date = scanner.nextLine();
                System.out.println("Insert chefCookId: ");
                String chefCookId = scanner.nextLine();
                Course course = new Course();
                try {
                    course.setCourseId(Integer.parseInt(courseId.trim()));
                    course.setTitle(title.trim());
                    course.setPrice(Integer.parseInt(price.trim()));
                    course.setDate(LocalDate.parse(date.trim()));
                    course.setChefCookId(Integer.parseInt(chefCookId.trim()));
                    jdbcConnection.insertCourse(course);
                    System.out.println("New data was inserted");
                } catch (Exception e) {
                    System.out.println("An error occurred: " + e.getMessage());
                }
            }
            if (Command.d.toString().equalsIgnoreCase(userInput)) {
                System.out.println("delete mode active: ");
                System.out.println("Insert course id");
                String idToDelete = scanner.nextLine();
                try {
                    int numOfdeletedRows = jdbcConnection.deleteFromCourse(Integer.parseInt(idToDelete.trim()));
                    if (numOfdeletedRows >= 1) {
                        System.out.println("Course with id: " + idToDelete + " was deleted");
                    } else {
                        System.out.println("An error occurred. Please check input id");
                    }
                } catch (Exception e) {
                    System.out.println("An error occurred" + e.getMessage());
                }
            }
            if (Command.nav.toString().equalsIgnoreCase(userInput)) {
                System.out.println("navigation mode active: ");
                boolean navigation = true;
                try (CourseServiceNavDB courseServiceNavDB = new CourseServiceNavDB()) {
                    while (navigation) {
                        System.out.println("n[move forward]/p[move backward]/b[back to main menu]");
                        System.out.print(">");
                        userInput = scanner.nextLine();
                        if (Command.n.toString().equalsIgnoreCase(userInput)) {
                            System.out.println(courseServiceNavDB.next());
                        }
                        if (Command.p.toString().equalsIgnoreCase(userInput)) {
                            System.out.println(courseServiceNavDB.previous());
                        }
                        if (Command.b.toString().equalsIgnoreCase(userInput)) {
                            navigation = false;
                        }
                    }
                }
            }
        }
    }
}


