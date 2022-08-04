/*******************************************************************************
ECON 120B, Spring 2022
Stata 	Assignment 2
Name: 	Josiah Turnquist
PID:  	A16591546
*******************************************************************************/
clear all // clear the environment/memory
set more off
sysuse nlsw88 // load the built-in dataset nlsw88



/*******************************************************************************
// ------------------------------- QUESTION 1 ----------------------------------
*******************************************************************************/
gen lnwage = ln(wage) * 100


// 1a - using regress, wage increases by 8.050632% change when education increases by one year
// 					 and an increase of 1.211481% in job tenure
regress lnwage grade ttl_exp tenure, robust


// 1b - What's the t-statistic? 
// .13256547
display [(3.03779)-3] /.2850667


// 1b - What's the p-value?
// .89453705
display 2 * normal(-abs([(3.03779)-3] /.2850667))


// 1b - Do we reject?
display "Do not reject"


// 1c - Another regression model
// B0 				= 3.770023
// Conf. Interval: 	(-0.4452366, 7.985282)
gen grade_squared = grade^2
regress lnwage grade ttl_exp tenure grade_squared, robust



// 1d - What about B4?
// B4 = 0.1624159
// Yes it is significant.



// 1e
// = 3.77



// 1f
// 2 restrictions
// Bonferroni statistic??
// P-value??
// Do not reject.


/*******************************************************************************
// ------------------------------- QUESTION 2 ----------------------------------
*******************************************************************************/


// 2a - relative frequency of sales
// = 32.45
tabulate occupation


// 2b - numeric values corresponding to sales
// = 3 ?
tabulate occupation, nolabel


// 2c - find average wage for sales workers
// = 7.154489
summarize (wage) if occupation == 3


// 2d - average wage??
// = 7.1545
// Find regresson of binary
regress wage i.occupation



// from here on I just did the commands manually... for the ones I got right,
// it was simple, for the ones I got wrong... you can tell I rushed lol.


// 2e
// 13 is the highest
// = 8.8363


// 2f
// 2 variables
// = 2

// 2g
// = 8.8363


//2e - highest wage


// 2h 
// = 1.2384


// 2i
// = 8.083



/*******************************************************************************
// ------------------------------- QUESTION 3 ----------------------------------
*******************************************************************************/



// 3a
// coll grads in a union


// 3b
// 				not this = 1.469625
// = 1.454899


// 3c
// = 0.35605



// 3d
gen unionTimesTtl = union * ttl_exp
regress lnwage union ttl_exp unionTimesTtl, robust


