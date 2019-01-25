grammar mancer;

/* lexer rules */
TIME : 'time' ;
TIME_UNIT : 'h' | 'm' | 's' | 'ms' | 'us' | 'ns' ;

FLAGS : 'flags' ;
FLAG : '-'+[a-zA-Z_-]+ ;

SET : 'set' ;
RANGE : 'range' ;

WS : [ \r\n\t]+ -> skip ;

//NEWLINE : [\r\n]+ ;

FLAG_SEP : '=';
ID : [a-zA-Z_]+ ;



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
    | FLAG FLAG_SEP ID
//    | flagValue
//    | FLAG FLAG_SEP flagValue
    ;
/*
flagValue
    : LITERAL
    | STRING
    | specialValue
    ;

specialValue
    : SET '(' literalList ')'
    ;

literalList
    : LITERAL
    | literalList ',' LITERAL
    ;
    */