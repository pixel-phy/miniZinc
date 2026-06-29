int: nSpots;
set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;
enum SYMB;
array[SYMB] of set of SPOT: group;
int: size;

var set of SPOT: attacks;

constraint forall (s in SYMB)
  (card(attacks intersect group[s]) <= 1);
constraint card(attacks) <= size;

var int: totalDamages = 
  sum(p in attacks) (damage[p]);
solve maximize (totalDamages);
