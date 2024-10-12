preguntar_tieneAuto(Respuesta) :-
    write('¿Tenes automovil para el viaje?, puede ser tuyo o de algun acompañante): '), nl,
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

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

% Base de conocimientos: respuesta y su relacion con un lugar

respuesta_transporte('leer', tren).
respuesta_transporte('dormir', avion).
respuesta_transporte('escuchar música', cualquier_transporte).
respuesta_transporte('disfrutar del paisaje', tren).
respuesta_transporte('mirar por la ventana', auto).
respuesta_transporte('emocionado', auto).
respuesta_transporte('indiferente', cualquier_transporte).
respuesta_transporte('no me gusta', avion).
respuesta_transporte('rápido', avion).
respuesta_transporte('disfrutar del trayecto', tren).
respuesta_transporte('ambos', cualquier_transporte).
respuesta_transporte('comodidad', avion).
respuesta_transporte('rapidez', avion).
respuesta_transporte('paisaje', tren).
respuesta_transporte('experiencia', auto).
respuesta_transporte('avion', avion).
respuesta_transporte('tren', tren).
respuesta_transporte('auto', auto).
respuesta_transporte('colectivo', colectivo).

respuesta_transporte('leer un libro', tren).
respuesta_transporte('ver películas', avion).
respuesta_transporte('escuchar podcasts', cualquier_transporte).
respuesta_transporte('charlar con amigos', auto).
respuesta_transporte('contemplar el paisaje', tren).
respuesta_transporte('aventura', auto).
respuesta_transporte('aburrido', cualquier_transporte).
respuesta_transporte('mareo', avion).
respuesta_transporte('velocidad', avion).
respuesta_transporte('relajado', tren).
respuesta_transporte('viaje largo', auto).
respuesta_transporte('lujo', avion).
respuesta_transporte('eficiencia', avion).
respuesta_transporte('vistas', tren).
respuesta_transporte('aventura', auto).
respuesta_transporte('colectivo', colectivo).
respuesta_transporte('seguro', avion).
respuesta_transporte('viaje cómodo', tren).
respuesta_transporte('independiente', auto).

respuesta_transporte('jugar juegos', avion).
respuesta_transporte('meditar', tren).
respuesta_transporte('dormir siesta', avion).
respuesta_transporte('escuchar audiolibros', cualquier_transporte).
respuesta_transporte('tomar fotos', tren).
respuesta_transporte('relajado', auto).
respuesta_transporte('estresado', cualquier_transporte).
respuesta_transporte('prefiero evitar', avion).
respuesta_transporte('aprecio la rapidez', avion).
respuesta_transporte('me gusta el camino', tren).
respuesta_transporte('depende del ánimo', cualquier_transporte).
respuesta_transporte('priorizo comodidad', avion).
respuesta_transporte('necesito rapidez', avion).
respuesta_transporte('adoro el paisaje', tren).
respuesta_transporte('prefiero la experiencia', auto).
respuesta_transporte('confío en el avión', avion).
respuesta_transporte('prefiero el tren', tren).
respuesta_transporte('me siento seguro en auto', auto).
respuesta_transporte('colectivo es confiable', colectivo).

respuesta_transporte('mirar películas', avion).
respuesta_transporte('charlar', auto).
respuesta_transporte('escuchar música', tren).
respuesta_transporte('trabajar', avion).
respuesta_transporte('dibujar', tren).
respuesta_transporte('emocionado', auto).
respuesta_transporte('ansioso', cualquier_transporte).
respuesta_transporte('relajado', auto).
respuesta_transporte('rápido', avion).
respuesta_transporte('disfrutar', tren).
respuesta_transporte('depende', cualquier_transporte).
respuesta_transporte('completo comodidad', avion).
respuesta_transporte('prioridad rapidez', avion).
respuesta_transporte('paisaje', tren).
respuesta_transporte('aventura', auto).
respuesta_transporte('avion seguro', avion).
respuesta_transporte('confío en tren', tren).
respuesta_transporte('prefiero auto', auto).
respuesta_transporte('colectivo seguro', colectivo).

respuesta_transporte('escuchar música', tren).
respuesta_transporte('ver series', avion).
respuesta_transporte('mirar el paisaje', tren).
respuesta_transporte('hablar con amigos', auto).
respuesta_transporte('descansar', avion).
respuesta_transporte('jugar en el móvil', cualquier_transporte).
respuesta_transporte('aventura', auto).
respuesta_transporte('tedioso', cualquier_transporte).
respuesta_transporte('interesante', auto).
respuesta_transporte('monótono', avion).
respuesta_transporte('muy rápido', avion).
respuesta_transporte('me encanta el trayecto', tren).
respuesta_transporte('sin preferencia', cualquier_transporte).
respuesta_transporte('depende del destino', cualquier_transporte).
respuesta_transporte('maxima comodidad', avion).
respuesta_transporte('rapidez absoluta', avion).
respuesta_transporte('vistas espectaculares', tren).
respuesta_transporte('viaje cómodo', tren).
respuesta_transporte('aventura en camino', auto).
respuesta_transporte('más seguro', avion).
respuesta_transporte('tranquilidad', tren).
respuesta_transporte('prefiero coche', auto).
respuesta_transporte('confío en bus', colectivo).
respuesta_transporte('sin preferencia', cualquier_transporte).



% Inicializacion de los contadores
:- dynamic(contador/2).

% Hechos para los contadores, inicialmente todos en 0
contador(auto, 0).
contador(colectivo, 0).
contador(tren, 0).
contador(avion, 0).

% Actualiza el contador para el lugar correspondiente
actualizar_contadores(Transporte) :-
    retract(contador(Transporte, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador(Transporte, NuevoContador)).

% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar(Respuesta) :-
    ( respuesta_lugar(Respuesta, Transporte) ->
        actualizar_contadores(Transporte)
    ; write('Respuesta no reconocida.'), nl
    ).

% Preguntar y manejar la respuesta
preguntar(Pregunta) :-
    write(Pregunta), nl,
    read(Respuesta),
    buscar_y_actualizar(Respuesta).

% Funcion principal para hacer las preguntas
realizar_preguntas :-
    preguntar('¿Qué te gusta hacer durante un viaje largo?'),
    preguntar('¿Cómo te sientes sobre los viajes en carreteras?'),
    preguntar('¿Prefieres viajar rápido o disfrutar del trayecto?'),
    preguntar('¿Qué te parece más importante en un viaje: comodidad, rapidez o paisaje?'),
    preguntar('¿Qué medio de transporte crees que es más seguro?').

% Determinar el Transporte final según el contador mas alto
determinar_transporte(Trasporte) :-
    findall(Contador-Trasporte, contador(Transporte, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Trasporte|_]).

% Ejecucion inicial
preguntar_transporte :-
    realizar_preguntas,
    determinar_transporte(Trasporte),
    write('El tipo de trasporte al que queres viajar es: '), write(Trasporte).
