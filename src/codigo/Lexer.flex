
package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,]+
%{
    public String lexeme;
%}
%%
int {lexeme=yytext(); return Int;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
create {lexeme=yytext(); return Create;}
alter {lexeme=yytext(); return Alter;}
drop {lexeme=yytext(); return Drop;}
truncate {lexeme=yytext(); return Truncate;}
where {lexeme=yytext(); return Where;}
table {lexeme=yytext(); return Table;}
database {lexeme=yytext(); return Database;} 
not {lexeme=yytext(); return Not;} 
exist {lexeme=yytext(); return Exist;} 
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"[" {lexeme=yytext(); return Corchete_a;}
"]" {lexeme=yytext(); return Parentesis_c;}
";" {lexeme=yytext(); return P_coma;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

 . {return ERROR;}