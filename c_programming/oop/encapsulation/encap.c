#include "encap.h"
#include <stdio.h>
#include <stdlib.h>

typedef enum {
  TEACHER,
  DOCTOR,
  ENGINEER, 
  LAWYER,
  OTHER
} Profession;

char* textify_profession(Profession prof) {
  switch (prof) {
    case TEACHER:
      return "teacher";
    case DOCTOR:
      return "doctor";
    case ENGINEER:
      return "engineer";
    case LAWYER:
      return "lawyer";
    case OTHER:
      return "other";
  }
}

typedef struct Person {
  const char *name;
  unsigned int age;
  Profession profession;
} Person;



Person* person_create_random() {
  Person *ptr = malloc(sizeof(Person));
  if (ptr == NULL) {
    perror("allocation failed");
    exit(1);
  }
  // Name is a const data that is stored in .rodata segment in ELF file 
  // so it is not tied to the lifetime of the function stack
  ptr->name = "Lisa Kudrow"; 
  ptr->age = 32;
  ptr->profession = TEACHER;
  return ptr;
}


void person_introduce(const Person* person) {
  printf("Hi, my name is %s.\n \
  I am %u years old.\n \
  I am a %s by profession.\n",
    person->name,
    person->age,
    textify_profession(person->profession)
  );
}

void person_work(const Person* person) {
  printf("%s is doing the work of a %s.\n", person->name, textify_profession(person->profession));
}

void person_destroy(Person* person) {
  free(person);
}
