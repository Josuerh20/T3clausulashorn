come(gato, raton).
come(raton, queso).
es_animal(gato).
es_animal(raton).
es_animal(queso). % Solo como ejemplo, aunque queso no es animal

% reglas
% EL GATO COME QUESO
gato_come_queso_directamente :- 
    come(gato, queso).

% SI EL GATO COME RATON Y EL RATON COME QUESO
gato_come_queso_indirectamente :- 
    come(gato, raton), 
    come(raton, queso).
