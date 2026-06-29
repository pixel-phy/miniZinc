% temperature_nd.mzn - Modelo sin control (solo evolución natural)

% Datos de entrada
int: start;                    % Temperatura inicial del edificio
array[int] of int: readings;   % Temperaturas exteriores por hora

% Parámetros derivados
int: H = length(readings);     % Número de horas

% Variables: temperatura del edificio en cada hora
array[0..H] of var int: temp;

% La temperatura inicial es start
constraint temp[0] = start;

% Evolución natural: temp[i] = floor((temp[i-1] + readings[i]) / 2)
constraint forall(i in 1..H)(
    temp[i] = (temp[i-1] + readings[i]) div 2
);

solve satisfy;

% Salida: array de temperaturas
output ["temp = \(temp)"];
