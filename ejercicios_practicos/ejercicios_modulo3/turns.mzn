include "globals.mzn";

enum SOLDIER;
enum SHIFT = { NIGHT, EVE, OFF };

int: nDays;
set of int: DAY = 1..nDays;
int: o;
int: l;
int: u;

array[SOLDIER, DAY] of var SHIFT: roster;

% ============================================
% RESTRICCIONES
% ============================================

% 1. No más de 2 NIGHT en 3 días consecutivos
constraint forall(d in 1..nDays-2, s in SOLDIER) (
  (roster[s, d] = NIGHT /\ roster[s, d+1] = NIGHT) -> roster[s, d+2] != NIGHT
);

% 2. EVE no puede ser seguido por NIGHT
constraint forall(d in 1..nDays-1, s in SOLDIER) (
  roster[s, d] = EVE -> roster[s, d+1] != NIGHT
);

% 3. Usando global_cardinality para contar NIGHT y EVE por día
array[DAY] of var l..u: onEve;

constraint forall(d in DAY) (
  global_cardinality(
    [roster[s, d] | s in SOLDIER],
    [NIGHT, EVE],
    [o, onEve[d]]
  )
);

% ============================================
% ROMPER SIMETRÍAS
% ============================================

% Romper simetría entre soldados: ordenarlos por su primer turno NIGHT
array[SOLDIER] of var int: firstNight;
constraint forall(s in SOLDIER) (
  firstNight[s] = min([d | d in DAY where roster[s, d] = NIGHT])
);

% Los soldados con menor índice deben tener su primer NIGHT antes o igual
constraint forall(s1, s2 in SOLDIER where s1 < s2) (
  firstNight[s1] <= firstNight[s2]
);

% ============================================
% VARIABLE OBJETIVO
% ============================================

var int: totalEve = sum(d in DAY) (count(s in SOLDIER) (roster[s, d] = EVE));

% ============================================
% ESTRATEGIA DE BÚSQUEDA OPTIMIZADA
% ============================================

solve :: int_search(
  [roster[s, d] | s in SOLDIER, d in DAY],
  first_fail,
  indomain_max,
  complete
) maximize totalEve;

% ============================================
% SALIDA
% ============================================

output [
  "=== ROSTER ===\n"
] ++ [
  show(s) ++ ": " ++ show([roster[s, d] | d in DAY]) ++ "\n" | s in SOLDIER
] ++ [
  "\nTotal EVE: ", show(totalEve), "\n",
  "\nEVE por día: ", show(onEve), "\n"
];
