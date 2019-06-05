int a;

int main() {
    int i = 5;
    int c;
    c = 2;
    c = c + 1;
    while (i) {
        c = c+--i;
        c = c+ i++;
    }
    return 0;
}