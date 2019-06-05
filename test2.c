int i;
int i;//变量重复定义
char c;

int f(int i){
    return i;
}
char f(char c){//函数重复定义

}

int main(){

    int b = 1.1;
    char c = '1';
    c = 'a';
    i = c;//类型不匹配
    1 = 2;//赋值语句需要左值
    f();//函数调用参数太少
    f(1,2);//函数调用参数太多
    f(c);//参数类型不匹配
    i = f;//类型不匹配
    ff();//不是一个函数

    b>c;
    return c;//返回值类型错误
}