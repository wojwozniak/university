# Zadanie 7 / Lista 2

## Treść

Napisać pseudokod dla diagramu sekwencji z rysunku 1.

## Pseudokod

```java
public class StudentUser {
  Student student = new Student();
  public void show() {
    UsosWebPage usos = new UsosWebPage();
  }
}

public class UsosWebPage {
  GradeController gradeController = new GradeController();

    public class GradeController(Student student) {
    return getStudentGradeInfo(student);
  }
  
  public getStudentGradeInfo(Student student) {
    List<Course> courses = gradeController.getCourses(student);
    return pageLayout(courses);
  }
}

public class GradeController {
  public List<Course> getCourses(Student student) {
    return student.courses.forEach(course -> course.getMark(student.id));
  }
}

public class Student {
  public List<Course> courses;
}

public class Course {
  public int studentId;
  public int mark;

  public Course(int studentId, int mark) {
    this.mark = mark;
    this.studentId = studentId;
  }

  public int getMark(int studentId) {
    return mark;
  }
}
```
## Czy jest to jednoznaczny i precyzyjny kod?

Nie jest to jednoznaczny i precyzyjny kod - można zrobić różne implementacje tego diagramu - u mnie np. Course to osobny obiekt dla każdego kursu każdego studenta - a można zrobić tak, że Course to obiekt kursu, który jest wspólny dla wszystkich studentów. <- Opcja którą ja zrobiłem nie jest optymalna ale tak najprościej wykazać o co chodzi z niejednoznacznością.