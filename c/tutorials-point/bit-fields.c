#include <stdio.h>

/* Age occupies three bits */
struct {
  unsigned int age : 3;
} Age;

/* fake unix permissions */
struct {
  unsigned int owner_run: 1; 
  unsigned int owner_read: 1;
  unsinged int owner_write: 1;
  unsigned int owner_execute: 1;

  unsinged int group_run: 1; 
  unsinged int group_read: 1;
  unsinged int group_write: 1;
  unsinged int group_execute: 1;

  unsinged int others_run: 1; 
  unsinged int others_read: 1;
  unsinged int others_write: 1;
  unsinged int others_execute: 1;

} permission;


  
int main() {
  Age.age = 4;
  printf("sizeof(age): %ld\n", sizeof(Age));
  printf("Age.age: %d\n", Age.age);

  Age.age = 7;
  printf("Age.age: %d\n", Age.age);
  
  /* this is will not compile, 
   * because 8 goes beyond what the 
   * varible can hold. 0b111 = 7.
  Age.age = 8;
  printf("Age.age: %d\n", Age.age);
  */

  /* fake linux permission naive scheme 
   * not implemented */

  permission.owner_run = 1; 
  permission.owner_read = 1;
  permission.owner_write = 1;
  permission.owner_execute = 1;

  permission.group_run = 1; 
  permission.group_read = 1;
  permission.group_write = 1;
  permission.group_execute = 1;

  permission.others_run = 1; 
  permission.others_read = 1;
  permission.others_write = 1;
  permission.others_execute = 1;
  
  return 0;
}

