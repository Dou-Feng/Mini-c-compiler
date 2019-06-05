## 编译原理实验

### 设计

设计自己的mini-c语言编译器，借助Flex和Bison这两个工具。

### lab1 词法分析
mini-c的功能包括：

1. 变量的定义，函数的声明；
2. 变量的赋值，函数的定义；
3. char类型的识别
4. 算术运算，比较运算，逻辑运算，自增自减运算，复合赋值语句
5. 控制语句if和while
6. 数组（定义、访问）、结构体（定义、访问）、for循环
7. break、contiune

### Problem

[1]    17696 segmentation fault  ./minic test.c

原因：没有编写.y文件正则匹配后的ast结点生成导致错误。

### lab2 语义分析

自行准备好若干个测试用例，测试用例中包含的语义错误 类别可以参考实验指导中参考教材[2]。

– 回答老师的􏰀问。可根据老师的要求，在程序的合适位置 加上符号表的显示。

– 评分依据: (1) 完成的时间;(2)完成的质量(主要看能检查出多少静态语义错误)。

能够检测出的错误：

1.  没有main函数
2. 变量类型不匹配 
3. 变量未定义 
4. 变量重复定义 
5. 非法赋值
6. 被除零
7. 常量越界（无效常量定义）
8. 函数参数列表不匹配
9. 无效的类型转换
10. break、continue位置错误
11. 不能计算该表达式
12. 数组索引类型错误
13. 数组下标为负数
14. 返回值类型错误
15. 不是一个函数
16. 缺少bool表达式
17. 赋值语句需要左值


### lab3 中间代码生成

添加的功能包括：
1. for循环的代码
2. 自增、自减
3. 取反（-）、取非（！）


