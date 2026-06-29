var 0..9: S;
var 0..9: E;
var 0..9: V;
var 0..9: N;
var 0..9: P;
var 0..9: A;
var 0..9: C;
var 0..9: R;


include "alldifferent.mzn";
constraint alldifferent([S, E, V, N, P, A, C, R]);

% Las primeras letras no pueden ser 0
constraint S > 0;
constraint P > 0;
constraint V > 0;

% SEVEN + PACES = VERSE
constraint
    10000*S + 1000*E + 100*V + 10*E + N   % SEVEN (E se repite)
  + 10000*P + 1000*A + 100*C + 10*E + S   % PACES (E y S se repiten)
  = 10000*V + 1000*E + 100*R + 10*S + E;  % VERSE (E, R, S)

% Maximizar VERSE (10000*V + 1000*E + 100*R + 10*S + E)
solve maximize 10000*V + 1000*E + 100*R + 10*S + E;

output [
  "   \(S)\(E)\(V)\(E)\(N)\n",
  "+  \(P)\(A)\(C)\(E)\(S)\n",
  "-----------\n",
  "=  \(V)\(E)\(R)\(S)\(E)\n",
  "\nVERSE = \(V)\(E)\(R)\(S)\(E)\n"
];
