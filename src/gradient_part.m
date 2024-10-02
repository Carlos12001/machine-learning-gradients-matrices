function gradient_part
  display("\n\n-- Gradient Part --\n\n");

  % Punto 2: Dibujar un paraboloide
  display("Punto 2: Dibujar un paraboloide");
  A = [2  1; 1  2];
  b = [1; 2];
  range_x1 = linspace(-50, 50)';
  range_x2 = linspace(-50, 50)';
  plot_paraboloid(A, b, range_x1, range_x2);

  % Punto 3: Punto minimo de un paraboloide
  display("Punto 3: Punto minimo");
  x = min_paraboloid(A, b);
  display(x);

  % Punto 4: 3 ejemplos de paraboloides
  display("Punto 4: 3 ejemplos de paraboloides");

  % Ejemplo 1:  Matriz A igual a la matriz identidad escalada cI.
  c = 2;
  A = c*eye(2);
  title = sprintf("Paraboloide c=%d*I", c);
  plot_paraboloid(A, b, range_x1, range_x2, stitle=title);

  % Ejemplo 2: Matriz diagonal con dos elementos de la diagonal distintos.
  A = diag(diag(randi(10^c, 2)));
  title = sprintf("Paraboloide A=diag", c);
  plot_paraboloid(A, b, range_x1, range_x2, stitle=title);

  % Ejemplo 3: Matriz simétrica no diagonal, que debe ser positiva definida.
  A = [3 1; 1 3] ;
  title = sprintf("Paraboloide A=A'", c);
  plot_paraboloid(A, b, range_x1, range_x2, stitle=title);
 

  % Punto 5: funcion quiver() en Matriz 4.3
  display("Punto 5: Funcion quiver() en Matriz 4.3");
  % Se usan pocos punto para ver mejor la flechas
  range_x1 = linspace(-10, 10, 10)';
  range_x2 = linspace(-10, 10, 10)';
  A = [3 1; 1 3] ;
  plot_paraboloid_and_gradient(A, b, range_x1, range_x2);

endfunction
