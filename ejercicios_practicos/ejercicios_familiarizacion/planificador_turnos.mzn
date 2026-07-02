% Problema de programación de enfermeros - Clínica 24 horas
% 6 turnos de 4 horas cada uno

% Variables de decisión: número de enfermeros que empiezan en cada turno
var int: X1;
var int: X2;
var int: X3;
var int: X4;
var int: X5;
var int: X6;

% Dominios (asumimos que no pueden ser negativos y ponemos un límite superior razonable)
constraint X1 >= 0;
constraint X2 >= 0;
constraint X3 >= 0;
constraint X4 >= 0;
constraint X5 >= 0;
constraint X6 >= 0;

% Restricciones de cobertura por turno (mínimos requeridos)
% Turno 1 (00:00-04:00): trabajan los que empiezan en X1 y los que empezaron en X6
constraint X6 + X1 >= 4;

% Turno 2 (04:00-08:00): trabajan X1 + X2
constraint X1 + X2 >= 8;

% Turno 3 (08:00-12:00): trabajan X2 + X3
constraint X2 + X3 >= 10;

% Turno 4 (12:00-16:00): trabajan X3 + X4
constraint X3 + X4 >= 7;

% Turno 5 (16:00-20:00): trabajan X4 + X5
constraint X4 + X5 >= 12;

% Turno 6 (20:00-00:00): trabajan X5 + X6
constraint X5 + X6 >= 4;

% Función objetivo: minimizar el total de enfermeros contratados
var int: total = X1 + X2 + X3 + X4 + X5 + X6;
solve minimize total;

% Mostrar resultados
output [
  "X1 = ", show(X1), "\n",
  "X2 = ", show(X2), "\n",
  "X3 = ", show(X3), "\n",
  "X4 = ", show(X4), "\n",
  "X5 = ", show(X5), "\n",
  "X6 = ", show(X6), "\n",
  "Total de enfermeros = ", show(total), "\n",
  "\nVerificación de cobertura:\n",
  "Turno 1 (X6+X1): ", show(X6+X1), " >= 4\n",
  "Turno 2 (X1+X2): ", show(X1+X2), " >= 8\n",
  "Turno 3 (X2+X3): ", show(X2+X3), " >= 10\n",
  "Turno 4 (X3+X4): ", show(X3+X4), " >= 7\n",
  "Turno 5 (X4+X5): ", show(X4+X5), " >= 12\n",
  "Turno 6 (X5+X6): ", show(X5+X6), " >= 4\n"
];
