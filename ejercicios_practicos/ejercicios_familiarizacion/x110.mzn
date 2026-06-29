% Decision variable x with values from 1 to 10

var 1..10: x;

% Solve satisfy (find any valid value for x)
solve satisfy;

% Output the value of x
output ["x=\(x)\n"];
