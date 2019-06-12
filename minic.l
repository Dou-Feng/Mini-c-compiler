%{
#include "minic.tab.h"
#include "string.h"
#include "def.h"
char parse(char *str);
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
#define MAX_INT "2147483647"
typedef union {
	int type_int;
	int type_float;
	char type_char;
	char type_id[32];
	struct node *ptr;
} YYLVAL;
#define YYSTYPE YYLVAL
%}
%option yylineno

id   [_A-Za-z][_A-Za-z0-9]*  
int    [0-9]+
float  ([0-9]*\.[0-9]+)|([0-9]+\.)

char \'(.|(\\[nt0\\\'\"]))\'

%s COMMENT
%s COMMENT2

%%

<INITIAL>"//"		{BEGIN COMMENT;}
<COMMENT>\n 		{yycolumn=1; BEGIN INITIAL;}
<COMMENT>.			{;}
<INITIAL>"/*"		{BEGIN COMMENT2;}
<COMMENT2>"*/"		{BEGIN INITIAL;}
<COMMENT2>.			{;}
<COMMENT2>\n 		{yycolumn=1;}

<INITIAL>{int}        {if (strlen(yytext)>10) {printf("%d, 整型常量溢出\n", yylineno);} if(strlen(yytext)==10&&strcmp(yytext, MAX_INT)>0){printf("%d, 整型常量溢出\n", yylineno);} yylval.type_int=atoi(yytext); printf("%d, [int, %s]\n", yylineno, yytext);return INT;}
<INITIAL>{float}      {yylval.type_float=atof(yytext); printf("%d, [float, %s]\n", yylineno, yytext); return FLOAT;}
<INITIAL>{char}		  {yylval.type_char=parse(yytext); printf("%d, [char, %s]\n", yylineno, yytext);  return CHAR;}
<INITIAL>"int"        {strcpy(yylval.type_id,  yytext); printf("%d, [type, %s]\n", yylineno, yytext); return TYPE;}
<INITIAL>"float"      {strcpy(yylval.type_id,  yytext); printf("%d, [type, %s]\n", yylineno, yytext); return TYPE;}
<INITIAL>"char"		 {strcpy(yylval.type_id, yytext); printf("%d, [type, %s]\n", yylineno, yytext); return TYPE;}
<INITIAL>"return"     {printf("%d, [RETURN, %s]\n", yylineno, yytext);return RETURN;}
<INITIAL>"if"         {printf("%d, [IF, %s]\n", yylineno, yytext);return IF;}
<INITIAL>"else"       {printf("%d, [ELSE, %s]\n", yylineno, yytext);return ELSE;}
<INITIAL>"while"      {printf("%d, [WHILE, %s]\n", yylineno, yytext);return WHILE;}
<INITIAL>"for"		  {printf("%d, [FOR, %s]\n", yylineno, yytext);return FOR;}
<INITIAL>"struct" 	  {printf("%d, [STRUCT, %s]\n", yylineno, yytext);return STRUCT;}
<INITIAL>"continue"	  {printf("%d, [CONTINUE, %s]\n", yylineno, yytext);return CONTINUE;}
<INITIAL>"break"	  {printf("%d, [BREAK, %s]\n", yylineno, yytext);return BREAK;}

<INITIAL>{id}       {strcpy(yylval.type_id,  yytext); printf("%d, [ID, %s]\n", yylineno, yytext); return ID;/*由于关键字的形式也符合表示符的规则，所以把关键字的处理全部放在标识符的前面，优先识别*/}
<INITIAL>";"			{return SEMI;}
<INITIAL>","			{return COMMA;}
<INITIAL>">"|"<"|">="|"<="|"=="|"!=" {strcpy(yylval.type_id, yytext);printf("[RELOP, %s]\n", yytext); return RELOP;}
<INITIAL>"++"			{printf("%d, [INCREMENT, %s]\n", yylineno, yytext);return INCREMENT; }
<INITIAL>"--"			{printf("%d, [DECREMENT, %s]\n", yylineno, yytext);return DECREMENT; }
<INITIAL>"="			{printf("%d, [ASSIGNOP, %s]\n", yylineno, yytext);return ASSIGNOP;}
<INITIAL>"+"			{printf("%d, [PLUS, %s]\n", yylineno, yytext);return PLUS;}
<INITIAL>"-"			{printf("%d, [MINUS, %s]\n", yylineno, yytext);return MINUS;}
<INITIAL>"*"			{printf("%d, [STAR, %s]\n", yylineno, yytext);return STAR;}
<INITIAL>"/"			{printf("%d, [DIV, %s]\n", yylineno, yytext);return DIV;}
<INITIAL>"&&"         	{printf("%d, [AND, %s]\n", yylineno, yytext);return AND;}
<INITIAL>"||"         	{printf("%d, [OR, %s]\n", yylineno, yytext);return OR;}
<INITIAL>"!"			{printf("%d, [NOT, %s]\n", yylineno, yytext);return NOT;}
<INITIAL>"("			{printf("%d, [LP, %s]\n", yylineno, yytext);return LP;}
<INITIAL>")"			{printf("%d, [RP, %s]\n", yylineno, yytext);return RP;}
<INITIAL>"{"			{printf("%d, [LC, %s]\n", yylineno, yytext);return LC;}
<INITIAL>"}"			{printf("%d, [RC, %s]\n", yylineno, yytext);return RC;}
<INITIAL>"["			{printf("%d, [LM, %s]\n", yylineno, yytext);return LM;}
<INITIAL>"]"			{printf("%d, [RM, %s]\n", yylineno, yytext);return RM;}
<INITIAL>[\n]           {yycolumn=1;}    
<INITIAL>"."			{printf("%d, [ . , %s]\n", yylineno, yytext);return DOT;}
<INITIAL>[ r\t]          {}   
<INITIAL>.			{printf("Error type A :Mysterious character \"%s\"\n\t at Line %d\n",yytext,yylineno);}

%%

char parse(char *str) {
	if (strlen(str) == 4) {
		switch(str[2]) {
			case 'n': return '\n';
			case 't': return '\t';
			case '0': return '\0';
			case '\\': return '\\';
			case '\"': return '\"';
			case '\'': return '\'';
			default: return '\0';
		}
	} else {
		return str[1];
	}
}

/*
int main()
{
yylex();
return 0;
}

*/
int yywrap()
{
return 1;
}
