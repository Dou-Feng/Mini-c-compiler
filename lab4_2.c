// #include <stdio.h>
int m, n;

int f() {
	int t;
	t = m;
	m = n;
	n = n + t;
	return n;
}

int main() {
	int i, j, k;
	m = 1;
	n = 1;
	i = read();
	// scanf("%d", &i);
	j = 0;
	while(j<i) {
		if (j<2) {
			write(1);
			// printf("1 ");
		} else {
			k = f();
			write(k);
			// printf("%d ", k);
		}
		j = j + 1;
	}
	return 0;
}