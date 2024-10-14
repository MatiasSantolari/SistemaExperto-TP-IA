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


listar_alojamientos([], Destino) :- nl.
listar_alojamientos([Alojamiento|Cola], Destino) :-
    alojamiento(Destino, Alojamiento, Costo),
    write(Alojamiento), write(': '), write(Costo), nl,
    listar_alojamientos(Cola, Destino).


listar_transportes([], Destino) :- nl.
listar_transportes([Transporte|Cola], Destino) :-
    transporte(Destino, Transporte, Costo),
    write(Transporte), write(': '), write(Costo), nl,
    listar_transportes(Cola, Destino).


listar_destinos(Destino, Lugar, Clima, Concurrencia):-
    destino(Destino,Lugar,Clima,Concurrencia),
    write('Podria interesarte viajar al Destino: '), write(Destino), nl,
    fail.
    
    
listar_destinos_2(Destino, Lugar, Clima, Concurrencia):-findall(Destino, destino(Destino,Lugar,Clima,Concurrencia), Destino),
    ( Destino = [] -> 
        write('Lo siento, parece que no hay destinos coincidentes con tus gustos. Probá más tarde y quizás encuentres nuevos e interesantes destinos que te maravillarán.'), nl,
        sistema_experto
    ; 
        write('Podría interesarte viajar a: '), nl,
        mostrar_lista(Destino)
    ).


preguntar_presupuesto(Presupuesto) :- 
    write('¿Qué monto de presupuesto manejas? (dolares): '), nl,
    repeat,
    write('Respuesta: '), nl,
    leer(Input), 
    atom_chars(Input, Chars), 
    validar_digitos(Chars),
    atom_number(Input, Presupuesto), 
    !.  

validar_digitos([]). 
validar_digitos([H|T]) :- 
    (   H='0'; H='1'; H='2'; H='3'; H='4'; H='5'; H='6'; H='7'; H='8'; H='9' 
    ->  validar_digitos(T) 
    ;   write('Por favor, ingresa un valor numérico válido.'), nl, fail
    ).


preguntar_duracion(Duracion) :-
    write('¿Por cuánto tiempo planeas quedarte como maximo? (en dias): '), nl,
        write('Respuesta: '), nl,
        leer(Input),
        atom_number(Input,Duracion).


preguntar_actividades(Destino, ActividadesElegidas) :-
    findall(A, actividad(Destino, A, _), Actividades),  % Encuentra todas las actividades para los destinos en la lista
    write('Las actividades disponibles en '), write(Destino), write(' son:'), nl,
    mostrar_lista(Actividades), nl,
    repeat,
    write('¿Cuáles te gustaría realizar? Escribe los nombres de las actividades elegidas. Ingresar (e) para salir: '), nl,
    leer(Actividad),
    (Actividad = 'e' ->  
        ActividadesElegidas = [], true
    ;   (member(Actividad, Actividades) ->      % Si la actividad se encuentra en la lista, se agrega a la lista de elegidas
            ActividadesElegidas = [Actividad | OtrasActividades],
            preguntar_mas_actividades(Actividades, OtrasActividades)
        ;   write('Esa actividad no existe para ese destino, probá con otro'), nl, fail
        )
    ).

preguntar_mas_actividades(Actividades, ActividadesElegidas) :-
    write('¿Quieres agregar más actividades? Ingresar (e) para salir: '), nl,
    leer(Actividad),
    (Actividad = 'e' ->  % Si el usuario ingresa 'e', terminar
        ActividadesElegidas = [], true
    ;   (member(Actividad, Actividades) ->  
            ActividadesElegidas = [Actividad | OtrasActividades],
            preguntar_mas_actividades(Actividades, OtrasActividades)
        ;   write('Esa actividad no existe para ese destino, probá con otro'), nl, fail
        )
    ).



preguntar_transporte(Destinos, Transporte, DestinosFiltrados) :-
    findall(T, (member(Destino, Destinos), transporte(Destino, T, _)), Transportes),
    write('Los transportes disponibles a estos destinos son: '), 
    mostrar_lista(Transportes), nl,
    repeat,
    write('¿En qué medio de transporte preferís viajar?'), nl,
    leer(Transporte),
    (member(Transporte, Transportes) ->
        true
    ;   write('Transporte no válido, intenta de nuevo.'), nl, fail),
    
    % Filtrar los destinos según el transporte elegido
    findall(D, (member(D, Destinos), transporte(D, Transporte, _)), DestinosFiltrados),
    !.


elegir_destino(DestinosFiltrados, Destino):-
    write('Los destinos que se ajustan a tus preferencias son '),
    mostrar_lista(DestinosFiltrados), nl,
    write('¿Cual destino te gustaría explorar?'),
    repeat,
    leer(Destino),
    (member(Destino, DestinosFiltrados)), !.
    

preguntar_alojamiento(Destino, Presupuesto, Alojamiento, CostoPorNoche) :-
    findall(Alojamiento, (alojamiento(Destino, Alojamiento, CostoNoche), CostoNoche =< Presupuesto), AlojamientosDisponibles), % solo los alojamientos considerando el presupuesto
    write('los alojamientos disponibles en '), write(Destino), write(' y sus costos por noche son:'), nl,
    listar_alojamientos(AlojamientosDisponibles, Destino), nl,
    repeat,
    write('¿Cual de los alojamientos prefiere?'), nl,
    leer(Alojamiento),
    (member(Alojamiento, AlojamientosDisponibles) -> 
        nl; 
        write('Lo siento, esa no es una opcion disponible.'), fail), 
    alojamiento(Destino, Alojamiento, CostoPorNoche).



destino_es_caro(Destino):- \+ tiene_actividades_baratas(Destino), alojamiento_es_caro(Destino).
destino_es_caro(Destino):- \+ tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_regular(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_regular(Destino).
destino_es_barato(Destino):- tiene_actividades_baratas(Destino), alojamiento_es_barato(Destino).


sistema_experto :-
    preguntar_destino(Destinos),
    preguntar_duracion(Duracion),
    preguntar_transporte(Destinos, Transporte, DestinosFiltrados),
    elegir_destino(DestinosFiltrados, Destino),
    preguntar_presupuesto(Presupuesto), 
    preguntar_actividades(Destino, ActividadesElegidas),

    % Calcular costos totales
    transporte(Destino, Transporte, CostoTransporte),
    findall(CostoActividad, (member(Actividad, ActividadesElegidas), actividad(Destino, Actividad, CostoActividad)), CostosActividades),
    sum_list(CostosActividades, TotalActividades),
    
    % Duración del viaje
    Noches is (Duracion - 1),

    preguntar_alojamiento(Destino, Presupuesto, AlojamientoRecomendado, CostoPorNoche),

    TotalCostoAlojamiento is CostoPorNoche * Noches,
    TotalCosto is CostoTransporte + TotalCostoAlojamiento + TotalActividades,

    % Resultado final
    write('Destino recomendado: '), write(Destino), nl,
    write('Transporte: '), write(Transporte), nl,
    write('Alojamiento: '), write(AlojamientoRecomendado), nl,
    write('Duración del viaje: '), write(Noches), write(' noches'), nl,
    write('Costo total de actividades: $'), write(TotalActividades), nl,
    write('Costo total estimado: $'), write(TotalCosto), nl.


