
/*Deborah Vella
4a)*/

/*The below is the base knowledge made up of the facts called word
each fact contains one of the words as a whole and the letters that make up the word*/

word(astante,  a,s,t,a,n,t,e). /*the letters s, a and t are compared inside the rule*/
word(astoria,  a,s,t,o,r,i,a). /*the letters s, o and i are compared inside the rule*/
word(baratto,  b,a,r,a,t,t,o). /*the letters a, a and t are compared inside the rule*/
word(cobalto,  c,o,b,a,l,t,o). /*the letters o, a and t are compared inside the rule*/
word(pistola,  p,i,s,t,o,l,a). /*the letters i, t and l are compared inside the rule*/
word(statale,  s,t,a,t,a,l,e). /*the letters t, t and l are compared inside the rule*/

/*In the rule below, every V means that it is vertical, and every H means that it is horizontal*/
/*each word/8 predicate stores the whole word in the first argument and the letters one by one in the rest of the arguments.
The letters whih are not intersecting with another letter are listed as an underscore.  This is because it doesn't matter
what the letter is at thay position.  As a result, only the 2nd, 4th and 6th letters are stored in a variable.*/
crossword(V1, V2, V3, H1, H2, H3) :-
	word(V1, _,V1H1,_,V1H2,_,V1H3,_), /*Get a word and it's respective letters*/
	word(V2, _,V2H1,_,V2H2,_,V2H3,_), /*Get a word and it's respective letters*/
	word(V3, _,V3H1,_,V3H2,_,V3H3,_), /*Get a word and it's respective letters*/
	word(H1, _,V1H1,_,V2H1,_,V3H1,_), /*Call word and compare the 2nd, 4th & 6th letters with V1H1,V2H1,V3H1 respectively*/
	word(H2, _,V1H2,_,V2H2,_,V3H2,_), /*Call word and compare the 2nd, 4th & 6th letters with V1H2,V2H2,V3H2 respectively*/
	word(H3, _,V1H3,_,V2H3,_,V3H3,_), /*Call word and compare the 2nd, 4th & 6th letters with V1H3,V2H3,V3H3 respectively*/

	V1 \= V2, /*making sure that none of the stored words are equal to each other*/
	V2 \= V3,
	V3 \= H1,
	H1 \= H2,
	H2 \= H3.



/*4b)*/

/*The rule that prints the step by step solution of the puzzle*/
move(1,A,B,_) :-  /*Underscore is used for don't care variables*/ 
    write('Move top disk from '), /*Outputs from where the disk is being removed and to where it is placed*/
    write(A), /*A stores from where the disk is removed*/
    write(' to '), 
    write(B), /*B stores where the disk is placed*/
    nl. 

/*this clause works out the solution recursively*/
/*N -> size of stack while A,B,C -> can be left, right and centre*/
move(N,A,B,C) :- 
    N>1, /*is size of stack greater than 1?*/
    M is N-1, /*set M equal to size of stack minus one*/
    move(M,A,C,B), /*The following goals enforce recursion*/
    move(1,A,B,_), 
    move(M,C,B,A). 















