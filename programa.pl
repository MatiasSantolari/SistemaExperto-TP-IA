:-dynamic(destino/4).
:-dynamic(actividad/3).
:-dynamic(alojamiento/4).
:-dynamic(transporte/3).
:-dynamic(funciones_basicas/3).


preguntar_destino(Destino):- 
    write('¿Te gustaría visitar un lugar de Montaña, Playa, Rural o Selva? '), nl,
        write('1-Montaña'), nl,
        write('2-Playa'), nl,
        write('3-Rural'), nl,
        write('4-Selva'), nl,
        write('Ingrese la opcion que mas prefiera: '),
        leer(Lugarm), nl,nl,
    write('¿Prefieres un clima Frío, Cálido o Templado? '), nl,
        write('1-Frio'), nl,
        write('2-Calido'), nl,
        write('3-Templado'), nl,
        write('Ingrese la opcion que mas prefiera: '),
        leer(Clima), nl,nl,
    write('¿Te gustaría que el lugar fuera Muy, Medio o Poco turístico? '), nl,
        write('1-Muy Turistico'), nl,
        write('2-Medio Turistico'), nl,
        write('3-Poco Turistico'), nl,
        write('Ingrese la opcion que mas prefiera: '),
        leer(Turismo), nl,nl,
    preguntar_presupuesto(Presupuesto),
    listar_destinos(Destino, Lugar, Clima, Turismo).

listar_destinos(Destino, Lugar, Clima, Turismo):-destino(Destino,Lugar,Clima,Turismo),
    write(Destino), nl,
    fail.
    
listar_destinos_2(Destino, Lugar, Clima, Turismo):-findall(Destino, destino(Destino,Lugar,Clima,Turismo), Destino).

preguntar_presupuesto(Presupuesto) :- 
    write('¿Qué tipo de presupuesto manejas?'), nl, 
        write('1- Bajo (menos de $500)'), nl,
        write('2- Medio (entre $500 y $1500)'), nl,
        write('3- Alto (más de $1500)'), nl,
        leer(Presupuesto), nl.

preguntar_duracion(Duracion) :-
    write('¿Por cuánto tiempo planeas quedarte? (Corto, Medio, Largo): '), nl,
        write('1- Corto (2-3 Dias)'), nl,
        write('2- Medio (4-7 Dias)'), nl,
        write('3- Largo (Más de 7 Dias)'), nl,
        leer(Duracion).

preguntar_actividades(Destino, ActividadesElegidas) :-
    findall(A, actividad(Destino, A, _), Actividades),
    write('Estas son las actividades disponibles en '), write(Destino), write(': '), nl,
    write(Actividades), nl,
    write('¿Cuáles te gustaría realizar? Escribe los nombres de las actividades elegidas (ej: esqui, senderismo): '), nl,
    leer(ActividadesElegidas).

preguntar_transporte(Destino, TransporteElegido) :-
    write('¿Cómo te gustaría viajar al destino? (Avión, Colectivo, Auto): '), nl,
        write('1- Avion'), nl,
        write('2- Colectivo'), nl,
        write('3- Auto'), nl,
        leer(TransporteElegido).

recomendar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche) :-
    alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche).



% listar_actividades(Destino):- actividad(Destino, Actividad),
%                                writeln(Actividad),
%                                fail.
% listar_actividades(_).

sistema_experto :-
    consult(['datos/transporte.pl',
    'datos/actividades.pl',
    'datos/alojamiento.pl',
    'datos/destinos.pl',
    'funciones_basicas.pl']),
    
    

    preguntar_destino(Destino),
    % listar_actividades(Destino),
    preguntar_duracion(Duracion),
    preguntar_actividades(Destino, ActividadesElegidas),
    preguntar_transporte(Destino, TransporteElegido),

    % Calcular costos totales
    transporte(Destino, TransporteElegido, CostoTransporte),
    findall(CostoActividad, (member(Actividad, ActividadesElegidas), actividad(Destino, Actividad, CostoActividad)), CostosActividades),
    sum_list(CostosActividades, TotalActividades),
    
    % Duración del viaje
    (Duracion = corto -> Noches = 2 ; Duracion = medio -> Noches = 5 ; Noches = 8),
    
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
