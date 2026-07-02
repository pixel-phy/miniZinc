% Problema del cajero automático - 4 clientes
% Modelamos los tiempos de inicio y fin como variables

% Datos fijos
int: n = 4;  % Número de clientes
array[1..n] of int: llegada = [2, 3, 8, 9];
array[1..n] of int: duracion = [4, 5, 2, 3];

% Variables de decisión
array[1..n] of var int: inicio;    % Minuto en que empieza cada cliente
array[1..n] of var int: fin;       % Minuto en que termina cada cliente
array[1..n] of var int: espera;    % Tiempo de espera
array[1..n] of var int: total;     % Tiempo total en sistema

% Restricciones
constraint
  % Cada cliente debe empezar después de su llegada
  forall(i in 1..n) (
    inicio[i] >= llegada[i]
  ) /\
  
  % El cajero solo atiende a uno a la vez (no hay solapamiento)
  % El cliente i+1 no puede empezar antes de que termine el cliente i
  forall(i in 1..n-1) (
    inicio[i+1] >= fin[i]
  ) /\
  
  % Relación fin = inicio + duración
  forall(i in 1..n) (
    fin[i] = inicio[i] + duracion[i]
  ) /\
  
  % Cálculo de espera y tiempo total
  forall(i in 1..n) (
    espera[i] = inicio[i] - llegada[i] /\
    total[i] = fin[i] - llegada[i]
  );

% Buscar cualquier solución (no hay función objetivo)
solve satisfy;

% Mostrar resultados en forma de tabla
output [
  "Cliente\tLlegada\tInicio\tEspera\tFin\tTotal\n"
] ++ [
  show(i) ++ "\t" ++ show(llegada[i]) ++ "\t" ++ 
  show(inicio[i]) ++ "\t" ++ show(espera[i]) ++ "\t" ++ 
  show(fin[i]) ++ "\t" ++ show(total[i]) ++ "\n"
  | i in 1..n
] ++ [
  "\n--- Estadísticas ---\n",
  "Espera promedio: ", show( (sum(i in 1..n)(espera[i])) div n ), "\n",
  "Total promedio: ", show( (sum(i in 1..n)(total[i])) div n )
];
