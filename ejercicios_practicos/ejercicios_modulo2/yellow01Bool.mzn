enum MOVES;
int: timeBound;
array[MOVES] of int: power;
array[MOVES] of int: duration;

array[MOVES] of var bool: occour;

constraint (sum(i in MOVES) (duration[i] * bool2int(occur[i]))) <= timeBound;

solve maximize sum(i in MOVES) (power[i] * bool2int(occur[i])); 
