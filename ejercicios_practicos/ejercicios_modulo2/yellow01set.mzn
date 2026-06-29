enum MOVES;
int: timeBound;
array[MOVES] of int: power;
array[MOVES] of int: duration;

var set of MOVES: occur;

constraint (sum(i in MOVES) (duration[i] * (i in occur))) <= timeBound;

solve maximize sum(i in MOVES) (power[i] * (i in occur));
