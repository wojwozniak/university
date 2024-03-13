# Zadanie 7 / Lista 2

## Treść

Napisać pseudokod dla diagramu sekwencji z rysunku 1.

## Pseudokod

```c++
public class StudentUser {
  Student student = new Student();
  public void show() {
    UsosWebPage usos = new UsosWebPage();
    List<Course> courses = usos.getStudentGradeInfo(student);
    for (Course course : courses) {
      System.out.println(course.mark);
    }
  }
}

public class UsosWebPage {
  GradeController gradeController = new GradeController();
  public getStudentGradeInfo(Student student) {
    return gradeController.getCourses(student);
  }
}

public class GradeController {
  public List<Course> getCourses(Student student) {
    return student.courses;
  }
}

public class Student {
  public List<Course> courses;
}

public class Course {
  public int studentId;
  public int mark;
  public Course(int mark) {
    this.mark = mark;
  }

  public int getMark(int studentId) {
    return mark;
  }
}
```
## Czy jest to jednoznaczny i precyzyjny kod?

Nie jest to jednoznaczny i precyzyjny kod - można zrobić różne implementacje tego diagramu - u mnie np. Course to osobny obiekt dla każdego kursu każdego studenta - a można zrobić tak, że Course to obiekt kursu, który jest wspólny dla wszystkich studentów. <- Opcja którą ja zrobiłem nie jest optymalna ale tak najprościej wykazać o co chodzi z niejednoznacznością.