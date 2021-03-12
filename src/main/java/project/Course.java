package project;

import java.time.LocalDate;

public class Course {

    private int courseId;
    private String title;
    private LocalDate date;
    private int price;
    private int chefCookId;

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getChefCookId() {
        return chefCookId;
    }

    public void setChefCookId(int chefCookId) {
        this.chefCookId = chefCookId;
    }

    @Override
    public String toString() {
        return  "courseId=" + courseId +
                ", title='" + title + '\'' +
                ", date='" + date + '\'' +
                ", price=" + price +
                ", chefCookId=" + chefCookId;
    }
}
