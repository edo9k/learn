/* basic sorting algorithms
 *
 * bubble sort
 * insertion sort 
 * seleciton sort
 * quick sort 
 * merge sort
 * bogus sort 
 * stalin sort */

#include <stdio.h>

// util functions
void print_array(int array[], int size) {
  printf("{ ");
  for (int i = 0; i < size; i++)
    printf("%d, ", array[i]);
  printf("}\n");
}

void swap(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}

// sorting algos
void bubble_sort(int array[], int n) {
  for (int i = 0; i < n - 1; i++)
    for (int j = 0; j < n - i - 1; j++)
      if (array[j] > array[j+1]) {
        swap(&array[j], &array[j+1]);
        print_array(array, n); /* --- */
      }
}

void insertion_sort(int array[], int n) {
  int element, j;

  for (int i = 1; i < n; i++) {
    element = array[i];
    j = i - 1;
    while (j >= 0 && array[j] > element) {
      array[j + 1] = array[j];
      j = j - 1;
    }
    array[j + 1] = element;
    print_array(array, n); /* --- */
  }
}

void selection_sort(int array[], int n) {
  int min_element;

  for (int i = 0; i < n - 1; i++) {
    min_element = i;
    for (int j = i+1; j < n; j++) {
      if (array[j] < array[min_element]) {
        min_element = j;
        swap(&array[min_element], &array[i]);
        print_array(array, n);
      }
    }
  }
}

// used by quick_sort
int partition(int array[], int lowIndex, int highIndex) {
  int pivotElement = array[highIndex];
  int i = lowIndex - 1;
  
  for(int j = lowIndex; j <= highIndex - 1; j++) {
    if (array[j] <= pivotElement) {
      i++;
      swap(&array[i], &array[j]);
    }
  }
  swap(&array[i + 1], &array[highIndex]);
  return (i + 1);
}

void quick_sort(int array[], int lowIndex, int highIndex) {
  if (lowIndex < highIndex) {
    int pivot = partition(array, lowIndex, highIndex);
    // divide & conquer 
    quick_sort(array, lowIndex, pivot - 1);
    quick_sort(array, pivot + 1, highIndex);
  }
}

// used by merge_sort
void merge(int array[], int l, int m, int r) {
  int i, j, k;
  int n1 = m - l + 1;
  int n2 = r - m;
  int L[n1], R[n2];

  for(i = 0; i < n1; i++)
    L[i] = array[l + i];

  for(j = 0; j < n2; j++)
    R[j] = array[m + 1 + j];

  i = 0;
  j = 0;
  k = l;

  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      array[k] = L[i];
      i++;
    } else {
      array[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    array[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    array[k] = R[j];
    j++;
    k++;
  }
}

void merge_sort(int array[], int l, int r) {
  if (l < r) {
    int m = l + (r - l) / 2;
    merge_sort(array,   l, m);
    merge_sort(array, m+1, r);
    merge(array, l, m, r);
  }
}

/*
 * TODO BOGOSORT
 * TODO STALINSORT
 */

// -----------------------------

int main() {
  int array[] = { 0, 1, -4, -1, 2, 3, -2, -3, 4 };

  int length = sizeof array / sizeof array[0];

  printf("\nunsorted array : ");
  print_array(array, length);
  printf("\n");

  //bubble_sort(array, length);
  //insertion_sort(array, length);
  //selection_sort(array, length);
  //quick_sort(array, 0, length - 1);
  merge_sort(array, 0, length - 1);
 
  printf("\nsorted array   : ");
  print_array(array, length);
  printf("\n");

  return 0;
}

