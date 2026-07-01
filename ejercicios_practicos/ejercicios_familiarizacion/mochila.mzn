% Problema de la mochila
% Eres un excursionista que va a subir una montaña. 
% Tienes una mochila, pero tiene una capacidad máxima de peso de 15 kg. 
% Tienes a tu disposición 5 objetos que podrías llevar. 
% Cada objeto tiene un peso (lo que te cuesta llevarlo) y un valor/utilidad 
% (el beneficio que te da tenerlo en la cima). 
% Tu objetivo es seleccionar la combinación de objetos que maximice el valor 
% total sin superar el límite de peso de la mochila.

% Objeto A: Peso 2 kg Valor 10
% Objeto B: Peso 3 kg Valor 14
% Objeto C: Peso 4 kg Valor 16
% Objeto D: Peso 5 kg Valor 20
% Objeto E: Peso 9 kg Valor 30

% SOLUCIÓN

% ---------- DATOS DEL PROBLEMA ----------
% Capacidad máxima de la mochila en kg
int: capacidad = 15;

% Número de objetos disponibles
int: num_objetos = 5;

% Pesos de cada objeto en kg (orden: A, B, C, D, E)
array[1..num_objetos] of int: pesos = [2, 3, 4, 5, 9];

% Valores/Utilidad de cada objeto (orden: A, B, C, D, E)
array[1..num_objetos] of int: valores = [10, 14, 16, 20, 30];

% Nombres de los objetos (solo para visualización)
array[1..num_objetos] of string: nombres = ["A", "B", "C", "D", "E"];

% ---------- VARIABLES DE DECISIÓN ----------
% Variable binaria: 1 si llevamos el objeto i, 0 si no lo llevamos
array[1..num_objetos] of var 0..1: llevar;

% ---------- RESTRICCIONES ----------
% Restricción: El peso total no debe superar la capacidad de la mochila
constraint sum(i in 1..num_objetos) (pesos[i] * llevar[i]) <= capacidad;

% ---------- FUNCIÓN OBJETIVO ----------
% Maximizar el valor total de los objetos seleccionados
var int: valor_total = sum(i in 1..num_objetos) (valores[i] * llevar[i]);
solve maximize valor_total;

% ---------- SALIDA ----------
output [
  "Solución óptima:\n",
  "Objetos seleccionados: ",
  show([nombres[i] | i in 1..num_objetos where fix(llevar[i]) = 1]),
  "\n",
  "Peso total: ", show(sum(i in 1..num_objetos) (pesos[i] * fix(llevar[i]))), " kg\n",
  "Valor total: ", show(valor_total), "\n",
  "\nDetalle por objeto:\n",
  "Objeto | Peso | Valor | ¿Llevar?\n",
  "-------|------|-------|---------\n"
] ++ [
  show(nombres[i]) ++ "      | " ++
  show(pesos[i]) ++ "    | " ++
  show(valores[i]) ++ "    | " ++
  show(fix(llevar[i])) ++ "\n"
  | i in 1..num_objetos
];
