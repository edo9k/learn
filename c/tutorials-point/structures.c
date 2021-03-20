#include <stdio.h>
#include <string.h>

struct Books {
  char title[50];
  char author[50];
  char subject[100];
  int  id;
};

void print_book(struct Books book) {
  printf("book id: #%d\n", book.id);
  printf("title:   %s\n", book.title);
  printf("author:  %s\n", book.author);
  printf("subject: %s\n", book.subject);
  printf("\n");
}


int main() {
  struct Books b1, b2; /* declaring two books */

  strcpy( b1.title,   "C Programming");
  strcpy( b1.author,  "Nuha Ali");
  strcpy( b1.subject, "C Programming Tutorial");
  b1.id = 2048;

  strcpy( b2.title,   "Telecom Billing");
  strcpy( b2.author,  "Zara Ali");
  strcpy( b2.subject, "Telecom Billing Tutorial");
  b2.id = 4096;

  print_book(b1);
  print_book(b2);

  return 0;
}

