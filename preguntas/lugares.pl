
% Base de conocimientos: respuesta y su relacion con un lugar

respuesta_lugar('rural', rural).
respuesta_lugar('paseo en bicicleta', rural).
respuesta_lugar('granja', rural).
respuesta_lugar('campo abierto', rural).
respuesta_lugar('casa de campo', rural).
respuesta_lugar('silencio', rural).
respuesta_lugar('estrellas', rural).
respuesta_lugar('vida sencilla', rural).
respuesta_lugar('naturaleza', rural).
respuesta_lugar('pasear a caballo', rural).
respuesta_lugar('pueblitos rurales', rural).
respuesta_lugar('cultivar plantas', rural).
respuesta_lugar('aldeas pintorescas', rural).

respuesta_lugar('playa', playa).
respuesta_lugar('playa tranquila', playa).
respuesta_lugar('caminar en la playa', playa).
respuesta_lugar('surfear', playa).
respuesta_lugar('nadar', playa).
respuesta_lugar('buceo', playa).
respuesta_lugar('volleyball de playa', playa).
respuesta_lugar('fiesta en la playa', playa).
respuesta_lugar('atardecer en la playa', playa).
respuesta_lugar('arena blanca', playa).
respuesta_lugar('bronceado', playa).
respuesta_lugar('navegar', playa).
respuesta_lugar('pescar', playa).
respuesta_lugar('playa con palmeras', playa).
respuesta_lugar('costa con acantilados', playa).
respuesta_lugar('nadar en el mar', playa).
respuesta_lugar('hacer snorkel', playa).

respuesta_lugar('excursion en la selva', selva).
respuesta_lugar('animales exoticos', selva).
respuesta_lugar('humedad', selva).
respuesta_lugar('rios', selva).
respuesta_lugar('flora', selva).
respuesta_lugar('aventura', selva).
respuesta_lugar('caminatas', selva).
respuesta_lugar('cascadas', selva).
respuesta_lugar('tomar sol', playa).
respuesta_lugar('bosque', selva).
respuesta_lugar('selva', selva).
respuesta_lugar('explorar', selva).
respuesta_lugar('aventura', selva).
respuesta_lugar('avistamiento de fauna', selva).
respuesta_lugar('bosques espesos', selva).
respuesta_lugar('explorar senderos', selva).
respuesta_lugar('selva tropical', selva).

respuesta_lugar('escalar', montana).
respuesta_lugar('senderismo', montana).
respuesta_lugar('aire fresco', montana).
respuesta_lugar('paisajes impresionantes', montana).
respuesta_lugar('refugio en la montaña', montana).
respuesta_lugar('tranquilidad', montana).
respuesta_lugar('observacion de aves', montana).
respuesta_lugar('rios y lagos', montana).
respuesta_lugar('montaña', montana).
respuesta_lugar('senderos y montañas', montana).
respuesta_lugar('tranquilo', montana).
respuesta_lugar('ir a la montaña', montana).
respuesta_lugar('ir a escalar', montana).
respuesta_lugar('escalar la montaña', montana).
respuesta_lugar('hacer senderismo en la montaña', montana).
respuesta_lugar('ir de paseo por la montaña', montana).
respuesta_lugar('caminar por la montaña', montana).
respuesta_lugar('hacer trekking', montana).
respuesta_lugar('explorar la montaña', montana).
respuesta_lugar('disfrutar de la montaña', montana).
respuesta_lugar('acampar en la montaña', montana).
respuesta_lugar('pasar tiempo en la montaña', montana).
respuesta_lugar('ir a la montaña', montana).
respuesta_lugar('visitar la montaña', montana).
respuesta_lugar('ver el amanecer en la montaña', montana).
respuesta_lugar('hacer un picnic en la montaña', montana).
respuesta_lugar('navegar en los lagos de la montaña', montana).
respuesta_lugar('tomar fotos en la montaña', montana).
respuesta_lugar('disfrutar de la vista en la montaña', montana).
respuesta_lugar('relajarse en la montaña', montana).
respuesta_lugar('participar en deportes de invierno', montana).
respuesta_lugar('esquiar', montana).
respuesta_lugar('hacer snowboard', montana).
respuesta_lugar('ir a un refugio en la montaña', montana).
respuesta_lugar('participar en un campamento de montaña', montana).
respuesta_lugar('ir a un festival en la montaña', montana).
respuesta_lugar('hacer avistamiento de aves en la montaña', montana).
respuesta_lugar('conectar con la naturaleza en la montaña', montana).
respuesta_lugar('participar en excursiones a la montaña', montana).
respuesta_lugar('practicar yoga en la montaña', montana).
respuesta_lugar('ir a un mirador', montana).
respuesta_lugar('hacer fotografia de paisajes en la montaña', montana).
respuesta_lugar('explorar senderos en la montaña', montana).
respuesta_lugar('disfrutar de la fauna de la montaña', montana).
respuesta_lugar('vivir una aventura en la montaña', montana).
respuesta_lugar('recoger flores en la montaña', montana).
respuesta_lugar('descansar en la montaña', montana).
respuesta_lugar('hacer un tour en la montaña', montana).
respuesta_lugar('nadar en lagos de la montaña', montana).
respuesta_lugar('ir de excursion a la montaña', montana).
respuesta_lugar('hacer fogatas en la montaña', montana).
respuesta_lugar('montañismo', montana).
respuesta_lugar('hacer una ruta en bicicleta en la montaña', montana).
respuesta_lugar('ir a ver cascadas en la montaña', montana).
respuesta_lugar('cazar en la montaña', montana).
respuesta_lugar('practicar escalada', montana).
respuesta_lugar('rappel', montana).
respuesta_lugar('explorar cuevas en la montaña', montana).
respuesta_lugar('senderismo', montana).
respuesta_lugar('hacer un viaje de aventura a la montaña', montana).
respuesta_lugar('escalar', montana).
respuesta_lugar('trecking', montana).
respuesta_lugar('montañas nevadas', montana).
respuesta_lugar('picos altos', montana).
respuesta_lugar('esquiar en la nieve', montana).
respuesta_lugar('acampar en la montaña', montana).




% Inicializacion de los contadores
:- dynamic(contador/2).

% Hechos para los contadores, inicialmente todos en 0
contador(montana, 0).
contador(selva, 0).
contador(playa, 0).
contador(rural, 0).

% Actualiza el contador para el lugar correspondiente
actualizar_contadores(Lugar) :-
    retract(contador(Lugar, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador(Lugar, NuevoContador)).

% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar(Respuesta) :-
    ( respuesta_lugar(Respuesta, Lugar) ->
        actualizar_contadores(Lugar)
    ; write('Respuesta no reconocida.'), nl
    ).

% Preguntar y manejar la respuesta
preguntar(Pregunta) :-
    write(Pregunta), nl,
    read(Respuesta),
    buscar_y_actualizar(Respuesta).

% Funcion principal para hacer las preguntas
realizar_preguntas :-
    preguntar('¿Qué planeas hacer en tus vacaciones?'),
    preguntar('¿Qué te gustaria hacer durante tu tiempo libre?'),
    preguntar('¿Qué lugares te resultan más atractivos?'),
    preguntar('¿Que actividades te gustarian realizar en ese lugar?').

% Determinar el Lugar final según el contador mas alto
determinar_lugar(Lugar) :-
    findall(Contador-Lugar, contador(Lugar, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Lugar|_]).

% Ejecucion inicial
preguntar_lugar :-
    realizar_preguntas,
    determinar_lugar(Lugar),
    write('El tipo de lugar al que queres viajar es: '), write(Lugar).
