int main() {
    int i = 5;
    int c = 0;
    // while (i) {
    //     c = c+--i;
    //     c = c+ i++;
    // }
    for (i=0;i<5;i++) {
        --c;
        c = c + i;
        continue;
        break;
    }
    return 0;
}