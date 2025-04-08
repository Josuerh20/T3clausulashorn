% HECHOS 

% Pacientes y síntomas
tiene_sintoma(ana, fiebre).
tiene_sintoma(ana, tos).
tiene_sintoma(luis, cansancio).
tiene_sintoma(luis, dolor_cabeza).
tiene_sintoma(marta, fiebre).
tiene_sintoma(marta, vomito).
tiene_sintoma(pedro, dolor_estomago).
tiene_sintoma(pedro, nauseas).

% Relación entre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
sintoma_de(dolor_cabeza, migraña).
sintoma_de(vomito, infeccion).
sintoma_de(nauseas, infeccion).
sintoma_de(dolor_estomago, gastritis).

% Medicamentos que eliminan síntomas (no curan la enfermedad completa)
elimina(aspirina, fiebre).
elimina(jarabe, tos).
elimina(vitaminas, cansancio).
elimina(analgesico, dolor_cabeza).
elimina(antiacido, dolor_estomago).
elimina(suero, vomito).
elimina(antibiotico, infeccion). % Excepción: puede eliminar la enfermedad completa


% REGLAS

% 1. Un paciente está enfermo si tiene un síntoma que pertenece a una enfermedad
tiene_enfermedad(Paciente, Enfermedad) :-
    tiene_sintoma(Paciente, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% 2. Un medicamento alivia una enfermedad si elimina al menos uno de sus síntomas
alivia(Medicamento, Enfermedad) :-
    elimina(Medicamento, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% 3. Se puede recetar un medicamento a un paciente si alivia una enfermedad que tiene
se_puede_recetar(Paciente, Medicamento) :-
    tiene_enfermedad(Paciente, Enfermedad),
    alivia(Medicamento, Enfermedad).

% 4. Un síntoma es severo si aparece en más de un paciente
sintoma_severo(Sintoma) :-
    tiene_sintoma(P1, Sintoma),
    tiene_sintoma(P2, Sintoma),
    P1 \= P2.

% 5. Un paciente tiene múltiples síntomas
paciente_con_multiples_sintomas(Paciente) :-
    tiene_sintoma(Paciente, S1),
    tiene_sintoma(Paciente, S2),
    S1 \= S2.

% 6. Una enfermedad es compleja si tiene más de un síntoma
enfermedad_compleja(Enfermedad) :-
    sintoma_de(S1, Enfermedad),
    sintoma_de(S2, Enfermedad),
    S1 \= S2.

% 7. Un medicamento sirve si elimina al menos un síntoma conocido
medicamento_util(Medicamento) :-
    elimina(Medicamento, _).

% 8. Un paciente tiene síntomas sin diagnóstico conocido
sintoma_sin_diagnostico(Paciente, Sintoma) :-
    tiene_sintoma(Paciente, Sintoma),
    \+ sintoma_de(Sintoma, _).

% 9. Un medicamento es multiusos si alivia más de una enfermedad
medicamento_multiusos(Medicamento) :-
    alivia(Medicamento, E1),
    alivia(Medicamento, E2),
    E1 \= E2.

% 10. Un paciente necesita suero si tiene vómito
necesita_suero(Paciente) :-
    tiene_sintoma(Paciente, vomito).
