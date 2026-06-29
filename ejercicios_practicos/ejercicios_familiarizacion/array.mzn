% Parameter: length of the array
int: n;

% Array of n numbers, each from 0 to 9
array[1..n] of var 0..9: x;

% Constraint: sum equals product
constraint sum(i in 1..n)(x[i]) = product(i in 1..n)(x[i]);

% Find any solution
solve satisfy;

% Output the resulting array
output ["x = \(x)\n"];
