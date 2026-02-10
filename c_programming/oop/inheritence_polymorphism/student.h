#ifndef STUDENT_H
#define STUDENT_H

#include "person.h"

typedef struct Student Student;

struct Student {
  Person base;
  unsigned int grade;
};

Student* student_create(const char* name, unsigned int grade);

#endif
