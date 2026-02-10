#include "teacher.h"
#include <stdio.h>
#include <stdlib.h>

static void teacher_introduce_impl(const Person *p) {
  const Teacher *t = (const Teacher *)p;
  printf("Hi, my name is %s. I am a teacher. I teach %s.\n", t->base.name, t->subject);
}

static const PersonVTable teacher_vtable = {
  .person_introduce = teacher_introduce_impl
};

Teacher* teacher_create(const char *name, const char *subject) {
  Teacher *t = malloc(sizeof(Teacher));
  if (t == NULL) {
    perror("alloc failed");
    exit(1);
  }
  t->base.name = name;
  t->base.vTable = &teacher_vtable;
  t->subject = subject;
}
