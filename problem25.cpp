#include <cstdio>
int main() {
  double f1 = 1.0;
  double f2 = 1.0;
  long digits = 1;
  long index = 2;
  while (digits < 1000) {
    double next = f1+f2;
    index ++;
    if (next >10) {
      digits++;
      f2=f2/10;
      next = next /10;
      printf("digits=%ld, index = %d\n", digits, index);
    }
    f1 = f2;
    f2 = next;
  }
  printf("first exceding 1000 digits is %ld\n", index);
}
