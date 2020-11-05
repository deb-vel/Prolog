/*question 3
Deborah Vella*/

/*3a)*/
deletion(X,[X|N],N).  
deletion(X,[F|N],[F|P]) :- deletion(X,N,P).

permute([],[]).
permute([X|Y],Z) :- permute(Y,M), deletion(X,Z,M).  


/*
3b)
 how the algorithm works to find the first result
 1.  permute([X|Y],Z) sets X equal to the head of the entered list, while Y is set to the tail of the entered list
 2.  The clause starts by calling again the predicate permute, this time passing Y which was previously set to the tail of the list
 3.  Permute([X|Y],Z) once again sets X to the head of the passed list (in this case the tail in step 2) and Y to the new Tail.
     The list in Y is being emptied every time permute is called, as it takes away the first element of the list each time. 
 4.  The above steps continue to recurs until all the elements are taken out and the empty list is met which is defined by the base case: permute([],[]).
 5.  Every  time it recurs, the depth increases
 6.  Permute([],[]) returns an empty list and stores it in M.
 7.  Once X is set to the last element of the list initially entered,  and Y and M are empty lists, the program goes on the predicate deletion(X,Y,Z).
     This is mapped onto the predicate deletion(X,[X|N],N), coded above the permute/2 rule. Note: only deletion(X,[X|N],N). is used for the first permutation.
	- The X in deletion/3 matches the X in permute/2
	- N in deletion/3 matches the M in permute/2 
	- [X|N] in deletion/3 matches Z in permute/2.  This returns a list made up of the elements stored in X as a head and elements stored in N as a tail.
 8.  The new created list is stored inside Z as it starts to bactrack and the depth decreases.
 9.  The variable Z inside the permute/2 predicate is now populated as well.
 10. The permute/2 rule is worked out by the values found and by the list returned ([X|N]) in deletion/3, in respect with each depth.
 11. By the concatenation of elements happening inside the deletion/3 clause, a new list is being created consisting of the same elements entered by the user 
     but in a different order.
 12. The program keeps on backtracking until it reaches depth 1 and at last, the data inside Z is printed on screen.


   how the algorithm works to find the rest of the permutations:

If a semicolon is entered by the user after first output, it indicates that more permutations are needed by the user.  
The procedure starts again, but this time the last values found are used, therefore Z and M are already populated with previous results.  
Therefore, when deletion/3 is called it is now mapped also onto deletion(X,[F|N],[F|S]) instead of deletion(X,[X|N],N) only, as the program is now passing lists.
  
*/


/*3c*/
anagram(ListIn,G):- findall(F,permute(ListIn,F),G).
/*Here the goal findall generates a list G of all the permutations found by permute(ListIn,F).
Each permutation found is stored in F and then passed again in permute/2.  This continues until the second argument 
fails.  When this happens, the computer starts backtracking, collecting all F's found forming a list of lists.
The final resulted list of lists is returned as G.*/


/*3d*/

sorted([]). /*base case*/
sorted([_]). 
sorted([H,I|T]):-  H=<I, /*compare first element with the second one*/
			sorted([I|T]).  /*recursive step*/
/*The predicate sorted/1 takes a list as an input.  It takes the first two elements of the list and check if the first element (H) is less than or equal to the second one (I).
If this is true, the goal sorted is called again, this time passing I as the head of the list together with a tail.  This continues to recurs until an empty list is met. The program returns yes 
if every H was found to be less than or equal to I, else, it returns no.*/


/*3c*/

/*A naive sort is a way of sorting elements in a list into ascending order.  This is done by first developing a permutation of the elements
and then test if the resulting list is in ascending order.  If this order is not achieved yet, another permutaion of the list is generated*/

nsort(List1,List2):- permute(List1,List2),sorted(List2),!.
/*The goal permute/2 is called, passing List1 so that a permutation is found.  The returned permutation is stored in List2 and passed in goal sorted/1.  Here the list is checked if it's in ascending
order.  If it is not yet in ascending order, the program backtracks to permute and gives back another permutation.  This recursive procedure terminates when the sorted goal is true. The final list is printed
on screen and the program cuts.*/