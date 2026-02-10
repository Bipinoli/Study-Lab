#include "encap.h"

void main() {
  Person *p = person_create_random();
  person_introduce(p);
  person_work(p);
  person_destroy(p);
}
