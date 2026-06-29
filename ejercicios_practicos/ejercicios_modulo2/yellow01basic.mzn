enum MOVES;
int: timeBound;
array[MOVES] of int: power;
array[MOVES] of int: duration;

array[MOVES] of var int: occur;

constraint forall(i in MOVES) (occur[i] >= 0);
constraint forall(i in MOVES) (occur[i] <= 1);

constraint (sum(i in MOVES) (duration[i] * occur[i])) <= timeBound;

solve maximize sum(i in MOVES)(power[i] * occur[i]);

output [show(occur)];
