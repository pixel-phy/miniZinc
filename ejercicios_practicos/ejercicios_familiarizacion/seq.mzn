% Parameter: length of the array
int: n;

% Array of n numbers, each from 0 to 3
array[1..n] of var 0..3: x;

% Constraint 1: first number is 0
constraint x[1] = 0;

% Constraint 2: last number is 3
constraint x[n] = 3;

% Constraint 3: sum of any two adjacent numbers is at most 3
constraint forall(i in 1..n-1)(
    x[i] + x[i+1] <= 3
);

% Constraint 4: positions divisible by 3 must be >= 2
constraint forall(i in 1..n where i mod 3 = 0)(
    x[i] >= 2
);

% Objective: maximize the sum of the array
solve maximize sum(i in 1..n)(x[i]);

% Output: sum = array of values
output ["\(sum(i in 1..n)(x[i])) = \(x)\n"];
