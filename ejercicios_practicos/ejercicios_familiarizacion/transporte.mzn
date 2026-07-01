% ============================================
% PROBLEMA DE TRANSPORTE - 2 FÁBRICAS, 3 TIENDAS
% ============================================

% ---------- 1. DECLARACIÓN DE CONJUNTOS ----------
% Definimos los índices de fábricas y tiendas como conjuntos
% Esto hace el código más legible y escalable

enum FABRICAS = {F1, F2};
enum TIENDAS = {T1, T2, T3};

% ---------- 2. PARÁMETROS (DATOS DEL PROBLEMA) ----------
% Oferta: unidades disponibles en cada fábrica
int: oferta_F1 = 60;
int: oferta_F2 = 80;
% Lo ponemos en un arreglo indexado por fábricas para facilitar el modelo
array[FABRICAS] of int: oferta = [60, 80];

% Demanda: unidades requeridas en cada tienda
int: demanda_T1 = 40;
int: demanda_T2 = 50;
int: demanda_T3 = 50;
% Arreglo indexado por tiendas
array[TIENDAS] of int: demanda = [40, 50, 50];

% Matriz de costos: costo[i,j] = costo de enviar desde fábrica i a tienda j
% El orden de las filas es: F1, F2
% El orden de las columnas es: T1, T2, T3
array[FABRICAS, TIENDAS] of int: costo = 
  [| 3, 5, 6   % Fila F1: costos a T1, T2, T3
   | 2, 4, 2 |]; % Fila F2: costos a T1, T2, T3

% ---------- 3. VARIABLES DE DECISIÓN ----------
% x[i,j] = cantidad de unidades a enviar desde fábrica i a tienda j
% Son variables enteras no negativas
array[FABRICAS, TIENDAS] of var int: x;

% ---------- 4. RESTRICCIONES ----------
% Restricción 1: No se pueden enviar unidades negativas
% (implícito por "var int", pero lo forzamos con dominio)
constraint forall(i in FABRICAS, j in TIENDAS) ( x[i,j] >= 0 );

% Restricción 2: Límite de oferta de cada fábrica
% La suma de lo enviado desde cada fábrica NO puede superar su oferta
constraint forall(i in FABRICAS) (
  sum(j in TIENDAS) ( x[i,j] ) <= oferta[i]
);

% Restricción 3: Cumplir exactamente la demanda de cada tienda
% La suma de lo recibido en cada tienda DEBE ser igual a su demanda
constraint forall(j in TIENDAS) (
  sum(i in FABRICAS) ( x[i,j] ) = demanda[j]
);

% ---------- 5. FUNCIÓN OBJETIVO ----------
% Minimizar el costo total de transporte
% Costo total = sumatoria de (unidades enviadas * costo unitario)
var int: costo_total = sum(i in FABRICAS, j in TIENDAS) ( 
  x[i,j] * costo[i,j] 
);

% ---------- 6. DECLARACIÓN DEL PROBLEMA ----------
solve minimize costo_total;

% ---------- 7. SALIDA DE RESULTADOS ----------
output [
  "=== SOLUCIÓN ÓPTIMA ===\n",
  "\nUnidades enviadas desde cada fábrica a cada tienda:\n",
  "         T1  T2  T3\n",
  "F1:  ", show(x[F1, T1]), "   ", show(x[F1, T2]), "   ", show(x[F1, T3]), "\n",
  "F2:  ", show(x[F2, T1]), "   ", show(x[F2, T2]), "   ", show(x[F2, T3]), "\n",
  "\nCosto total mínimo: $", show(costo_total), "\n",
  "\n=== VERIFICACIÓN DE RESTRICCIONES ===\n",
  "Oferta F1: ", show(sum(j in TIENDAS)(x[F1,j])), " de 60\n",
  "Oferta F2: ", show(sum(j in TIENDAS)(x[F2,j])), " de 80\n",
  "Demanda T1: ", show(sum(i in FABRICAS)(x[i,T1])), " de 40\n",
  "Demanda T2: ", show(sum(i in FABRICAS)(x[i,T2])), " de 50\n",
  "Demanda T3: ", show(sum(i in FABRICAS)(x[i,T3])), " de 50\n"
];
