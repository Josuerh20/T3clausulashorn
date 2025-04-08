% tipo de objeto
es_objeto(martillo).
es_objeto(silla).
es_objeto(mesa).
es_objeto(destornillador).
es_objeto(cuchara).

% materiales
material(martillo, metal).
material(destornillador, metal).
material(cuchara, plastico).
material(silla, madera).
material(mesa, madera).

% categorías
tipo(martillo, herramienta).
tipo(destornillador, herramienta).
tipo(cuchara, utensilio).
tipo(silla, mueble).
tipo(mesa, mueble).

% REGLAS 

% Un objeto es metálico si su material es metal
es_metalico(Objeto) :- 
    material(Objeto, metal).

% Un objeto es de madera si su material es madera
es_de_madera(Objeto) :- 
    material(Objeto, madera).

% Un objeto es herramienta si su tipo es herramienta
es_herramienta(Objeto) :- 
    tipo(Objeto, herramienta).

% Un objeto es utilizable si es herramienta o utensilio
es_utilizable(Objeto) :- 
    tipo(Objeto, herramienta).
es_utilizable(Objeto) :- 
    tipo(Objeto, utensilio).
