grammar While;

@header {
package parser;
}

ID:                 [a-zA-Z][a-zA-Z0-9]*;
Int:                [1-9][0-9]*|'0';
bool:               'true' | 'false';

program:            statement+ ;
statement:          block | s_if | s_while | assignment | procedure | procedureCall ;
block:              '{' statement* '}';
procedure:          'procedure' ID '(' 'val' ID (',' ID)* ')' block;
s_if:               'if' expression statement 'else' statement;
s_while:            'while' expression statement;
assignment:         ID ':=' expression ';';
procedureCall:      'call' ID '(' 'val' ID (',' expression)* ')' ';';

expression:         '(' unaryExpression ')' | '(' binaryExpression ')' | '(' mathExpression ')' | intExpression | bool | idExpression;
intExpression:      Int;
idExpression:       ID;
unaryExpression:    notExpression | bool;
notExpression:      ('!'|'not') expression;
binaryExpression:   expression binaryOperator expression;
binaryOperator:     ('<'|'>'|'=='|'&&'|'||'|'and'|'or');
mathExpression:     expression mathOperator expression;
mathOperator:       ('+'|'-'|'*'|'/');

WS:                  [ \t\r\n] -> skip;