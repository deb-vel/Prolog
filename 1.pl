/*
Question 1.
Deborah Vella
*/
 
/*fact*/
secret_word([h,e,l,l,o]).

 
/*base case*/
guess([],5):- write('Congratulations - The word is hello'),nl.
 
/*recursive predicate.  Executed when called inside start*/
guess(X,Counter):-  Counter1 is Counter+1,/*variable Counter1 is set to. the contents of Counter plus 1*/
          repeat,
          write('Letter #'),write(Counter1),read(Head), /*Prompts user to enter the next letter indicated by Counter1, and input is store din Head*/                
           ((X=[Head|Tail])->write('OK. '),guess(Tail,Counter1); /*X contains the Tail passed in start.  If it is equal to Head and Tail, then print 'OK.'*/
		write('Sorry -- try again! '),fail). /*and call the guess predicate, enforcing recursion else, inform the user to try again and call fail predicate.*/

/*predicate that should be typed in for execution*/
start :-    Counter is 1,  /*variable Counter stores the letter number the user has to guess next*/
        repeat,  		/*used when fail is met*/
        write('Guess the first letter'),read(Head),   /*User is prompted to enter a letter and the character is then read and stored inside the variable head*/
	(secret_word([Head|Tail])->write('OK! '),guess(Tail,Counter);
	fail).
 /*If the content of the variable Head matches the content of the list in the secret_word fact, then,OK. is printed and the guess predicate is called, passing the Tail and Counter variables, else, fail and repeat again*/
