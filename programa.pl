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
    listar_destinos(Destino,Lugar,Clima,Concurrencia).


    

listar_destinos(Destino, Lugar, Clima, Concurrencia):-destino(Destino,Lugar,Clima,Concurrencia),
    write(Destino), nl,
    fail.
    
listar_destinos_2(Destino, Lugar, Clima, Concurrencia):-findall(Destino, destino(Destino,Lugar,Clima,Concurrencia), Destino).

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

preguntar_tieneAuto(Respuesta) :-
    write('¿Tenes automovil para el viaje?, puede ser suyo o de algun acompañante): '), nl,
        write('Respuesta: '), nl,
        leer(Respuesta),
        tieneAuto(Respuesta).

tieneAuto(si) :- comentarios_auto()
tieneAuto(no) :- preguntar_transporte(TransporteElegido)

% en caso de que tenga auto (despues para agregar completitud que dependan los consejos en base al lugar)
comentarios_auto() :-
    write('Entonces si tu idea es viajar con el auto nosotros podemos darte un estimado de lo que podrias llegar a gastar en conbustible.'), nl,
    write('Ademas te daremos algunos consejos para que el viaje sea seguro y controlado: '), nl,
    write('Hace el service completo de auto, mentene el seguro al dia, y fijate como tenes las llantas'), nl,
    % write('¿Que te parece? ¿queres seguir con el auto o te gustaría tercerizar el viaje?'), nl,
    % write('Respuesta: '), nl,
    % leer(ConfirmacionAuto).
    
% en caso de que no quiera viajar en auto o no tenga
preguntar_transporte(TransporteElegido) :-
    write('¿Cómo te gustaría viajar al destino entonces?, en esta compañia manejamos logistica para vuelos, viajes en micros, incluso en tren para algunos destinos'), nl,
        write('Respuesta: '), nl,
        leer(TransporteElegido).

recomendar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche) :-
    alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche).



% listar_actividades(Destino):- actividad(Destino, Actividad),
%                                writeln(Actividad),
%                                fail.
% listar_actividades(_).

destino_es_caro(Destino):- !tiene_actividades_baratas(Destino), alojamiento_es_caro(Destino).
destino_es_caro(Destino):- !tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_regular(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_barato(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_barato(Destino).


sistema_experto :-
    preguntar_destino(Destino),
    % listar_actividades(Destino),
    preguntar_duracion(Duracion),
    preguntar_actividades(Destino, ActividadesElegidas),
    preguntar_tieneAuto(TieneAutomovilONo),
    % preguntar_transporte(Destino, TransporteElegido),

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


