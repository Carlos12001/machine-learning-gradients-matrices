function plot_paraboloid(A, b, range_x1, range_x2, stitle='Paraboloide')
  %PLOT_PARABOLOID Grafica un paraboloide basado en los parámetros dados.
  %
  %   plot_paraboloid(A, b, range_x1, range_x2) toma como entrada una matriz A,
  %   un vector b, y rangos range_x1 y range_x2 para generar y graficar un
  %   paraboloide. Esta función es útil para visualizar superficies cuadráticas.
  %
  %   Parámetros de entrada:
  %   A - Matriz de coeficientes que define la forma cuadrática del paraboloide.
  %   b - Vector que define el término lineal en la expresión del paraboloide.
  %   range_x1 - Vector de rango para la variable x1, utilizado para generar la 
  %               malla de puntos.
  %   range_x2 - Vector de rango para la variable x2, utilizado para generar 
  %               la malla de puntos.
  %
  %   Ejemplo de uso:
  %   A = [2, 1; 1, 2];
  %   b = [1; 2];
  %   range_x1 = linspace(-10, 10, 100)';
  %   range_x2 = linspace(-10, 10, 100)';
  %   plot_paraboloid(A, b, range_x1, range_x2);
  %
  %   Nota: Esta función asume que las dimensiones de A y b son 2x2 y 2x1, 
  %   respectivamente.
  
  % Genera los valores de x1 y x2 para graficar la parabola
  % es como generador de puntos x1 y x2
  [x1, x2] = meshgrid(range_x1, range_x2);

  % Cada fila es un valor de x osea se tomo X(1,:) es como tomar
  %  un valor x' porque esta en fila 
  X = [x1(:), x2(:)];

  % Calcula la x'A 
  % La razon por la cual X no se vuelve a transponer
  % es porque cada fila de X es un x'
  XA = X * A;

  % Calcula la (x'A)x
  % Se hace el producto escalar entre XA y X
  % es una matriz no se puede usar dot
  % por lo que usa el producto de Hadamard para realizar la multiplicacion
  % entre XA y X
  % luego la suma fila osea ejemplo de toda la fila X(1,:)
  % esto es un producto punto echo a pata
  productXA_X = sum(XA .* X, 2);


  % Calcula b'x
  % Como esto es otro producto punto
  % Como X tiene ya todos transpuestos y el producto punto es 
  % conmutativo, entonces se la vuelta osea
  % x'b
  % y se obtiene producto punto por cada x1 y x2
  productB_X = X * b;

  % Se obtiene cada valor de la parabola
  f = 0.5 * productXA_X + productB_X;

  % f se ocupa como una matriz para cada par ordenado de (x1,2)
  % para poder graficarse
  z = reshape(f, size(x1));

  % Grafica la parabola
  font_size_letters = 32;
  font_size_numbers = 24;
  figure;
  surf(x1, x2, z);
  xlabel('x_1', 'FontSize', font_size_letters);
  ylabel('x_2', 'FontSize', font_size_letters);
  zlabel('f(x)', 'FontSize', font_size_letters);
  title(stitle, 'FontSize', font_size_letters, 'FontWeight', 'bold');
  set(gca, 'FontSize', font_size_numbers); 
  
endfunction
  
  
  