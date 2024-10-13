:- consult(['datos/transporte.pl',
'datos/actividades.pl',
'datos/alojamiento.pl',
'datos/destinos.pl',
'funciones_basicas.pl',
'preguntas/lugares.pl',
'preguntas/concurrencia.pl',
'preguntas/clima.pl']).

preguntar_destino(Destino):- 
    preguntar_lugar(Lugar),
    preguntar_clima(Clima),
    preguntar_concurrencia(Concurrencia),
    listar_destinos_2(Destino,Lugar,Clima,Concurrencia).


    

listar_destinos(Destino, Lugar, Clima, Concurrencia):-
    destino(Destino,Lugar,Clima,Concurrencia),
    write('Podria interesarte viajar al Destino: '), write(Destino), nl,
    fail.
    
listar_destinos_2(Destino, Lugar, Clima, Concurrencia):-findall(Destino, destino(Destino,Lugar,Clima,Concurrencia), Destino),
    write('Podria interesarte viajar a '),
    mostrar_lista(Destino).


preguntar_presupuesto(Presupuesto) :- 
    write('¿Qué monto de presupuesto manejas?(dolarucos):'), nl, 
        write('Respuesta: '), nl,
        leer(Presupuesto), nl.

preguntar_duracion(Duracion) :-
    write('¿Por cuánto tiempo planeas quedarte? (en dias): '), nl,
        write('Respuesta: '), nl,
        leer(Duracion).

preguntar_actividades(Destino, ActividadesElegidas) :-
    findall(A, actividad(Destino, A, _), Actividades),  % Encuentra todas las actividades para los destinos en la lista
    write('Las actividades disponibles en '), write(Destino), write(' son '),
    mostrar_lista(Actividades), nl,
    write('¿Cuáles te gustaría realizar? Escribe los nombres de las actividades elegidas (ej: esqui, senderismo): '), nl,
    leer(ActividadesElegidas).

preguntar_transporte(Destinos, Transporte):-
    findall(T, (member(Destino, Destinos), transporte(Destino, T, _)), Transportes),
    write('Los transportes disponibles a estos destinos son '), 
    mostrar_lista(Transportes), nl,  % Muestra la lista de transportes
    repeat,
    (write('¿En que medio de transporte preferis viajar?'),
    leer(Transporte),
    member(Transporte, Transportes)),!,
    %filtrar destinos segun el medio de transporte elegido
    findall(D, (member(Destino, Destinos), transporte(D, Transporte, _)), Destinos)
    % findall(Destino, (member(Destino, Destinos), transporte(Destino, Transporte, _)), NuevosDestinos),
    .

elegir_destino(Destinos, Destino):-
    write('Los destinos que se ajustan a tus preferencias son '),
    mostrar_lista(Destinos), nl,
    write('¿Cual destino te gustaría explorar?'),
    repeat,
    leer(Destino),
    (member(Destino, Destinos)), !.
    

recomendar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche) :-
    alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche).



% listar_actividades(Destino):- actividad(Destino, Actividad),
%                                writeln(Actividad),
%                                fail.
% listar_actividades(_).


destino_es_caro(Destino):- \+ tiene_actividades_baratas(Destino), alojamiento_es_caro(Destino).
destino_es_caro(Destino):- \+ tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_regular(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_barato(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_barato(Destino).


sistema_experto :-
    preguntar_destino(Destinos),
    preguntar_duracion(Duracion),
    preguntar_transporte(Destinos, Transporte),
    elegir_destino(Destinos, Destino),
    preguntar_actividades(Destino, ActividadesElegidas),

    % Calcular costos totales
    transporte(Destino, Transporte, CostoTransporte),
    findall(CostoActividad, (member(Actividad, ActividadesElegidas), actividad(Destino, Actividad, CostoActividad)), CostosActividades),
    sum_list(CostosActividades, TotalActividades),
    
    % Duración del viaje
    (Duracion = 3 -> Noches = 2 ; Duracion = 6 -> Noches = 5 ; Noches = 8),
    
    recomendar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche),
    
    TotalCostoAlojamiento is CostoPorNoche * Noches,
    TotalCosto is CostoTransporte + TotalCostoAlojamiento + TotalActividades,

    % Resultado final
    write('Destino recomendado: '), write(Destino), nl,
    write('Transporte elegido: '), write(TransporteElegido), nl,
    write('Alojamiento recomendado: '), write(AlojamientoRecomendado), nl,
    write('Duración del viaje: '), write(Noches), write(' noches'), nl,
    write('Total de actividades: '), write(TotalActividades), nl,
    write('Costo total estimado: $'), write(TotalCosto), nl.


