
% Base de conocimientos: respuesta y su relación con un lugar
respuesta('montaña', montana).
respuesta('senderos y montañas', montana).
respuesta('tranquilo', montana).
respuesta('rural', rural).
respuesta('playa', playa).
respuesta('playa tranquila', playa).
respuesta('caminar en la playa', playa).
respuesta('surfear', playa).
respuesta('nadar', playa).
respuesta('tomar sol', playa).
respuesta('bosque', selva).
respuesta('selva', selva).
respuesta('explorar', selva).
respuesta('aventura', selva).
respuesta('escalar', montana).
respuesta('senderismo', montana).
respuesta('aire fresco', montana).
respuesta('paisajes impresionantes', montana).
respuesta('refugio en la montaña', montana).
respuesta('tranquilidad', montana).
respuesta('observación de aves', montana).
respuesta('ríos y lagos', montana).
respuesta('paseo en bicicleta', rural).
respuesta('granja', rural).
respuesta('campo abierto', rural).
respuesta('casa de campo', rural).
respuesta('silencio', rural).
respuesta('estrellas', rural).
respuesta('vida sencilla', rural).
respuesta('naturaleza', rural).
respuesta('buceo', playa).
respuesta('volleyball de playa', playa).
respuesta('fiesta en la playa', playa).
respuesta('atardecer en la playa', playa).
respuesta('arena blanca', playa).
respuesta('bronceado', playa).
respuesta('navegar', playa).
respuesta('pescar', playa).
respuesta('excursión en la selva', selva).
respuesta('animales exóticos', selva).
respuesta('humedad', selva).
respuesta('ríos', selva).
respuesta('flora', selva).
respuesta('aventura', selva).
respuesta('caminatas', selva).
respuesta('cascadas', selva).
respuesta('ir a la montaña', montana).
respuesta('ir a escalar', montana).
respuesta('escalar la montaña', montana).
respuesta('hacer senderismo en la montaña', montana).
respuesta('ir de paseo por la montaña', montana).
respuesta('caminar por la montaña', montana).
respuesta('hacer trekking', montana).
respuesta('explorar la montaña', montana).
respuesta('disfrutar de la montaña', montana).
respuesta('acampar en la montaña', montana).
respuesta('pasar tiempo en la montaña', montana).
respuesta('ir a la montaña', montana).
respuesta('visitar la montaña', montana).
respuesta('ver el amanecer en la montaña', montana).
respuesta('hacer un picnic en la montaña', montana).
respuesta('navegar en los lagos de la montaña', montana).
respuesta('tomar fotos en la montaña', montana).
respuesta('disfrutar de la vista en la montaña', montana).
respuesta('relajarse en la montaña', montana).
respuesta('participar en deportes de invierno', montana).
respuesta('esquiar', montana).
respuesta('hacer snowboard', montana).
respuesta('ir a un refugio en la montaña', montana).
respuesta('participar en un campamento de montaña', montana).
respuesta('ir a un festival en la montaña', montana).
respuesta('hacer avistamiento de aves en la montaña', montana).
respuesta('conectar con la naturaleza en la montaña', montana).
respuesta('participar en excursiones a la montaña', montana).
respuesta('practicar yoga en la montaña', montana).
respuesta('ir a un mirador', montana).
respuesta('hacer fotografía de paisajes en la montaña', montana).
respuesta('explorar senderos en la montaña', montana).
respuesta('disfrutar de la fauna de la montaña', montana).
respuesta('vivir una aventura en la montaña', montana).
respuesta('recoger flores en la montaña', montana).
respuesta('descansar en la montaña', montana).
respuesta('hacer un tour en la montaña', montana).
respuesta('nadar en lagos de la montaña', montana).
respuesta('ir de excursión a la montaña', montana).
respuesta('hacer fogatas en la montaña', montana).
respuesta('montañismo', montana).
respuesta('hacer una ruta en bicicleta en la montaña', montana).
respuesta('ir a ver cascadas en la montaña', montana).
respuesta('cazar en la montaña', montana).
respuesta('practicar escalada', montana).
respuesta('rappel', montana).
respuesta('explorar cuevas en la montaña', montana).
respuesta('senderismo', montana).
respuesta('hacer un viaje de aventura a la montaña', montana).
respuesta('escalar', montana).
respuesta('trecking', montana).
respuesta('playa con palmeras', playa).
respuesta('montañas nevadas', montana).
respuesta('pueblitos rurales', rural).
respuesta('selva tropical', selva).
respuesta('costa con acantilados', playa).
respuesta('picos altos', montana).
respuesta('aldeas pintorescas', rural).
respuesta('bosques espesos', selva).
respuesta('nadar en el mar', playa).
respuesta('esquiar en la nieve', montana).
respuesta('cultivar plantas', rural).
respuesta('explorar senderos', selva).
respuesta('hacer snorkel', playa).
respuesta('acampar en la montaña', montana).
respuesta('pasear a caballo', rural).
respuesta('avistamiento de fauna', selva).



% Inicialización de los contadores
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
    ( respuesta(Respuesta, Lugar) ->
        actualizar_contadores(Lugar)
    ; write('Respuesta no reconocida.'), nl
    ).

% Preguntar y manejar la respuesta
preguntar(Pregunta) :-
    write(Pregunta), nl,
    read(Respuesta),
    buscar_y_actualizar(Respuesta).

% Función principal para hacer las preguntas
realizar_preguntas :-
    preguntar('¿Qué planeas hacer en tus vacaciones?'),
    preguntar('¿Qué te gustaría hacer durante tu tiempo libre?'),
    preguntar('¿Qué lugares te resultan más atractivos?'),
    preguntar('¿Que actividades te gustarían realizar en ese lugar?').

% Determinar el destino final según el contador mas alto
determinar_destino(Destino) :-
    findall(Contador-Lugar, contador(Lugar, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Destino|_]).

% Ejecución inicial
preguntar_lugar :-
    realizar_preguntas,
    determinar_destino(Destino),
    write('El lugar recomendado es: '), write(Destino).
