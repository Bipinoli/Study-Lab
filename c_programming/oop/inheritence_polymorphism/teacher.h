#ifndef TEACHER_H
#define TEACHER_H

#include "person.h"

typedef struct {
  Person base;
  const char *subject;
} Teacher;

Teacher* teacher_create(const char *name, const char *subject);

#endif
