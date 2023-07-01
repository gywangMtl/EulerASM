#include <cstdio>
long long maxPrim = -1;
unsigned long long allNum[100*100] = {};
int t = 0;
bool isSquarefree(unsigned long long n) {
  for (unsigned long long i = 2;;i++) {
    unsigned long long p = i * i;
    if (p > n) {
      return true;
    }
    if (( n % p) == 0) {
      return false;
    }
  }
  return true;
}

bool addToList(unsigned long long n) {
  for (int i= 0;i<t;i++) {
    if (allNum[i] == n) {
      return false;
    }
  }
  allNum[t] = n;
  t++;
  return true;
}
    


int main() {
  int level = 51;
  unsigned long long c[51] = {};
  unsigned long long d[51] = {};
  c[0] = 1l;
  c[1] = 0;
  unsigned long long *cp = c;
  unsigned long long *dp  = d;
  for (int l = 1; l <= level; l++) {
    for (int n = 1;n<=l;n++) {
      /**
      if ((n+n)>l) {
	  break;
	}
      **/
      if (n == 1) {
	*dp = 1l;
      } else if (n == l) {
	*(dp+n-1) = 1l;
      } else {
	dp[n-1] = cp[n-2]+cp[n-1];
      }
      //printf("%u\t", dp[n-1]);
      addToList(dp[n-1]);
    }
    //printf("\n");
    unsigned long long *tempPtr = cp;
    cp = dp;
    dp = tempPtr;
  }

  printf("There are %d distinct numbers \n", t);
  unsigned long long ans = 0;
  for (int i = 0;(i < t);i++) {
    if (isSquarefree(allNum[i])) {
        printf("%llu \n", allNum[i]);
	ans += allNum[i];
      }
  }
  printf("sum of all prime free is %llu\n", ans);
}
	
      
