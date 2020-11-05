/*question 2
Deborah vella*/

/*2a)*/
sumOfRatios([A,B,C],Sum):- Sum is A+B+C. /*The addition of the entered ratios are found and stored inside the vraiable Sum and is then printed on screen*/


/*2b*/
gcd(0,X,X):- X>0,!.         /*base case: if X is greater than 0, recursion is terminated*/
/*recursive clauses to get GCD*/
gcd(X,Y,D):- X<Y, YmX is Y-X, gcd(YmX,X,D). /*is X<Y? If yes, subtract X from Y and call gcd with new values*/
gcd(X,Y,D):- X>=Y, XmY is X-Y, gcd(XmY,Y,D). /*is X>=Y? If yes, subtract Y from X and call gcd with new values*/


reduceRatio(ratio([J,K,L]),ratio([J1,K1,L1])):- 
	gcd(J,K,R), /*calculating the gcd of the first two numbers by passing the entered values*/
	gcd(R,L,R1),/*calculating the gcd of the first two entered numbers with the third one*/
	J1 is J/R1, /*dividing the original numbers with the greatest common divisor, to obtain the reduced ratios*/
	K1 is K/R1, /*J1, K1 and L1 store the answers and then are printed for the user to see*/
	L1 is L/R1.


/*2c*/
divideRatio(Amount, ratio([A,B,C]), Parts ):-  /*store amount inside Amount, and the ratio numbers inside the list[A,B,C] respectively*/ 
						SumOfRatio is A+B+C,    /*Adding values of the ratio inputted*/
						Div1 is A/SumOfRatio,   /*Divide the first number of the ratio by the sum of ratio and store answer in Div1*/
						Times1 is Div1 * Amount,/*Mulitply the answer in Div1 by the entered amount and store in Times1*/
						Div2 is B/SumOfRatio,   /*Divide the second number of the ratio by the sum of ratio and store answer in Div2*/
						Times2 is Div2 * Amount,/*Mulitply the answer in Div2 by the entered amount and store in Times2*/
						Div3 is C/SumOfRatio,   /*Divide the third number of the ratio by the sum of ratio and store answer in Div3*/
						Times3 is Div3 * Amount,/*Mulitply the answer in Div3 by the entered amount and store in Times3*/
						Parts = ratio([Times1,Times2,Times3]). /*set Parts equal to the list [Times1, Times2, Times3]. These are the answers*/