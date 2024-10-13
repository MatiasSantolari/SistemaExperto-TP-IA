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

preguntar_actividades(Destinos, ActividadesElegidas) :-
    findall(A, (member(Destino, Destinos), actividad(Destino, A, _)), Actividades),  % Encuentra todas las actividades para los destinos en la lista
    write('Estas son las actividades disponibles en '), nl,
    mostrar_lista(Destinos),  % Muestra la lista de destinos
    write(': '), nl,
    mostrar_lista(Actividades), nl,
    write('¿Cuáles te gustaría realizar? Escribe los nombres de las actividades elegidas (ej: esqui, senderismo): '), nl,
    leer(ActividadesElegidas).


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
    preguntar_destino(Destino),
    preguntar_duracion(Duracion),
    %preguntar_transporte(Transporte),
    %elegir_destino(D),
    %preguntar_actividades(D, ActividadesElegidas),

    % Calcular costos totales
    transporte(D, TransporteElegido, CostoTransporte),
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


