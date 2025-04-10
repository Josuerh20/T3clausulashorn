% NOMBRES BINA: Ramirez Hernandez Josue, Zeron Lopez German Eduardo.
% NUMERO DE CONTROL BINA: 21200990 , 21200642
% Ejercicio 1

% HECHOS 
humano(socrates).
humano(platon).
ama(juan, maria).

mujer(_):- fail.
cientifico(_):- fail.
filosofo(_):- fail.
antiguo(_):- fail.


% REGLAS 

% 1. ¿Quiénes son mortales?
mortal(X) :- humano(X).

% 2. ¿Qué mujeres son científicas?
mujer_cientifica(X) :- mujer(X), cientifico(X).

% 3. ¿Quiénes son pensadores?
pensador(X) :- filosofo(X).
pensador(X) :- cientifico(X).

% 4. ¿Sócrates es sabio?
sabio(_):- fail.

% 5. ¿Qué humanos son antiguos?
humano_antiguo(X) :- humano(X), antiguo(X).

% 6. ¿Hay alguien que ame a María?
alguien_ama_a_maria(X) :- ama(X, maria).

% 7. ¿Quiénes son pensadores (filósofos o científicos)?
es_pensador(X) :- pensador(X).

% 8. ¿Qué filósofo es igual a Platón usando unificación?
igual_a_platon(X) :- filosofo(X), X = platon.



% CONSULTAS 

% ?- mortal(X).
% ?- mujer_cientifica(X).
% ?- pensador(X).
% ?- sabio(socrates).
% ?- humano_antiguo(X).
% ?- alguien_ama_a_maria(X).
% ?- es_pensador(X).
% ?- igual_a_platon(X).

%------------------------------------------------------------------------------------------------------------------------------------------------
% Ejercicio 2


% Reglas de las Torres de Hanoi

hanoi(N) :- mover(N, poste1, poste3, poste2).

mover(0,_,_,_).
mover(N,A,B,C) :-
    N > 0,
    M is N - 1,
    mover(M,A,C,B),
    escribir_mov(A,B),
    mover(M,C,B,A).

escribir_mov(Desde,Hasta) :-
    write('mover desde: '), write(Desde),
    write(' hasta: '), write(Hasta), nl.


% Hechos generados por hanoi(2)

movimiento(poste1, poste2).
movimiento(poste1, poste3).
movimiento(poste2, poste3).
