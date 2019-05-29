%{
#include "minic.tab.h"
#include "string.h"
#include "def.h"
char parse(char *str);
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
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
char 	'.'|'\\n'|'\\t'|'\\\\'|'\\\''|'\\\"'|'\\0'

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

<INITIAL>{int}        {yylval.type_int=atoi(yytext); printf("[int, %s]\n", yytext);return INT;}
<INITIAL>{float}      {yylval.type_float=atof(yytext); printf("[float, %s]\n", yytext); return FLOAT;}
<INITIAL>{char}		  {yylval.type_char=parse(yytext); printf("[char, %s]\n", yytext);  return CHAR;}
<INITIAL>"int"        {strcpy(yylval.type_id,  yytext); printf("[type, %s]\n", yytext); return TYPE;}
<INITIAL>"float"      {strcpy(yylval.type_id,  yytext); printf("[type, %s]\n", yytext); return TYPE;}
<INITIAL>"char"		 {strcpy(yylval.type_id, yytext); printf("[type, %s]\n", yytext); return TYPE;}
<INITIAL>"return"     {return RETURN;}
<INITIAL>"if"         {return IF;}
<INITIAL>"else"       {return ELSE;}
<INITIAL>"while"      {return WHILE;}
<INITIAL>"for"		  {return FOR;}
<INITIAL>"struct" 	  {return STRUCT;}
<INITIAL>"continue"	  {return CONTINUE;}
<INITIAL>"break"	  {return BREAK;}

<INITIAL>{id}       {strcpy(yylval.type_id,  yytext); printf("[ID, %s]\n", yytext); return ID;/*由于关键字的形式也符合表示符的规则，所以把关键字的处理全部放在标识符的前面，优先识别*/}
<INITIAL>";"			{return SEMI;}
<INITIAL>","			{return COMMA;}
<INITIAL>">"|"<"|">="|"<="|"=="|"!=" {strcpy(yylval.type_id, yytext);printf("[RELOP, %s]\n", yytext); return RELOP;}
<INITIAL>"++"			{return INCREMENT; printf("[INCREMENT]");}
<INITIAL>"--"			{return DECREMENT; printf("[DECREAMENT]");}
<INITIAL>"="			{return ASSIGNOP;}
<INITIAL>"+"			{return PLUS;}
<INITIAL>"-"			{return MINUS;}
<INITIAL>"*"			{return STAR;}
<INITIAL>"/"			{return DIV;}
<INITIAL>"&&"         {return AND;}
<INITIAL>"||"         {return OR;}
<INITIAL>"!"			{return NOT;}
<INITIAL>"("			{return LP;}
<INITIAL>")"			{return RP;}
<INITIAL>"{"			{return LC;}
<INITIAL>"}"			{return RC;}
<INITIAL>"["			{return LM;}
<INITIAL>"]"			{return RM;}
<INITIAL>[\n]           {yycolumn=1;}    
<INITIAL>"."			{return DOT;}
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
