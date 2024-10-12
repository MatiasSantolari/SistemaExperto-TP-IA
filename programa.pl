preguntar_destino(Destino):- 
    elegir_lugar(Lugar), nl,nl,
    write('¿Prefieres un clima frío, cálido o templado? '), nl,
        write('Respuesta: '),
        leer(Clima), nl,nl,
    write('¿Te gustaría que el lugar fuera muy, medio o poco concurrido? '), nl,
        write('Respuesta: '),
        leer(Turismo), nl,nl,
    preguntar_presupuesto(Presupuesto), % agregar a listar destino
    listar_destinos(Destino, Lugar, Clima, Turismo).


    

listar_destinos(Destino, Lugar, Clima, Turismo):-destino(Destino,Lugar,Clima,Turismo),
    write(Destino), nl,
    fail.
    
listar_destinos_2(Destino, Lugar, Clima, Turismo):-findall(Destino, destino(Destino,Lugar,Clima,Turismo), Destino).

preguntar_presupuesto(Presupuesto) :- 
    write('¿Qué monto de presupuesto manejas?(dolarucos):'), nl, 
        write('Respuesta: '), nl,
        leer(Presupuesto), nl.

preguntar_duracion(Duracion) :-
    write('¿Por cuánto tiempo planeas quedarte? (en dias): '), nl,
        write('Respuesta: '), nl,
        leer(Duracion).

preguntar_actividades(Destino, ActividadesElegidas) :-
    findall(A, actividad(Destino, A, _), Actividades),
    write('Estas son las actividades disponibles en '), write(Destino), write(': '), nl,
    write(Actividades), nl,
    write('¿Cuáles te gustaría realizar? Escribe los nombres de las actividades elegidas (ej: esqui, senderismo): '), nl,
    leer(ActividadesElegidas).

recomendar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche) :-
    alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche).



% listar_actividades(Destino):- actividad(Destino, Actividad),
%                                writeln(Actividad),
%                                fail.
% listar_actividades(_).

consult(['datos/transporte.pl',
'datos/actividades.pl',
'datos/alojamiento.pl',
'datos/destinos.pl',
'funciones_basicas.pl',
'preguntas/lugares.pl',
'preguntas/transporte.pl']).
destino_es_caro(Destino):- !tiene_actividades_baratas(Destino), alojamiento_es_caro(Destino).
destino_es_caro(Destino):- !tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_regular(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_barato(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_barato(Destino).



sistema_experto :-
    preguntar_destino(Destino),
    % listar_actividades(Destino),
    preguntar_duracion(Duracion),
    preguntar_actividades(Destino, ActividadesElegidas),
    preguntar_transporte(TransporteElegido).

    % Calcular costos totales
    transporte(Destino, TransporteElegido, CostoTransporte),
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


