var 0..9: C;
var 0..9: A;
var 0..9: O;
var 0..9: Z;
var 0..9: H;
var 0..9: I;
var 0..9: P;
var 0..9: T;
var 0..9: E;
var 0..9: S;

include "alldifferent.mzn";
constraint alldifferent([C, A, O, Z, H, I, P, T, E, S]);

% O es igual a 0 (su forma pareja)
constraint O = 0;

% P es 3 veces Z
constraint P = 3 * Z;

% CAO + ZHI + CAO + PI = TEST
constraint
    (100*C + 10*A + O)        % CAO
  + (100*Z + 10*H + I)        % ZHI
  + (100*C + 10*A + O)        % CAO (segunda vez)
  + (10*P + I)                % PI
  = (1000*T + 100*E + 10*S + T);  % TEST (la T se repite al inicio y al final)

solve satisfy;

% Para contar cuántas soluciones hay, usamos --all-solutions y contamos
% O podemos añadir esto:
% constraint (C = ... ) /\ ...; % para fijar una solución específica

output [
  "   \(C)\(A)\(O)\n",
  "+  \(Z)\(H)\(I)\n",
  "+  \(C)\(A)\(O)\n",
  "+   \(P)\(I)\n",
  "---------\n",
  "= \(T)\(E)\(S)\(T)\n"
];
