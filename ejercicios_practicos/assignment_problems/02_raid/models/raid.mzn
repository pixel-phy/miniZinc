% Datos de entrada
int: l;                      % mínimo de guerreros
int: u;                      % máximo de guerreros
int: m;                      % máximo de pares que se odian
enum WARRIOR;               % tipo enumerado de guerreros
WARRIOR: dummy;             % guerrero dummy
array[WARRIOR] of int: strength;  % fuerza de cada guerrero
enum CLAN;                  % tipo enumerado de clanes
array[WARRIOR] of CLAN: clan;     % clan de cada guerrero
array[CLAN, CLAN] of 0..1: hates; % odio entre clanes

% Variables de decisión
var set of WARRIOR: raid;
var int: obj;

% Restricción: tamaño del raid entre l y u
constraint card(raid) >= l;
constraint card(raid) <= u;

% Restricción: no incluir al dummy
constraint not (dummy in raid);

% Calcular el número de pares que se odian en el raid
var int: hatredPairs = 
  sum(i in raid, j in raid where i < j) (hates[clan[i], clan[j]]);

% Restricción: no más de m pares que se odian
constraint hatredPairs <= m;

% Objetivo: maximizar la suma de fuerzas
constraint obj = sum(i in raid) (strength[i]);

% Maximizar la fuerza total
solve maximize(obj);

% Salida
output [
  "raid = {", 
  show(raid), 
  "};\n",
  "obj = ", show(obj), ";\n",
  "hatredPairs = ", show(hatredPairs), ";\n"
];
