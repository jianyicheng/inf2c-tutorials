#include <stdio.h>
#include <stdlib.h>

int main() {

  // (a) ----------------------
  // int *a = 10;
  // *a = 100;

  // (b) ----------------------
  // int x;
  // int *a = &x;

  // int *a = (int *)malloc(sizeof(int));

  // int *a = malloc(sizeof(int));

  // (c) ----------------------

  int n = 9;
  int **array = (int **)malloc(n * sizeof(int *));

  for (int i = 0; i < n; i++) {
    array[i] = malloc((i + 1) * sizeof(int));

    for (int j = 0; j < i; j++)
      array[i][j] = i; // or *(*(array+i)+j)
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++)
      printf("%d ", array[i][j]);
    printf("\n");
  }

  // (d) ----------------------

  for (int i = 0; i < n; i++)
    free(array[i]);
  free(array); // only frees the array of pointers

  return 0;
}
