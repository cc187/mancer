grammar mancer;

/* lexer rules */
TIME : 'time' ;
TIME_UNIT : 'h' | 'm' | 's' | 'ms' | 'us' | 'ns' ;

NEWLINE : [\r\n]+ ;

ID : [_a-z]+ ;
WS : [ \t]+ -> skip ;

FILE : ID ('.' ID)* ;

/* parser rules */

stmtList
	: stmt
	| stmtList stmt
	;

stmt
	: (timeStmt) NEWLINE
	;

timeStmt
	: TIME unit=TIME_UNIT? ID FILE? // what does 'time h ptdr' mean? is 'h' a target or a unit?
	;
