int issorted(int *tab, int size) {
    int i, res = 1;
    for (i = 0; i < size - 1; i++) {
        if (tab[i] > tab[i + 1]) 
          res = 0;
        else {
          res = 1;
          return res;
        }
        issorted(tab, size);
    }
    return res;
}

int main() {
    int arr[5] = {0, 1, 2, 3, 4};
    return issorted(arr, 5);
}