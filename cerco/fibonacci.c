int fib(int n) {
  if (n < 2)
    return 1;
  else
    return fib(n - 1) + fib(n - 2);
}

int fib_it(int n) {
    if (n == 0) {
        return 0;
    }
    int a = 1;
    int b = 1;
    int i;
    for (i = 2; i < n; i++) {
        int c = a + b;
        a = b;
        b = c;
    }
    return b;
}

int main() {
  return fib_it(10);
}
