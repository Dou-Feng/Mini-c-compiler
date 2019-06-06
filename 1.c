#include<stdio.h>
int main() {


	int c = 0;
	int b = 0;
	c = c++ + --c + 3;
	printf("%d\n", c);
	b = c++;
	printf("%d, %d\n", b,c);
	return 0;
}
