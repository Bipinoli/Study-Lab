#ifndef ENCAP_H
#define ENCAP_H

typedef struct Person Person;


Person* person_create_random(void);
void person_introduce(const Person*);
void person_work(const Person*);
void person_destroy(Person*);

#endif // !ENCAP_H


