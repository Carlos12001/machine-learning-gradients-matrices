function x = min_paraboloid(A, b)
  % MIN_PARABOLOID Encuentra el punto minimo de un paraboloide dado su 
  % coeficientes A y b
  %
  % min_paraboloid(A, b) toma como entrada una matriz A y un vector b 
  % para encontrar el punto minimo de un paraboloide. 
  % 
  % Parámetros de entrada:
  % A - Matriz de coeficientes que define la forma cuadrática del paraboloide.
  % b - Vector que define el mínimoimo lineal en la expresión del paraboloide.
  % 
  % Ejemplo de uso:
  % A = [2, 1; 1, 2];
  % b = [1; 2];
  % x = min_paraboloid(A, b);
  %
  % Nota: Esta función asume que las dimensiones de A y b son 2x2 y 2x1, 
  % respectivamente.

  x = -inv(A)*b;
endfunction