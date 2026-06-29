int: nSpots;
set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;
enum SYMB;
array[SYMB] of set of SPOT: group;
int: size;

set of int: SPOTx = {0} union SPOT;
array[1..size] of var SPOTx: attacks;

% Restricción para ordenar los ataques (si el valor es 0, los siguientes deben ser 0)
constraint forall(i in 1..size-1) (
  attacks[i] >= attacks[i+1]
);

% Restricción: no más de un ataque por grupo simbólico
constraint forall(s in SYMB) (
  sum(i in 1..size) (if attacks[i] in group[s] then 1 else 0 endif) <= 1
);

var int: totalDamages = sum(i in 1..size) (if attacks[i] != 0 then damage[attacks[i]] else 0 endif);

solve maximize(totalDamages);

output [
  "attacks = ", show(attacks), "\n",
  "totalDamages = ", show(totalDamages), "\n"
];
