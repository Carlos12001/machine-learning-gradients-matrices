function define_positive_matrix_part
  display("\n\n-- Define Positive Matrix Part --\n\n");
  
  % Punto 3: Definir una matriz positiva definida
  display(["Punto 3: Generar un conjunto de Espacio Nulo con una matrix", 
          "positiva definida"]);
  z =  rand(3, 1);
  [V, N] = vectors_from_null_space(z);
endfunction