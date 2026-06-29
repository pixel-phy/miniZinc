set of int: DIGIT = 1..9;
array[DIGIT] of int: rods = [1,2,3,4,5,2,3,4,5];

var DIGIT: M1; 
var DIGIT: M2;
var DIGIT: M3;
var DIGIT: M4;
var DIGIT: M5;

% Restricción de palitos (Matchsticks)
constraint rods[M1] + rods[M2] + rods[M3] + 
           rods[M4] + rods[M5] = 12;

% Restricción de la ecuación
constraint 2303 + M1 * 10 + 980 + M2 * 1000 + M3 = 
           301 + M4 * 1000 + M5 * 10;

% Todos los dígitos deben ser diferentes
include "alldifferent.mzn";
constraint alldifferent([M1, M2, M3, M4, M5]);

solve satisfy;

output [
  "M1 = \(M1)\n",
  "M2 = \(M2)\n", 
  "M3 = \(M3)\n",
  "M4 = \(M4)\n",
  "M5 = \(M5)\n",
  "Solución: \(2303 + M1*10 + 980 + M2*1000 + M3) = \(301 + M4*1000 + M5*10)\n"
];
