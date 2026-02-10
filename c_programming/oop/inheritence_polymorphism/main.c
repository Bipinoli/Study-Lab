#include "person.h"
#include "student.h"
#include "teacher.h"

void main() {
  Person *p1 = (Person *)(teacher_create("Mr. P", "Science"));
  Person *p2 = (Person *)(student_create("Little T", 4));
  Person* people[2] = {p1, p2};
  for (int i=0; i<2; i++) {
    people[i]->vTable->person_introduce(people[i]);
  }
}

