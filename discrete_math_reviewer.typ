#import "@preview/itemize:0.1.2" as el
#set enum(numbering: "(I). (A). (1).")
#show: el.default-enum-list
#set par(justify: true)
#set text(font: "New Computer Modern", size: 11pt)
#let pmod-spacing = state("pmod-spacing", 2em/9)
#show math.equation.where(block: true): it => {
  pmod-spacing.update(2em/9)
  it
}
#show math.equation.where(block: false): it => {
  pmod-spacing.update(2em/9)
  it
}
#show math.equation.where(block: false): box
#let pmod(m) = context h(pmod-spacing.get()) + $(mod med #m)$
#set page(paper: "a4", numbering: "1")
#show math.equation.where(block: false): set math.frac(style: "horizontal")
#set enum(numbering: "1.")
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 20pt, weight: "bold")[LE Reviewer]
  
  #v(0.3em)
  #text(size: 12pt)[Counting, Combinatorics, and Generating Functions]

  #v(0.3em)
  #text(size: 12pt)[Vinluan, Ieuan David R.]
  
  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt)
]

#v(1em)
#outline()
= Basic Counting Principles

== Addition Rule

_Definition_. If a task can be done in $n_1$ ways OR $n_2$ ways, and these ways are disjoint, then there are $n_1 + n_2$ ways to do the task.

Generally, If there are $k$ disjoint sets with cardinalities $|A_1|, |A_2|, ..., |A_k|$, then we have:
$ |A_1 union A_2 union ... union A_k| = |A_1| + |A_2| + ... + |A_k| $

_Example_. A student must choose one class to take next semester. They can choose to take either a math class (5 options) or a history class (3 options). Total choices: $5 + 3 = 8$.

Always remember that the sets must be *mutually exclusive* (disjoint)!

== Multiplication Rule (Product Rule)

_Definition_. If a task consists of a sequence of $k$ steps, where:
- Step 1 can be done in $n_1$ ways
- Step 2 can be done in $n_2$ ways (for each way of doing step 1)
- Step $k$ can be done in $n_k$ ways

Then the total number of ways to complete the task is given by:
$ n_1 times n_2 times ... times n_k $

_Example_. A password consists of 2 letters followed by 3 digits.
- Letters: $26 times 26 = 676$ ways
- Digits: $10 times 10 times 10 = 1000$ ways
- Total: $676 times 1000 = 676 space 000$ passwords

== Inclusion-Exclusion Principle

Given $n$ sets $A_1, A_2, dots, A_n$, the cardinality of their union is given by:
$
  n(union.big_(i = 1)^n A_i) = sum_(k = 1)^n (-1)^(k + 1) (sum_(1 <= i_1 < dots < i_k <= n) n(A_(i_1) inter dots inter A_(i_k))).
$

For two sets,
$ |A union B| = |A| + |B| - |A inter B|. $

For three sets,
$ |A union B union C| = |A| + |B| + |C| - |A inter B| - |A inter C| - |B inter C| + |A inter B inter C|. $

The general idea is to add individual sets, subtract pairwise intersections, add three-way intersections, subtract four-way, and so on.

_Example_. In a class of 30 students:
- 18 play basketball
- 15 play soccer  
- 8 play both sports.

How many play at least one sport?
$ |B union S| = 18 + 15 - 8 = 25 "students" $

#pagebreak()

= Pigeonhole Principle

== Basic Pigeonhole Principle

_Definition_. If $n$ items are placed into $k$ containers, and $n > k$, then at least one container must contain more than one item.

_Example 1_. In a group of 13 people, at least 2 must share the same birth month.
- Pigeons: 13 people
- Holes: 12 months
- Since $13 > 12$, at least one month contains at least 2 people

_Example 2_. Among 5 points placed inside a unit square, at least 2 are within distance $sqrt(2)/2$ of each other.
- Divide the square into 4 quadrants (each $1/2 times 1/2$)
- By pigeonhole, at least one quadrant contains at least 2 points
- Maximum distance in a quadrant: $ sqrt((1/2)^2 + (1/2)^2) = sqrt(2)/2 $

== Generalized Pigeonhole Principle

_Definition_. If $n$ objects are placed into $k$ boxes, then at least one box contains at least $ceil(n/k)$ objects

_Example_. If 100 students take an exam graded 0-10, at least $ceil(100/11) = 10$ students must receive the same grade.

#pagebreak()

= Permutations and Combinations

== Permutations

_Definition_. An arrangement of objects where *order matters*.

=== Permutations of n distinct objects

Number of ways to arrange $n$ distinct objects:
$ P(n) = n! = n times (n-1) times (n-2) times ... times 2 times 1 $

_Example_. Arrangements of letters A, B, C: $3! = 6$
$ "ABC, ACB, BAC, BCA, CAB, CBA" $

=== $r$-Permutations

Number of ways to arrange $r$ objects from $n$ distinct objects:
$ P(n,r) = n!/(n-r)! = n times (n-1) times ... times (n-r+1) $

_Example_. Choose and arrange 2 letters from ${A,B,C,D}$: 
$ P(4,2) = 4!/(4-2)! = 4!/2! = 12 $

=== Circular Permutations

Given $n$ distinct elements, the number of ways to arrange them in a circle is $(n - 1)!$. Cyclical shifts of a permutation of $n$ elements in a row are all considered the same when they are in a circle.

=== Permutations with Repetition

If there are $n$ objects in total, with $n_1$ of type 1, $n_2$ of type 2, ..., $n_k$ of type $k$:
$ P = n!/(n_1! dot n_2! dot ... dot n_k!) $

_Example_. Arrangements of MISSISSIPPI:
- M: 1, I: 4, S: 4, P: 2
- Total: $ 11!/(1! dot 4! dot 4! dot 2!) = 34650 $

== Combinations

_Definition_. A selection of objects where *order does not matter*.

=== $r$-Combinations

Number of ways to choose $r$ objects from $n$ distinct objects:
$ C(n,r) = binom(n, r) = n!/(r!(n-r)!) $

_Example_. Choose 2 letters from ${A,B,C,D}$:
$ binom(4, 2) = (4 dot 3)/(2 dot 1) = 6 $

Selections: AB, AC, AD, BC, BD, CD

=== Derangements

A derangement is a permutation of $n$ elements where no element appears in its original position. This is denoted as $D_n$ and is given by the formula

$
  D_n = n! sum_(k = 0)^(n) (-1)^k/k!.
$

#pagebreak()

= Pascal's Formulas and Binomial Theorem

Each entry is $binom(n, r)$ where $n$ is the row and $r$ is the position.

== Pascal's Identity

$ binom(n, r) = binom(n-1, r-1) + binom(n-1, r) $

_Proof_. Consider choosing a subset of size $r$ from a set $S$ with $n$ items. Fix one specific item $x in S$:
- Case 1: we choose $x$. Then, choose $r-1$ more from remaining $n-1$ items: $ binom(n-1, r-1) $
- Case 2: we don't choose $x$. Then, choose $r$ from remaining $n-1$ items → $ binom(n-1, r) $
- Thus, in total:
$
  binom(n, r) = binom(n - 1, r - 1) + binom(n - 1, r)
$

== Vandermonde's Identity

$ binom(m+n, r) = sum_(k=0)^r binom(m, k) binom(n, r-k) $

_Proof_. Consider choosing a subset of size $r$ from two sets $A, B$ of sizes $m$ and $n$, respectively.

- Suppose $k$ come from $A$ and $r - k$ come from $B$
- There are $ binom(m, k) binom(n, r - k) $ ways to choose a subset
- Sum up over all possible $k$:
$
  binom(m + n, r) = sum_(k = 0)^r binom(m, k) binom(n, r - k)
$

== Binomial Theorem

$ (x + y)^n = sum_(k=0)^n binom(n, k) x^k y^(n-k) $

=== Special Cases

*Setting $x = y = 1$:*
$ 2^n = sum_(k=0)^n binom(n, k) $

This gives the total number of subsets of an $n$-element set.

*Setting $x = 1, y = -1$:*
$ 0 = sum_(k=0)^n (-1)^k binom(n, k) $

This shows that the number of even-sized subsets equals odd-sized subsets.

*Setting $y = 1$:*
$ (1 + x)^n = sum_(k=0)^n binom(n, k) x^k $

#pagebreak()

= Recurrence Relations

== Definition

A *recurrence relation* (or recurrence) expresses a sequence term $a_n$ in terms of previous terms.

_Example_. Fibonacci sequence:
$ F_n = F_(n-1) + F_(n-2), quad F_0 = 0, F_1 = 1 $

The equations $F_0 = 0, F_1 = 1$ are called *initial conditions*.

== Common Recurrence Relations

=== Arithmetic Sequence
$ a_n = a_(n-1) + d $
Closed form: $a_n = a_0 + n d$

=== Geometric Sequence  
$ a_n = r dot a_(n-1) $
Closed form: $a_n = a_0 dot r^n$

== Linear Homogeneous Recurrences

A recurrence of the form
$ a_n = c_1 a_(n-1) + c_2 a_(n-2) + ... + c_k a_(n-k) $

is called a *linear homogeneous recurrence of order $k$* with constant coefficients.

=== Solving Second-Order Linear Homogeneous Recurrences

For $a_n = c_1 a_(n-1) + c_2 a_(n-2)$:

*Step 1:* Write the *characteristic equation*:
$ r^2 = c_1 r + c_2 $
or equivalently: $r^2 - c_1 r - c_2 = 0$

*Step 2:* Solve for roots $r_1, r_2$

*Step 3:* General solution depends on the roots:

_Case 1_: Two distinct real roots $r_1 eq.not r_2$
$ a_n = alpha_1 r_1^n + alpha_2 r_2^n $

_Case 2_: One repeated root $r_1 = r_2 = r$
$ a_n = alpha_1 r^n + alpha_2 n r^n $

*Step 4:* Use initial conditions to find $alpha_1, alpha_2$

== Linear Non-Homogeneous Recurrences

Form: $a_n = c_1 a_(n-1) + c_2 a_(n-2) + f(n)$, where $f(n)$ is the *non-homogeneous term*.

=== Solving

*Step 1:* Solve the associated homogeneous recurrence to get $a_n^((h))$

*Step 2:* Find a particular solution $a_n^((p))$ based on the form of $f(n)$:

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt,
  [*Form of $f(n)$*], [*Trial Solution for $a_n^((p))$*],
  [$c$ (constant)], [$A$],
  [$c dot n$], [$A n + B$],
  [$c dot n^2$], [$A n^2 + B n + C$],
  [$c dot s^n$], [$A dot s^n$],
)

*Important:* If your guess for $a_n^((p))$ solves the homogeneous equation (i.e., is a root of the characteristic equation) with multiplicity $m$, multiply by $n^m$.

*Step 3:* General solution: $a_n = a_n^((h)) + a_n^((p))$

*Step 4:* Use initial conditions to find constants

#pagebreak()

= Generating Functions

== Definition

The *ordinary generating function* (OGF) for a sequence ${a_n}_(n = 0)^(oo)$ is:
$ G(x) = sum_(n=0)^oo a_n x^n = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + ... $

The generating function encodes the entire sequence into a single function.

== Common Generating Functions

=== Geometric Series
$ 1/(1-x) = sum_(n=0)^oo x^n = 1 + x + x^2 + x^3 + ... $

=== Variations

$ 1/(1-a x) = sum_(n=0)^oo a^n x^n $

$ 1/(1+x) = sum_(n=0)^oo (-1)^n x^n $

$ 1/(1-x)^k = sum_(n=0)^oo binom(n+k-1, k-1) x^n $

== Operations on Generating Functions

=== Addition
If $G(x) = sum a_n x^n$ and $H(x) = sum b_n x^n$, then:
$ G(x) + H(x) = sum (a_n + b_n) x^n $

=== Scalar Multiplication
$ c dot G(x) = sum (c dot a_n) x^n $

=== Multiplication by $x^k$
$ x^k G(x) = sum a_n x^(n+k) $

This shifts the sequence by $k$ positions.

=== Differentiation
$ G'(x) = sum_(n=1)^oo n a_n x^(n-1) $

Equivalently: $x G'(x) = sum_(n=1)^oo n a_n x^n$

=== Integration
$ integral G(x) dif x = sum_(n=0)^oo a_n/(n+1) x^(n+1) $

=== Convolution

Let ${a_n}_(n = 0)^(oo)$ and ${b_n}_(n = 0)^(oo)$ be two sequences, and let their OGFs be $F(x)$ and $G(x)$, respectively.

Let the product $F(x)G(x)$ be the OGF of ${c_n}_(n = 0)^(oo)$. We have $ c_n = sum_(i = 0)^n a_i b_(n - i). $

The coefficient $c_n$ counts the number of ways to achieve a total of $n$ by:
- first choosing something worth $k$ in $a_k$ ways,
- then choosing something worth $n - k$ in $b_(n - k)$ ways,
- and summing over all possible values of $k$.

== Using Generating Functions to Solve Recurrences

=== General Method

*Step 1:* Let $G(x) := sum_(n=0)^oo a_n x^n$

*Step 2:* Multiply the recurrence by $x^n$ and sum over appropriate values of $n$

*Step 3:* Express the result in terms of $G(x)$ and initial conditions

*Step 4:* Solve for $G(x)$

*Step 5:* Expand $G(x)$ as a power series to find $a_n$


_Example 1_. Solve the recurrence: $F_n = F_(n-1) + F_(n-2)$ for $n >= 2$, with $F_0 = 0, F_1 = 1$.

_Solution_.

*Step 1:* Let $G(x) := sum_(n=0)^oo F_n x^n$

*Step 2:* Multiply recurrence by $x^n$ and sum from $n=2$ to $oo$:
$ sum_(n=2)^oo F_n x^n = sum_(n=2)^oo F_(n-1) x^n + sum_(n=2)^oo F_(n-2) x^n $

*Step 3:* Express in terms of $G(x)$:
- LHS: $ G(x) - F_0 - F_1 x = G(x) - x $
- First sum on RHS: $ x sum_(n=2)^oo F_(n-1) x^(n-1) = x(G(x) - F_0) = x G(x) $
- Second sum on RHS: $ x^2 sum_(n=2)^oo F_(n-2) x^(n-2) = x^2 G(x) $

Thus, $G(x) - x = x G(x) + x^2 G(x)$.

*Step 4:* Solve for $G(x)$:
$ G(x)(1 - x - x^2) = x $
$ G(x) = x/(1 - x - x^2) $

*Step 5:* Use partial fractions. Factor denominator:
$ 1 - x - x^2 = -(x - phi)(x - hat(phi)) $

where $phi = (1+sqrt(5))/2$ and $hat(phi) = (1-sqrt(5))/2$

$ G(x) = x/((1-phi x)(1-hat(phi) x)) = A/(1-phi x) + B/(1-hat(phi) x) $

Solving: $A = 1/sqrt(5)$, and $B = -1/sqrt(5)$.

Expand using geometric series:
$ G(x) = 1/sqrt(5) sum_(n=0)^oo phi^n x^n - 1/sqrt(5) sum_(n=0)^oo hat(phi)^n x^n $

Therefore:
$ F_n = 1/sqrt(5)(phi^n - hat(phi)^n) $

_Example 2_. 

Solve the recurrence: $a_n = 3a_(n-1) + 2$ for $n >= 1$, with $a_0 = 1$.

_Solution_. Let $ G(x) := sum_(n=0)^oo a_n x^n. $

Multiply recurrence by $x^n$ and sum from $n=1$ to $oo$:
$ sum_(n=1)^oo a_n x^n = 3 sum_(n=1)^oo a_(n-1) x^n + 2 sum_(n=1)^oo x^n $

LHS: $ G(x) - a_0 = G(x) - 1 $

First term of RHS: $ 3x sum_(n=1)^oo a_(n-1) x^(n-1) = 3x G(x) $

Second term on right: $ 2 sum_(n=1)^oo x^n = (2x)/(1-x) $

So:
$ G(x) - 1 = 3x G(x) + (2x)/(1-x) $

Solve for $G(x)$:
$
  G(x)(1-3x) &= 1 + (2x)/(1-x) \
  &= (1-x+2x)/(1-x) \
  &= (1+x)/(1-x) \
$
Thus:
$ G(x) &= (1+x)/((1-x)(1-3x)) \ &= 2/(1-3x) - 1/(1-x) $

Thus, we have:

$ 
  G(x) &= 2/(1-3x) - 1/(1-x) \
  &= 2 sum_(n=0)^(oo) 3^n x^n - sum_(n=0)^(oo) x^n \
  &= sum_(n=0)^(oo) x^n (2 dot 3^n - 1)
$

Therefore:
$ a_n = 2 dot 3^n - 1 $

== Solving Counting Problems with Generating Functions

_Example_. In how many ways can we make change for $n$ cents using pennies, nickels, and dimes?

_Solution_. Let $a_n$ = number of ways to make $n$ cents.

*Generating function:*
- Pennies (1¢): can use 0, 1, 2, 3, ... $ (1 + x + x^2 + x^3 + ...) = 1/(1-x) $
- Nickels (5¢): can use 0, 1, 2, 3, ... $ (1 + x^5 + x^(10) + x^(15) + ...) = 1/(1-x^5) $
- Dimes (10¢): can use 0, 1, 2, 3, ... $ (1 + x^(10) + x^(20) + ...) = 1/(1-x^(10)) $

Total generating function:
$ G(x) = 1/((1-x)(1-x^5)(1-x^(10))) $

The coefficient of $x^n$ in the expansion of $G(x)$ gives $a_n$.

_Example_. How many ways are there to distribute 10 identical candies to 3 children such that each child gets at least 1 candy?

_Solution_. Give 1 candy to each child first. Now distribute remaining 7 candies with no restrictions.

Generating function for each child: $ 1 + x + x^2 + ... = 1/(1-x) $

For 3 children:
$ G(x) = 1/(1-x)^3 = sum_(n=0)^oo binom(n+2, 2) x^n $

Coefficient of $x^7$:
$ binom(7+2, 2) = binom(9, 2) = 36 $

So there are *36 ways*.

#pagebreak()

= Key Formulas

== Counting

- Addition Rule: $ |A union B| = |A| + |B| $
- Multiplication Rule: $ n_1 times n_2 times ... times n_k $
- Inclusion-Exclusion: $ |A union B| = |A| + |B| - |A inter B| $
- Pigeonhole: $n$ objects in $k$ boxes $=>$ at least $ceil(n/k)$ in one box

== Permutations & Combinations

- Permutations: $ P(n,r) = n!/(n-r)! $
- Permutations with repetition: $ n^r $
- Permutations with repeated elements: $ n!/(n_1 ! n_2 ! ... n_k !) $
- Combinations: $ binom(n,r) = n!/(r!(n-r)!) $
- Combinations with repetition: $ binom(n + r - 1,r) $

== Pascal & Binomial

- Pascal's Identity: $ binom(n,r) = binom(n-1,r-1) + binom(n-1,r) $
- Binomial Theorem: $ (x+y)^n = sum_(k=0)^n binom(n,k) x^k y^(n-k) $

== Recurrences

- Characteristic equation for $a_n = c_1 a_(n-1) + c_2 a_(n-2)$: 
  $r^2 - c_1 r - c_2 = 0$
- Distinct roots: $a_n = alpha_1 r_1^n + alpha_2 r_2^n$
- Repeated root: $a_n = alpha_1 r^n + alpha_2 n r^n$

== Generating Functions

- Geometric: $ 1/(1-x) = sum_(n=0)^(oo) x^n $
- Power of $(1 - x)$ as denominator: $ 1/(1-x)^k = sum_(n=0)^(oo) binom(n+k-1, k-1) x^n $

#pagebreak()

= Exercises

*Instructions.* Answer the following correctly, completely, and precisely.

1. Let $n := 2^12 dot 3^5 dot 4^3$. How many positive factors does $n$ have?

2. Let $S(x)$ denote the sum of the digits of $x$. Let $A := {x | 1 <= x < 1000, S(x) = 12}$. Give $|A|$.

3. A palindrome is a number that reads the same when it is read backwards. For instance, 121, 1001, and 1 are palindromes, but 31 and 23 are not.

  Let $S(x)$ denote the sum of the digits of $x$. A positive 5-digit palindrome $y$ is chosen at random. If the probability that $S(y) = 10$ is given by $a/b$ where $a$ and $b$ are relatively prime positive integers, find $a + b$.

4. Suppose $|A| = 23$ and $|B| = 34$. Give the lower and upper bounds of $|A union B|$.

5. Let $S$ be the set containing 6-letter words made from the first 11 letters of the alphabet without repeated letters. Let $T$ be the set containing all elements of $S$ that do not contain the sub-word `bed`. Give $|T|$. 

6. Prove or disprove the following statement: for all integers $n > 1$, in a group of $n$ people, there exist two people who are friends with the same number of people in the group. Note that friendship is a symmetrical relation (i.e., if person $X$ is friends with person $Y$, then person $Y$ is friends with person $X$).

7. There is a row of 35 chairs. Prove or disprove the following statement: if 28 people are to occupy the chairs, there will always exist 4 consecutive occupied chairs.

8. Prove or disprove the following statement: in any sequence of $n^2 + 1$ distinct real numbers, there exists an increasing or decreasing subsequence of length $n + 1$.

9. Given an integer $n >= 2$ and a set $S$ consisting of $n$ distinct odd integers in the range $[3, 2^X]$, prove or disprove the following statement: if $n >= X$, then there always exists two distinct integers $x, y in S$ such that $y > x$ and $y mod x$ is even.

10. Let $S$ be a set of $n$ integers, with $n >= 2$. Prove or disprove the following statement: there exist a pair of integers $x, y in S$ such that $x - y$ is divisible by $n - 1$.

11. How many permutations of the string `COOKIEZI` are there such that there exists some `I` that comes before some `E`?

12. Let $A$ be the multiset ${1, 1, 3, 4, 5}$. How many permutations of $A$ are lexicographically greater than the permutation $(3, 1, 4, 1, 5)$?

13. How many ways are there to seat 6 men and 6 women in a row so that no two women sit next to each other?

14. Let $n$ be a positive integer. How many permutations $p$ of the integers from 1 to $n$ are there such that the following hold:
  - $p_i != i$ for all $1 <= i <= n$, and
  - $p_1 != 2$.

  You may express your answer in terms of $D_n$, the number of derangements for a sequence of $n$ elements.

15. For a permutation $p$ of the integers from 1 to $n$, a fixed point is defined as an index $i$ such that $p_i = i$. How many permutations of $(1,2,dots,n)$ contain exactly one fixed point?

16. Find the coefficient of $x^7$ in $(1 + 2x + 3x^2)^10$. There is no need to simplify your answer.

17. Simplify the expression $ sum_(k = 0)^n binom(n, k) 99^k. $

18. Chu Shih-chieh's identity is $ sum_(i = r)^n binom(i, r) = binom(n + 1, r + 1) $ for $n, r in NN$ and $n >= r$. Use a combinatorial proof to verify this.

19. Use a combinatorial proof to show that $ sum_(k=1)^n k^2 = binom(n+1,2) + 2 binom(n+1,3) $ for all $n in NN$.

20. Use a combinatorial proof to show that
   $ sum_(k=0)^n k^3 binom(n, k) = 2^(n-1)n + 3n(n-1)2^(n-2) + n(n-1)(n-2)2^(n-3) $ for all $n in NN$.

21. Consider an $n times n$ grid. We denote by $(i, j)$ the cell on the $i$th row from the bottom and the $j$th column from the left. An ant starts on $(1, 1)$ and makes its way to $(n, n)$ by only moving up or right. Let $a_(i,j)$ be the number of ways to reach the $(i, j)$ by only moving up or right. Give a recurrence relation for $a_(i, j)$ and give the closed form of $a_(n, n)$.

22. Consider the sequence $ (1, 0, 1, 0, 1, 0, dots). $ Let $a_i$ denote the $i$th term of the sequence, starting from $i = 0$. Give a recurrence relation for $a_i$ and its closed form.

23. Consider a staircase. You may climb 1, 2, or 3 steps at a time, but you cannot take consecutive 2-steps. Let $a_n$ be the number of ways to reach step $n$. Give the recurrence.

24. Give the closed form: $a_n = 4a_(n-1) - 6a_(n-2) + 4a_(n-3) - a_(n-4)$, where $a_0 = 0$, $a_1 = 1$, $a_2 = 2$, and $a_3 = 3$.

25. Give the closed form: $a_n = 13a_(n-1) - 40 a_(n-2) + 2^n$, with $a_0 = 0, a_1 = 0$.

26. We know that $ sum_(k = 0)^n k binom(n, k) = n 2^(n-1). $ Use generating functions to prove this identity.

27. Find the generating function for $a_n = n$. Hint: start from the generating function of the sequence $b_n = 1$ for all $n >= 0$.

28. The sequence of triangular numbers $T_n$ is given by $ T_n = n(n+1)/2. $ Give the generating function for $T_n$.

29. Four fair six-sided dice are rolled. Use generating functions to count how many ways there are to achieve a total of 12.

30. We know that $ sum_(k = r)^n binom(k, r) = binom(n + 1, r + 1). $ Use generating functions to prove this identity. Hint: start from the identity $ 1/(1-x) = sum_(k = 0)^(oo) x^k $ and differentiate $r$ times.

#pagebreak()

= Solutions

1. We note that $n = 2^12 dot 3^5 dot 4^3 = 2^18 dot 3^5$. All factors of $n$ are of the form $2^a dot 3^b$, where $a$ and $b$ are integers and $0 <= a <= 18$ and $0 <= b <= 5$ hold. Since there are 19 possible values for $a$ and $6$ possible values for $b$, there are $19 dot 6 = 114$ total factors.

2. Let the digits of some $x in A$ be $d_1$, $d_2$, and $d_3$. We must have $d_1 + d_2 + d_3 = 12$.

  Without restrictions, there are $ binom(12 + 3 - 1, 12) = binom(14, 12) $ ways to assign values to $d_1$, $d_2$, and $d_3$. However, we must remove the cases where at least one of them is greater than 9.

  Note that since $d_1 + d_2 + d_3 = 12$, at most one of them can be greater than 9. Thus, we can fix which of the digits is greater than 9.

  Suppose $d_1 > 9$. Then, let $d'_1 := d_1 - 10$. Thus, we have: 
  $
    d_1 + d_2 + d_3 &= d'_1 + 10 + d_2 + d_3 = 12 \
    d'_1 + d_2 + d_3 &= 2
  $
  There are $ binom(2 + 3 - 1, 2) = 6 $ solutions to this. Thus, we have 6 solutions where $d_1 > 9$. Note that by symmetry, we also have 6 solutions where $d_2 > 9$ and 6 solutions where $d_3 > 9$.

  Thus, there are $ binom(14, 12) - 6 - 6 - 6 = 73 $ valid numbers.

3. We first note that there are $9 dot 10 dot 10 = 900$ positive 5-digit palindromes.

  Consider some positive 5-digit palindrome whose digit sum is 10. Let $x$ be the first and fifth digit, $y$ be the second and fourth digit, and $z$ be the third digit. Then, we have $ 2x + 2y + z = 10, $ which implies $z$ is even. Then, we have $ x + y = 5 - z/2. $

  Note that $x > 0$, $y >= 0$, and $z in {0, 2, 4, 6, 8}$. For each $z$, there are $5 - z/2$ valid pairs $(x, y)$. Thus, over all $z$, we have $5 + 4 + 3 + 2 + 1 = 15$ positive 5-digit palindromes whose digit sum is 10.

  The final probability is $ 15/900 = 1/60, $ and the final answer is $1 + 60 = 61$.

4. We note that $|A union B| = |A| + |B| - |A inter B|$. We have $ 0 <= |A inter B| <= 23. $ Thus, $34 <= |A union B| <= 57$.

5. We proceed with complementary counting. First, we have $|S| = P(11, 6)$. Then, we count how many elements of $S$ contain `bed`. Note that we have 8 choices for the rest of the letters, and then we must permute the 4 elements (treating `bed` as a single unit). Thus, there are $ binom(8, 3) dot 4! $ elements of $S$ that contain `bed`. Thus, the final answer is $ 11!/5! - binom(8, 3) dot 4!. $

6. The statement is true. 

  _Proof_. Let $f(x)$ be the number of friends of some person $x$ in the group. Thus, for all $x$, we have $f(x) in [0, n - 1]$. Consider two cases.

  _Case 1_. There is a person with no friends in the group.

  Then, it is impossible for someone else to have $n - 1$ friends in the group; thus, for all $x$, $f(x) in [0, n - 2]$. We have $n$ people and $n - 1$ possible values for $f$.

  _Case 2_. There is a person who is friends with everyone in the group.

  Then, it is impossible for someone else to have no friends in the group; thus, for all $x$, $f(x) in [1, n - 1]$. We have $n$ people and $n - 1$ possible values for $f$.

  Since in all cases, there are $n$ people and $n - 1$ possible values for $f(x)$, there exists two people $a$ and $b$ such that $f(a) = f(b)$. Thus, two people must have the same number of friends in the group. $qed$

7. The statement is true. 

  _Proof_. There are 7 empty chairs and, therefore, 8 segments of consecutive occupied seats. Since there are 28 people, one segment must have at least $ceil(28/8) = 4$ people. Thus, there always exists 4 consecutive occupied chairs. $qed$

8. The statement is true. 

  _Proof_. Let the sequence be $a_1, a_2, dots, a_(n^2+1)$. We proceed with a proof by contradiction.

  Suppose there exists a sequence of $n^2 + 1$ distinct real numbers where length of the longest monotone subsequence is at most $n$. Let $x_i$ be the length of the longest increasing subsequence ending at $a_i$, and let $y_i$ be the length of the longest decreasing subsequence ending at $a_i$. Since $1 <= x_i, y_i <= n$, there are $n dot n = n^2$ distinct pairs $(x_i, y_i)$. 
  
  There are $n^2 + 1$ elements, so by the pigeonhole principle, there exist two elements $a_i$ and $a_j$ such that $(x_i, y_i) = (x_j, y_j)$.

  Without loss of generality, suppose $i < j$. Since $a_i != a_j$, we can consider two cases.

  If $a_i < a_j$, then we can extend the longest increasing subsequence ending at $a_i$ by appending $a_j$. Thus, we cannot have $x_i = x_j$.

  Similarly, if $a_i > a_j$, then we can extend the longest decreasing subsequence ending at $a_i$ by appending $a_j$. Thus, we cannot have $y_i = y_j$.

  Since both cases lead to contradictions, the initial assumption was false. Thus, the original statement is true. $qed$

9. The statement is true.

  _Proof_. Consider two odd integers $x$ and $y$, where $x < y$ and $y mod x$ is even. Note that we have $ y = floor(y/x) dot x + (y mod x). $ Since $y$ and $x$ are odd and $y mod x$ is even, $floor(y/x)$ should be odd.

  Let $s := min_(x in S) x$. Partition the range $[3, 2^X]$ into at most $X - 1$ subranges: $[s, 2s)$, $[2s, 4s)$, and so on, until $[2^(X - 2)s, 2^(X - 1) s)$. Note that $2^X < 2^(X - 1) s$ because $s > 2$; thus, the union of these ranges, $[s, 2^(X - 1)s)$, fully covers $[3, 2^X]$.

  _Claim_. If two odd integers $a, b$ with $a < b$, are in the same subrange, then $b mod a$ is even.
  
  _Proof of claim_. Note that because $a$ and $b$ are in the same subrange, $b < 2a$. Since $a < b < 2a$, we must have $ 1 < b / a < 2, $ which implies $ floor(b/a) = 1. $ Since $a$ and $b$ are both odd and $floor(b/a)$ is odd, $b mod a$ is even. $qed$

  Now, since $n >= X$ and there are $X - 1$ subranges, by the pigeonhole principle, at least two elements of $S$ will be in the same subrange. Let these two elements be $x$ and $y$, and without loss of generality, suppose $x < y$. Since they are in the same subrange, $y mod x$ is even. Thus, we can always find two distinct integers $x, y in S$ such that $y > x$ and $y mod x$ is even. $qed$

10. The statement is true.

  _Proof_. Note that there are $n - 1$ possible remainders on division by $n - 1$. Since there are $n$ integers in $S$, at least two must have the same remainder on division by $n - 1$. Let these two integers be $a$ and $b$. Then, we must have $ a equiv b pmod(n - 1) => a - b equiv 0 pmod(n - 1), $ as desired. $qed$

11. Observe that if we permute all other characters besides `I` and `E`, only 2 out of the 3 ways to arrange the 2 `I`'s and the 1 `E` satisfy the condition (namely, `IIE` and `IEI`). Thus, $2/3$ of all permutations of the string `COOKIEZI` satisfy the condition. The answer is $ 2/3 dot 8!/(2!2!) = 6720. $

12. We can count how many permutations are lexicographically smaller than $(3, 1, 4, 1, 5)$.

  We first count how many begin with $1$. There are $4! = 24$ permutations.

  Then, we count how many begin with $3, 1, 1$. There are $2! = 2$ permutations.

  We observe that $(3, 1, 4, 1, 5)$ is the first permutation starting with $3, 1, 4$, so we can conclude that there are $24 + 2 = 26$ permutations lexicographically smaller than $(3, 1, 4, 1, 5)$. Since there are $ 5!/2! = 60 $ total permutations, there are $60 - 1 - 26 = 33$ permutations lexicographically larger than $(3, 1, 4, 1, 5)$.

13. We can seat the 6 men first and then seat the 6 women in the 7 spots between the men and at the ends. The answer is $6! dot 7!$.

14. We proceed with complementary counting; count how many permutations there are such that $a_i != i$ for all $i$ and $a_1 = 2$.

  There are two cases.

  _Case 1_. $a_2 = 1$

  Then, we must count how many permutations of the remaining $n - 2$ there are such that $a_i = i$. This is simply $D_(n - 2)$.

  _Case 2_. $a_2 != 1$

  We must count how many permutations of the $n - 1$ elements there are such that $a_i = i$ for $2 < i <= n$ and $a_2 != 1$. This is $D_(n - 1)$.

  Thus, the final answer is $D_n - (D_(n - 1) + D_(n - 2))$.

15. We can first choose the index of the fixed point and then permute everything else to satisfy the condition. Thus, there are $n D_(n - 1)$ permutations.

16. Let the exponent of $2x$ be $i$ and the exponent of $3x^2$ be $j$. We must find $ sum_(i + 2j = 7 \ i, j >= 0) binom(10, i, j, 10 - i - j) 2^i 3^j. $ We note that the only valid pairs of $(i, j)$ are $(1, 3)$, $(3, 2)$, $(5, 1)$, and $(7, 0)$. Thus, the answer is
  $
    binom(10, 1, 3, 6) 2^1 3^3 + binom(10, 3, 2, 5) 2^3 3^2 + binom(10, 5, 1, 4) 2^5 3^1 + binom(10, 7, 0, 3) 2^7 3^0.
  $

17. Recall that $ (1 + x)^n = sum_(k = 0)^n binom(n, k) x^k. $ Substituting $x = 99$ yields $ sum_(k = 0)^n binom(n, k) 99^k = (1 + 99)^n = 100^n. $

18. _Proof_. Consider a set $S$ of $n + 1$ people, each ranked from 0 to $n$.

  Suppose we want to choose a subset of size $r+1$ from $S$. We can do this in two ways.
  
  The first way is simply directly taking a subset of size $r+1$ from $S$. There are $ binom(n+1, r+1) $ ways to do this.

  The second way is by first fixing the highest rank of the $r+1$ people in our subset. Suppose the person with the highest rank is $i$. Then, we need to choose $r$ people with ranks $[0, i)$ because the person with rank $i$ is already in our subset. There are $ binom(i, r) $ ways to do this.

  Then, we must sum this quantity over all possible values of $i$. We have $i in [r, n]$. Thus, in total, there are
  $
    sum_(i=r)^n binom(i, r)
  $
  ways to do this task.

  Since both quantities count the same set, they must be equal. Thus,
  $
    sum_(i=r)^n binom(i,r) = binom(n+1,r+1),
  $
  as desired. $qed$

19. _Proof_. For some integer $n in NN$, consider the problem of counting how many triples $(i, j, k)$ there are such that $1 <= i, j < k <= n + 1$.

  Fix $k$. Then, there are $(k - 1)^2$ valid pairs $(i, j)$. Summing over all valid values of $k$ gives the answer:
  $
    sum_(k = 2)^(n + 1) (k - 1)^2 = sum_(k = 1)^n k^2.
  $

  Then, consider choosing the values of $i$, $j$, and $k$ directly. There are two cases.

  _Case 1_. $i = j$

  Thus, there are $ binom(n + 1, 2) $ ways to pick valid values for $i$, $j$, and $k$.

  _Case 2_. $i != j$

  There are $ binom(n + 1, 3) $ ways to pick the set of values for $i$, $j$, and $k$. Then, because swapping the values of $i$ and $j$ yields a valid triple, this must be multiplied by 2. Thus, there are 
  $
    2 binom(n+1, 3)
  $
  ways to pick valid values for $i$, $j$, and $k$.

  Since both ways count the same set, they must be equal. Thus,
  $
    sum_(k=1)^n k^2 = binom(n + 1, 2) + 2 binom(n + 1, 3),
  $
  as desired. $qed$

20. _Proof_. Consider a set $S$ consisting of $n$ people. We are to pick a subset of $S$, and we must assign the roles of president, secretary, and treasurer to some people in this subset, allowing the possibility of some person having more than 1 role. Let us do this in two ways.

  Consider first fixing the size of the subset to be $k$ and then assigning the roles to those in the subset. For a subset $A subset.eq S$, where $|A| = k$, there are $ binom(n, k) $ ways to choose $A$ and $k^3$ ways to assign the three roles. Thus, for some $k$, there are $ k^3 binom(n, k) $ ways to do this task, and summing up for all values of $k$ gives the desired result. This is $ sum_(k = 0)^n k^3 binom(n, k). $

  Next, consider assigning people to the three roles first and then choosing the remaining people who will be part of the subset. There are three cases.

  _Case 1_. All three roles are given to the same person.

  In this case, there are $n$ ways to choose this one person with all three roles and $2^(n - 1)$ ways to build the rest of the subset. Thus, there are $2^(n - 1)n$ ways to do the task in this case.

  _Case 2_. Two of the roles are given to one person; the last role is given to another person.

  In this case, there are $n$ ways to pick the person who will take two roles, $n - 1$ ways to pick the person who will take the final role, $2^(n - 2)$ ways to build the rest of the subset, and $ binom(3,2) = 3 $ ways to pick which two roles will be assigned to a single person. Thus, there are $3n(n-1)2^(n-2)$ ways to do the task in this case.

  _Case 3_. All the roles are given to different people.

  In this case, there are $n$ ways to pick the president, $n - 1$ ways to pick the secretary, $n - 2$ ways to pick the treasurer, and $2^(n-3)$ ways to build the rest of the subset. Thus, there are $n(n-1)(n-2)2^(n-3)$ ways to do the task in this case.

  Thus, there are $ 2^(n-1)n + 3n(n-1)2^(n-2) + n(n-1)(n-2)2^(n-3) $ ways in total to do the task in this manner.

  Since both ways count the number of ways to do the same task, they must be equal. Thus, $ sum_(k = 0)^n k^3 binom(n, k) = 2^(n-1)n + 3n(n-1)2^(n-2) + n(n-1)(n-2)2^(n-3). space qed  $

21. Consider a cell $(i, j)$. A path to $(i, j)$ can end in either an up move or a right move. Thus, we must have $a_(i, j) = a_(i, j - 1) + a_(i - 1, j)$, with the base cases $a_(1, 1) = 1$ and $a_(i, j) = 0$ if $i <= 0$ or $j <= 0$. That is:
$
  a_(i, j) = cases(
    a_(i - 1, j) + a_(i, j - 1) "if" i > 1 "and" j > 1\,,
    1 "if" (i, j) = (1, 1)\,,
    0 "otherwise"
  )
$
  Moving to the cell $(n, n)$ consists of $n$ up moves and $n$ right moves. Thus, there are $ (2n)!/(n!n!) = binom(2n, n) $ ways to move to $(n, n)$. Thus, $ a_(n, n) = binom(2n, n). $

22. We have $a_n = a_(n - 2)$, with the base cases $a_0 = 1$ and $a_1 = 0$.

  The characteristic equation is $r^2 = 1$, which means $r_1 = 1$ and $r_2 = -1$. Thus,
  $
    a_n = A(1)^n + B(-1)^n
  $
  for some constants $A$ and $B$. Solving yields $A = B = 1/2$. Thus,
  $ a_n = ((-1)^n + 1)/2. $

  Alternatively, we have $a_n = 1 - a_(n - 1)$, with the base case $a_0 = 1$. Solving this gives the same closed form.

23. Let $x_n$ be the number of ways to reach step $n$ without ending on a 2-step, and let $y_n$ be the number of ways to reach step $n$ by ending with a 2-step. Thus, $a_n = x_n + y_n$.

  We have $x_n = x_(n-1) + y_(n-1) + x_(n-3) + y_(n-3) = a_(n - 1) + a_(n-3)$ and $y_n = x_(n-2)$. Thus:
  $
    a_n &= x_n + y_n \
    &= a_(n - 1) + a_(n - 3) + x_(n - 2) \
    &= a_(n - 1) + a_(n - 3) + a_(n - 3) + a_(n - 5) \
    &= a_(n - 1) + 2a_(n - 3) + a_(n - 5).
  $
  The recurrence is $a_n = a_(n - 1) + 2a_(n - 3) + a_(n - 5)$, with base cases $a_0 = 0$, $a_1 = 1$, $a_2 = 1$, $a_3 = 2$, $a_4 = 4$.

24. Observe that the characteristic equation is simply $(r-1)^4 = 0$. Thus,
  $
    a_n &= A(1)^n + B n (1)^n + C n^2 + (1)^n + D n^3 (1)^n \ &= A + B n + C n^2 + D n^3 . 
  $
  Thus, $A = C = D = 0$ and $B = 1$. Then, $a_n = n$.

25. The homogeneous part is $a_n = 13a_(n-1) - 40a_(n-2)$. We have $ r^2 - 13r + 40 = 0,$ and so $(r_1, r_2) &= (5, 8)$. The trial solution for the non-homogeneous part is $C(2)^n$ for some constant $C$. Thus, $C(2)^n = 13 C (2)^(n-1) - 40C (2)^(n-2) + 2^n$. Solving:
  $
    13 dot 2 - 40 + 4/C &= 4 \
    C &= 2/9
  $
  Thus, $ a_n = A(5)^n + B(8)^n + 2/9 2^n. $

  Solving for $A$ and $B$:
  $
    a_0 &= 0 = A + B + 2/9 \
    a_1 &= 0 = 5A + 8B + 4/9 \
    3A &= -12 / 9 => A = -4/9 \
    B &= -2/9 - A = 2/9
  $
  Thus, $ a_n = -4/9 (5)^n + 2/9 (8)^n + 2^(n+1)/9. $

26. _Proof_. Consider an integer $n >= 0$. Define the sequence $ a_k = binom(n, k). $ The generating function for $a_n$ is $ G(x) := sum_(k = 0)^n binom(n, k)x^k. $ Note that $a_k = 0$ for $k > n$. We know that $ G(x) = (1+x)^n = sum_(k = 0)^n binom(n, k)x^k. $

  Taking the derivative of both sides with respect to $x$:
  $
    sum_(k = 0)^n k binom(n, k) x^(k - 1) &= n(1 + x)^(n-1).
  $
  Substitute $x = 1$:
  $
    sum_(k = 0)^n k binom(n, k) 1^(k - 1) &= n(1 + 1)^(n - 1) \
  $
  Therefore, 
  $
    sum_(k = 0)^n k binom(n, k) &= n 2^(n-1),
  $
  as desired. $qed$

27. The generating function of $a_n$ is $ G(x) := 0x^0 + 1x^1 + 2x^2 + dots = sum_(k = 0)^n k x^k. $

  We know that $ 1/(1-x) = sum_(k = 0)^(oo) x^k. $

  Taking the derivative of both sides:
  $
    1/(1-x)^2 &= sum_(k = 0)^(oo) k x^(k - 1) \
    x/(1-x)^2 &= sum_(k = 0)^(oo) k x^k \
  $
  Thus, the generating function of $a_n$ is $ G(x) = x/(1-x)^2. $

28. The generating function of $T_n$ is $ G(x) := sum_(k = 0)^(oo) k(k+1)/2 x^k. $ We proceed as follows:
  $
    G(x) &= sum_(k = 0)^(oo) k(k+1)/2 x^k \
    &= sum_(k = 0)^(oo) (binom(k + 2, 2) - k - 1) x^k \
    &= sum_(k = 0)^(oo) binom(k + 2, 2) x^k - sum_(k = 0)^(oo) k x^k - sum_(k = 0)^(oo) x^k \
    &= 1/(1-x)^3 - x/(1-x)^2 - 1/(1-x) \
    &= (1 - x(1-x) - (1-x)^2)/(1-x)^3 \
    &= (1 - x + x^2 - 1 + 2x - x^2)/(1-x)^3 \
    &= x/(1-x)^3
  $

29. The generating function for each dice is $sum_(k = 1)^6 x^k$. Thus, the generating function for four dice is $ (sum_(k = 1)^6 x^k)^4. $ We need to find the coefficient of $x^12$.
  $
    (sum_(k = 1)^6 x^k)^4 &= (x + x^2 + x^3 + x^4 + x^5 + x^6)^4 \
    &= x^4(1 + x + x^2 + x^3 + x^4 + x^5)^4 \
  $
  We can find the coefficient of $x^8$ in $(1 + x + x^2 + x^3 + x^4 + x^5)^4$ instead.

  This is given by
  $
    &binom(4, 4) + binom(4, 3, 1) + binom(4, 2, 2) dot 2 + binom(4, 2, 1, 1) dot 5 + binom(4, 1, 1, 1, 1) dot 2 \
    &= 1 + 4 + 6 dot 2 + 12 dot 5 + 24 dot 2 \
    &= 1 + 4 + 12 + 60 + 48 \
    &= 125.
  $
  Thus, the coefficient of $x^12$ in the original expression is 125. This means that there are 125 ways to achieve a total of 12.

30. _Proof_. We have $ 1/(1-x) = sum_(k = 0)^(oo) x^k. $ Differentiating both sides with respect to $x$ $r$ times gives $ r!/(1 - x)^(r + 1) = sum_(k = 0)^(oo) k!/(k - r)! x^(k - r), $ which implies 
  $
    x^r/(1 - x)^(r + 1) &= sum_(k = 0)^(oo) k!/((k-r)!r!) x^k \
    &= sum_(k = 0)^(oo) binom(k, r) x^k.
  $
  Since for all $k < r$, we have $ binom(k, r) = 0, $ we can rewrite
  $
    x^r/(1-x)^(r+1) &= sum_(k = 0)^(oo) binom(k, r)x^k \
    &= sum_(k=r)^(oo) binom(k,r) x^k.
  $
  Define a new sequence $b$ as follows:
  $
    b_n := sum_(k = r)^n binom(k, r) x^k.
  $
  Note that $b_n = 0$ for $n < r$.

  We can use the fact that if $A(x)$ is the ordinary generating function of a sequence ${x_n}$, then the ordinary generating function of the sequence of partial sums ${sum_(k = 0)^n a_k}$ is $ A(x)/(1-x). $ 
  The generating function for $b$ is
  $
    sum_(k = r)^(oo) (sum_(i = r)^k binom(i, r)) x^k &= (x^r) / ((1-x)^(r+1) dot (1-x)) \
    &= x^r / (1-x)^(r+2) \
    &= x^r sum_(k=0)^(oo) binom(k + r + 1, r + 1) x^k \
    &= sum_(k=0)^(oo) binom(k + r + 1, r + 1) x^(k+r) \
    &= sum_(k=r)^(oo) binom(k + 1, r + 1) x^k.
  $
  Equating coefficients, we have
  $
    sum_(i = r)^(k) binom(i, r) = binom(k + 1, r + 1),
  $
  which is equivalent to
  $
    sum_(k=r)^n binom(k, r) = binom(n + 1, r + 1),    
  $
  as desired. $qed$

#align(center)[
  #v(2em)
  #line(length: 50%, stroke: 0.5pt)
  
  #text(size: 10pt, style: "italic")[End]
]