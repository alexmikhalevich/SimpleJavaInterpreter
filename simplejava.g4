grammar simplejava;

start
    :   main_class (class_declaration)* EOF
    ;

main_class
    :   CLASS Identifier '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' Identifier ')' '{' statement '}' '}'
    ;

class_declaration
    :   CLASS Identifier (EXTENDS Identifier)? '{' (var_declaration)* (method_declaration)* '}'
    ;

var_declaration
    :   type Identifier ';'
    ;

method_declaration
    :   PUBLIC type Identifier '(' (type Identifier (',' type Identifier)*)? ')' '{' (var_declaration)*
	    (statement)* RETURN expression ';' '}';

type
    :   INT '[' ']'
    |	BOOLEAN
    |	INT
    |	Identifier
    ;

statement
    :   '{' (statement)* '}'
    |	IF '(' expression ')' statement 'else' statement
    |	WHILE '(' expression ')' statement
    |	PRINT '(' expression ')' ';'
    |	Identifier '=' expression ';'
    |	Identifier '[' expression ']' '=' expression ';'
    ;

expression
    :   expression ('&&'|'<'|'+'|'-'|'*') expression
    |	expression '[' expression ']'
    |	expression '.' LENGTH
    |	expression '.' Identifier '(' (expression(',' expression)*)? ')'
    |   Integer
    |	TRUE
    |	FALSE
    |	Identifier
    |	'this'
    |	NEW INT '[' expression ']'
    |	NEW Identifier '(' ')'
    |	'!' expression
    |	'(' expression ')'
    ;

Integer
    :   [0-9]+
    ;

Identifier
    :   [A-Za-z] [a-zA-Z0-9_]+
    ;

CLASS   : 'class';
PUBLIC  : 'public';
STATIC  : 'static';
VOID    : 'void';
MAIN    : 'main';
STRING  : 'String';
EXTENDS : 'extends';
RETURN  : 'return';
INT     : 'int';
BOOLEAN : 'boolean';
IF      : 'if';
WHILE   : 'while';
TRUE    : 'true';
FALSE   : 'false';
NEW     : 'new';
PRINT   : 'System.out.println';
LENGTH  : 'length';

Comment
    :   '/*' .*? '*/' -> channel(HIDDEN)
    ;

Line_comment
    :   '//' ~[\r\n]* -> channel(HIDDEN)
    ;