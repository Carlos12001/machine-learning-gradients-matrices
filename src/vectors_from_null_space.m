function [V, N] = vectors_from_null_space(z, numOfVectors=100)
  N = rand(size(z,1), 2);

  for j = 1:size(N, 2)
    N(:, j) = N(:, j) - (dot(z, N(:, j))/(dot(z,z)))*z;
  endfor

  % Obtiene los vectores de la base nula de A
  V = N * rand(size(N, 2), numOfVectors);
  
  
  % Revisa si efectivamente si los vectores pertenecen a la base
  % del espacio nulo de A
  A = z*z';
  for j = 1:numOfVectors
    if norm(A * V(:, j)) > 1e-10
      fprintf('El vector %d NO pertenece al espacio nulo de A.\n', j);
    else
      fprintf('El vector %d pertenece al espacio nulo de A.\n', j);
    endif
  endfor

  font_size_letters = 32;
  font_size_numbers = 24;
  figure;
  % Graficar el vector z
  quiver3(0, 0, 0, z(1), z(2), z(3), 0, 'r', 'LineWidth', 4);
  hold on;

  % Graficar los vectores base del espacio nulo
  quiver3(0, 0, 0, N(1,1), N(2,1), N(3,1), 0, 'g', 'LineWidth', 2);
  quiver3(0, 0, 0, N(1,2), N(2,2), N(3,2), 0, 'g', 'LineWidth', 2);

  % Graficar los 100 vectores en el espacio nulo
  for i = 1:100
      quiver3(0, 0, 0, V(1,i), V(2,i), V(3,i), 0, 'b', 'LineWidth', 1);
  end

  % Configuración adicional de la gráfica
  axis equal;
  xlabel('X', 'FontSize', font_size_letters);
  ylabel('Y', 'FontSize', font_size_letters);
  zlabel('Z', 'FontSize', font_size_letters);
  title('Espacio nulo y vector z', 'FontSize', font_size_letters, 'FontWeight', 'bold');
  set(gca, 'FontSize', font_size_numbers);
  legend({'Vector z', 'Bases del espacio nulo', 'Vectores en el espacio nulo'}, 'Location', 'best');

  hold off;
endfunction