int[] a;
int main() {
    int i = 5;
    int c = 0;
    // while (i) {
    //     c = c+--i;
    //     c = c+ i++;
    // }
    for (i=0;i<5;i++) {
        if (i > 3) {
            break;
        }
        c = c++ + c++;
        continue;
        c = ++c;
        
    }
    return 0;
}