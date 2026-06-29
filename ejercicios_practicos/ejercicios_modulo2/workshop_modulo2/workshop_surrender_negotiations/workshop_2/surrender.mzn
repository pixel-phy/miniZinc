% Datos de entrada
int: l;                      % mínimo de negociadores
int: u;                      % máximo de negociadores
int: m;                      % fuerza mínima de negociación requerida
enum NEGOTIATOR;            % tipo enumerado de negociadores
NEGOTIATOR: dummy;          % negociador dummy (valor más bajo)
array[NEGOTIATOR] of int: honor;   % honor de cada negociador
array[NEGOTIATOR, NEGOTIATOR] of int: joint;  % fuerza de negociación por par

% Variables de decisión - representación con conjunto
var set of NEGOTIATOR: party;

% Restricción: tamaño del partido entre l y u
constraint card(party) >= l;
constraint card(party) <= u;

% Restricción: no incluir al dummy
constraint not (dummy in party);

% Calcular la fuerza total de negociación (suma de todos los pares)
var int: totalStrength = 
  sum(i in party, j in party where i < j) (joint[i, j]);

% Restricción: la fuerza total debe ser al menos m
constraint totalStrength >= m;

% Variable objetivo: maximizar el honor mínimo del partido
var int: obj = min(i in party) (honor[i]);

% Restricción adicional: asegurar que obj sea el mínimo honor
constraint forall(i in party) (honor[i] >= obj);
constraint exists(i in party) (honor[i] = obj);

% Objetivo: maximizar el honor mínimo
solve maximize(obj);

% Salida
output [
  "party = {", 
  show(party), 
  "};\n",
  "obj = ", show(obj), ";\n",
  "totalStrength = ", show(totalStrength), ";\n"
];
