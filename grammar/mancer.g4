grammar mancer;

/* lexer rules */
WS : [ \r\n\t]+ -> skip ;
EQUAL : '=' ;

TIME : 'time' ;
TIME_UNIT : 'h' | 'm' | 's' | 'ms' | 'us' | 'ns' ;

FLAGS : 'flags' ;
FLAG : '-'+[a-zA-Z_-]+ ;

SET : 'set' ;
RANGE : 'range' ;

ID : [a-zA-Z_]+ ;
NUMBER : '-'?[0-9]+('.'[0-9]+)? ;


/* parser rules */

stmtList
	: stmt
	| stmtList stmt
	;

stmt
	: timeStmt
	| flagsStmt
	;

timeStmt
	: TIME TIME_UNIT? ID fileName?
	;

fileName
    : ID ('.' ID)*
    ;

flagsStmt
    : FLAGS ID flagsBlock
    ;

flagsBlock
    : '{' flagsList '}'
    ;

flagsList
    : flagItem
    | flagsList flagItem
    ;

flagItem
    : FLAG
    | FLAG EQUAL? ID
//    | flagValue
//    | FLAG EQUAL? flagValue
    ;

specialValue
    : SET '(' literalList ')'
    | RANGE '(' NUMBER ',' NUMBER (',' NUMBER)? ')'
    ;

literalList
    : LITERAL
    | literalList ',' LITERAL
    ;

/*
flagValue
    : LITERAL
    | STRING
    | specialValue
    ;
    */