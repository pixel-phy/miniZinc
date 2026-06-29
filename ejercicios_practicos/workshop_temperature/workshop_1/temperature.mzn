% temperature.mzn - Modelo con acciones de control

% Datos de entrada
int: start;                    % Temperatura inicial del edificio
array[int] of int: readings;   % Temperaturas exteriores por hora

% Parámetros derivados
int: H = length(readings);     % Número de horas

% Acciones disponibles
enum ACTION = {do_nothing, heat, strong_heat, cool, strong_cool};

% Efectos de cada acción sobre la temperatura
array[ACTION] of int: effect = [0, 1, 4, -2, -5];

% Costos de cada acción
array[ACTION] of int: cost_action = [0, 1, 5, 3, 9];

% Variables: temperatura del edificio en cada hora
array[0..H] of var int: temp;

% Variables: acción tomada en cada hora (después de medir la temperatura)
array[1..H] of var ACTION: action;

% Variables: costo total
var int: total_cost;

% La temperatura inicial es start
constraint temp[0] = start;

% Evolución con control: primero evoluciona naturalmente, luego se aplica la acción
constraint forall(i in 1..H)(
    % La temperatura después de la evolución natural y la acción
    temp[i] = ((temp[i-1] + readings[i]) div 2) + effect[action[i]]
);

% Restricción: la temperatura debe estar en el rango 25-30
constraint forall(i in 0..H)(
    temp[i] >= 25 /\ temp[i] <= 30
);

% Cálculo del costo total
constraint total_cost = sum(i in 1..H)(cost_action[action[i]]);

% Minimizar el costo total
solve minimize total_cost;

% Salida: temperatura, acciones y costo
output [
    "temp = \(temp)\n",
    "choice = \(action)\n",
    "cost = \(total_cost)\n"
];
