enum PRISIONER;

int: n;
set of int: ROW = 1..n;
int: m;
set of int: COL = 1..m;
array[ROW, COL] of int: cost;

set of PRISIONER: danger;
set of PRISIONER: female;
set of PRISIONER: male = PRISIONER diff female;

array[PRISIONER] of var ROW: r;
array[PRISIONER] of var COL: c;

% Restricción: todos los prisioneros deben estar en celdas diferentes
constraint forall(p1, p2 in PRISIONER where p1 < p2) (
  abs(r[p1] - r[p2]) + abs(c[p1] - c[p2]) > 0
);

% Alternativa usando alldifferent con codificación única
include "alldifferent.mzn";
constraint alldifferent([r[p] * m + c[p] | p in PRISIONER]);

% Restricción: prisioneros peligrosos no pueden estar adyacentes
constraint forall(p in PRISIONER, d in danger where p != d) (
  abs(r[p] - r[d]) + abs(c[p] - c[d]) > 1
);

% Restricción de género - mujeres en la mitad superior, hombres en la mitad inferior
% Para n par: mujeres en filas 1..n/2, hombres en filas n/2+1..n
% Para n impar: mujeres en filas 1..(n+1)/2, hombres en filas (n+1)/2..n
% (la fila del medio puede ser compartida si es necesario)
constraint forall(p in female) (r[p] <= (n + 1) div 2);
constraint forall(p in male) (r[p] >= n div 2 + 1);

% Función objetivo: minimizar el costo total
var int: totalCost = sum(p in PRISIONER) (cost[r[p], c[p]]);

solve minimize totalCost;

% Salida con separación clara por género
output [
  "========================================\n",
  "ASIGNACIÓN DE PRISIONEROS\n",
  "========================================\n\n",
  "MUJERES (mitad superior):\n",
  "----------------------------\n"
] ++ [
  show(p) ++ ": (" ++ show(r[p]) ++ ", " ++ show(c[p]) ++ ")  -  Costo: " ++ show(cost[r[p], c[p]]) ++ "\n" 
  | p in female
] ++ [
  "\nHOMBRES (mitad inferior):\n",
  "----------------------------\n"
] ++ [
  show(p) ++ ": (" ++ show(r[p]) ++ ", " ++ show(c[p]) ++ ")  -  Costo: " ++ show(cost[r[p], c[p]]) ++ "\n" 
  | p in male
] ++ [
  "\n========================================\n",
  "RESUMEN:\n",
  "----------------------------------------\n",
  "Total de prisioneros: ", show(card(PRISIONER)), "\n",
  "Mujeres: ", show(card(female)), "\n",
  "Hombres: ", show(card(male)), "\n",
  "Peligrosos: ", show(card(danger)), "\n",
  "----------------------------------------\n",
  "Costo total: ", show(totalCost), "\n",
  "========================================\n"
];
