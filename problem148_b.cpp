#include <cstdio>

long long not_seven_level(long long n) {
    if (n<=7) {
        return n;
    }
    int r = (n-1) % 7;
    long long q = (n-1) / 7;
    return not_seven_level(q+1)*(r +1); 
}


int main() {
  long long level = 1000000000;
  long long s = 0;
  for (long long l = 1; l <= level; l++) {
    s += not_seven_level(l);
  }
  printf("total = %lld\n", s);
}
	
      
