float d;
int i; /*测试全局变量声明*/

i = 5; // 测试全局变量赋值，不能识别
int i = 5; // 测试全局变量初始化, 不能识别
/* qwe2131
81321 */int[] a ; // 数组定义测试
struct tree { // 测试结构体
	char c;
	float f;
	int i;
};

int f(int a, int[] b) {  // 测试函数定义
	struct tree t1, t2; // 测试结构体变量的定义
	char a = i = '\\';  // 测试函数char类型、内部变量初始化和复合赋值语句
	int i = 5; // 测试int类型定义和初始化
	float j = 5.5; 

	t1.c = 1; // 测试结构体访问
	a[1] = 2; // 测试数据访问
	i++; // 测试自增运算
	i--; // 测试自减运算
	f(1,2,3); // 测试函数调用
	if (i < 1) // 测试比价运算
		if (b >= 2) /*测试嵌套if语句*/
			b = 2 || 1; // 测试逻辑运算
		else 
			b = 3 + 1; // 测试算术运算
	else // 测试就近匹配原则
		i = 3;
	for (i=0; i<=1; i++) {// 测试for循环
		a = 5 || 6;
		continue;
	}

	break;
	return 0; // 测试返回语句
}

struct tree { // 测试结构体
	char c;
	float f;
	int i;
};
5 = 1;


int semantic_Analysis0(struct node T) {
	
}
