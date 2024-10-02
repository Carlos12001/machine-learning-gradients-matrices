function normal_equation_part
  display("\n\n-- Normal Equation Part --\n\n");

  % Punto 1: Encontrar los parametros de la ecuación normal, de la
  % matrix A = [3 1; 1 3] y el vector b = [1; 2]
  display(["Punto 1: Encontrar los parametros de la ecuación normal",
          " de la matrix A = [3 1; 1 3] y el vector b = [1; 2]"]);

  A = [3 1; 1 3];
  b = [1; 2];
  range_x1 = range_x2 = linspace(-10, 10, 10)';

  [a, x1, x2, z] = generated_normal_equation_part(A, b, range_x1, range_x2);
  display(a);


endfunction

function [a, x1, x2, z] = generated_normal_equation_part(A, b, range_x1, range_x2)
  [x1, x2] = meshgrid(range_x1, range_x2);
  x = [x1(:) x2(:)];
  f = 0.5*sum((x*A).*x,2) + x*b;
  z = reshape(f, size(x1));

  % Matrix de diseno
  X = [ones(size(x1(:))) x1(:) x2(:)];

  % Calcula los valores de la ecuacion normal
  a = pinv(X) * f;

  stitle = "Parabola and Plano Normal Equation";
  font_size_letters = 32;
  font_size_numbers = 24;
  figure;
  surf(x1, x2, z);
  hold on;
  xlabel('x_1', 'FontSize', font_size_letters);
  ylabel('x_2', 'FontSize', font_size_letters);
  zlabel('f(x)', 'FontSize', font_size_letters);
  title(stitle, 'FontSize', font_size_letters, 'FontWeight', 'bold');
  set(gca, 'FontSize', font_size_numbers); 
  

  % Grafica la ecuacion normal
  az = a(1) + a(2)*x1 + a(3)*x2;
  z_p = reshape(az, size(x1));
  surf(x1,x2,z_p, 'FaceColor', 1/255*[237, 55, 91]);
  hold off;

endfunction

