#include "student.h"
#include <stdio.h>
#include <stdlib.h>


// making it static to limit the visiblity to the student.c file during link time
static void student_introduce_impl(const Person *p) {
  const Student *s = (const Student*)p;
  printf("My name is %s. I am a student studying in class %u.\n", s->base.name, s->grade);
}

static const PersonVTable student_vtable = {
  .person_introduce = student_introduce_impl
};

Student* student_create(const char* name, unsigned int grade) {
  Student *student = malloc(sizeof(Student));
  if (student == NULL) {
    perror("alloc failed");
    exit(1);
  }
  student->base.name = name;
  student->base.vTable = &student_vtable;
  student->grade = grade;
  return student;
}
