#ifndef PERSON_H
#define PERSON_H

typedef struct Person Person;

typedef struct {
  void (*person_introduce)(const Person*);
} PersonVTable;

struct Person {
  const PersonVTable *vTable;
  const char *name;
};

#endif
