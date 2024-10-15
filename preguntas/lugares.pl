:- consult('funciones_basicas.pl').
% Base de conocimientos: respuesta y su relacion con un lugar
:- dynamic(contador_lugar/2).

respuesta_lugar('rural', campo).
respuesta_lugar('paseo en bicicleta', campo).
respuesta_lugar('granja', campo).
respuesta_lugar('campo abierto', campo).
respuesta_lugar('casa de campo', campo).
respuesta_lugar('silencio', campo).
respuesta_lugar('estrellas', campo).
respuesta_lugar('vida sencilla', campo).
respuesta_lugar('naturaleza', campo).
respuesta_lugar('pasear a caballo', campo).
respuesta_lugar('pueblitos campoes', campo).
respuesta_lugar('cultivar plantas', campo).
respuesta_lugar('aldeas pintorescas', campo).
respuesta_lugar('mirar el atardecer', campo).
respuesta_lugar('caminar por el campo', campo).


respuesta_lugar('playa', playa).
respuesta_lugar('playa tranquila', playa).
respuesta_lugar('caminar en la playa', playa).
respuesta_lugar('surfear', playa).
respuesta_lugar('nadar', playa).
respuesta_lugar('buceo', playa).
respuesta_lugar('nada', playa).
respuesta_lugar('volleyball de playa', playa).
respuesta_lugar('volleyball', playa).
respuesta_lugar('fiesta en la playa', playa).
respuesta_lugar('ir de fiesta', playa).
respuesta_lugar('festejar', playa).
respuesta_lugar('atardecer en la playa', playa).
respuesta_lugar('arena blanca', playa).
respuesta_lugar('bronceado', playa).
respuesta_lugar('navegar', playa).
respuesta_lugar('pescar', playa).
respuesta_lugar('lago', playa).
respuesta_lugar('playa con palmeras', playa).
respuesta_lugar('costa con acantilados', playa).
respuesta_lugar('nadar en el mar', playa).
respuesta_lugar('hacer snorkel', playa).
respuesta_lugar('ir de fiesta', playa).
respuesta_lugar('nadar en el mar', playa).
respuesta_lugar('tomar el sol', playa).
respuesta_lugar('surfear', playa).
respuesta_lugar('hacer snorkel', playa).
respuesta_lugar('relajarse en la playa', playa).
respuesta_lugar('hacer castillos de arena', playa).
respuesta_lugar('ir a la costa', playa).
respuesta_lugar('disfrutar del atardecer', playa).
respuesta_lugar('hacer un picnic', playa).
respuesta_lugar('jugar a la pelota', playa).
respuesta_lugar('pescar', playa).
respuesta_lugar('practicar buceo', playa).
respuesta_lugar('hacer yoga en la playa', playa).
respuesta_lugar('pasear por la orilla', playa).
respuesta_lugar('ir a un chiringuito', playa).
respuesta_lugar('leer en la playa', playa).
respuesta_lugar('hacer un barbacoa', playa).
respuesta_lugar('nadar con delfines', playa).
respuesta_lugar('ver a los surfers', playa).
respuesta_lugar('caminar en la arena', playa).
respuesta_lugar('ir de fiesta', playa).
respuesta_lugar('despertar temprano', playa).
respuesta_lugar('coleccionar conchas', playa).
respuesta_lugar('disfrutar de un buen libro', playa).
respuesta_lugar('hacer un tour en barco', playa).
respuesta_lugar('ir a la playa con amigos', playa).
respuesta_lugar('pasear en kayak', playa).
respuesta_lugar('ver una película al aire libre', playa).
respuesta_lugar('disfrutar de una bebida fría', playa).
respuesta_lugar('hacer deporte en la playa', playa).
respuesta_lugar('visitar el faro', playa).
respuesta_lugar('hacer un paseo en velero', playa).
respuesta_lugar('ir a la playa con la familia', playa).
respuesta_lugar('probar mariscos', playa).

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
respuesta_lugar('lago', selva).

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
respuesta_lugar('escalar', montana).
respuesta_lugar('senderismo', montana).
respuesta_lugar('aire fresco', montana).
respuesta_lugar('paisajes impresionantes', montana).
respuesta_lugar('refugio en la montana', montana).
respuesta_lugar('tranquilidad', montana).
respuesta_lugar('observacion de aves', montana).
respuesta_lugar('rios y lagos', montana).
respuesta_lugar('montana', montana).
respuesta_lugar('senderos y montanas', montana).
respuesta_lugar('tranquilo', montana).
respuesta_lugar('ir a la montana', montana).
respuesta_lugar('ir a escalar', montana).
respuesta_lugar('escalar la montana', montana).
respuesta_lugar('hacer senderismo en la montana', montana).
respuesta_lugar('ir de paseo por la montana', montana).
respuesta_lugar('caminar por la montana', montana).
respuesta_lugar('hacer trekking', montana).
respuesta_lugar('explorar la montana', montana).
respuesta_lugar('disfrutar de la montana', montana).
respuesta_lugar('acampar en la montana', montana).
respuesta_lugar('pasar tiempo en la montana', montana).
respuesta_lugar('ir a la montana', montana).
respuesta_lugar('visitar la montana', montana).
respuesta_lugar('ver el amanecer en la montana', montana).
respuesta_lugar('hacer un picnic en la montana', montana).
respuesta_lugar('navegar en los lagos de la montana', montana).
respuesta_lugar('tomar fotos en la montana', montana).
respuesta_lugar('disfrutar de la vista en la montana', montana).
respuesta_lugar('relajarse en la montana', montana).
respuesta_lugar('participar en deportes de invierno', montana).
respuesta_lugar('esquiar', montana).
respuesta_lugar('hacer snowboard', montana).
respuesta_lugar('ir a un refugio en la montana', montana).
respuesta_lugar('participar en un campamento de montana', montana).
respuesta_lugar('ir a un festival en la montana', montana).
respuesta_lugar('hacer avistamiento de aves en la montana', montana).
respuesta_lugar('conectar con la naturaleza en la montana', montana).
respuesta_lugar('participar en excursiones a la montana', montana).
respuesta_lugar('practicar yoga en la montana', montana).
respuesta_lugar('ir a un mirador', montana).
respuesta_lugar('hacer fotografia de paisajes en la montana', montana).
respuesta_lugar('explorar senderos en la montana', montana).
respuesta_lugar('disfrutar de la fauna de la montana', montana).
respuesta_lugar('vivir una aventura en la montana', montana).
respuesta_lugar('recoger flores en la montana', montana).
respuesta_lugar('descansar en la montana', montana).
respuesta_lugar('hacer un tour en la montana', montana).
respuesta_lugar('nadar en lagos de la montana', montana).
respuesta_lugar('ir de excursion a la montana', montana).
respuesta_lugar('hacer fogatas en la montana', montana).
respuesta_lugar('montanismo', montana).
respuesta_lugar('hacer una ruta en bicicleta en la montana', montana).
respuesta_lugar('ir a ver cascadas en la montana', montana).
respuesta_lugar('cazar en la montana', montana).
respuesta_lugar('practicar escalada', montana).
respuesta_lugar('rappel', montana).
respuesta_lugar('explorar cuevas en la montana', montana).
respuesta_lugar('senderismo', montana).
respuesta_lugar('hacer un viaje de aventura a la montana', montana).
respuesta_lugar('escalar', montana).
respuesta_lugar('trecking', montana).
respuesta_lugar('montanas nevadas', montana).
respuesta_lugar('picos altos', montana).
respuesta_lugar('esquiar en la nieve', montana).
respuesta_lugar('acampar en la montana', montana).


respuesta_lugar('pescar', campo).
respuesta_lugar('caminar', campo).
respuesta_lugar('explorar', campo).
respuesta_lugar('observar', campo).
respuesta_lugar('acampar', campo).
respuesta_lugar('visitar', campo).
respuesta_lugar('recorrer', campo).
respuesta_lugar('disfrutar', campo).
respuesta_lugar('comprar', campo).
respuesta_lugar('apreciar', campo).
respuesta_lugar('nadar', playa).
respuesta_lugar('bucear', playa).
respuesta_lugar('descansar', playa).
respuesta_lugar('jugar', playa).
respuesta_lugar('navegar', playa).
respuesta_lugar('explorar', selva).
respuesta_lugar('observar', selva).
respuesta_lugar('caminar', selva).
respuesta_lugar('navegar', selva).
respuesta_lugar('fotografiar', selva).
respuesta_lugar('escalar', montana).
respuesta_lugar('trepar', montana).
respuesta_lugar('caminar', montana).
respuesta_lugar('aclimatar', montana).
respuesta_lugar('descansar', montana).







contador_lugar(montana, 0).
contador_lugar(selva, 0).
contador_lugar(playa, 0).
contador_lugar(campo, 0).


preguntar_lugar(Lugar) :-
    realizar_preguntas_l,
    determinar_lugar(Lugar),
    write('Podria interesarte viajar a '), write(Lugar),nl.


realizar_preguntas_l :-
    preguntar_l('¿Qué planeas hacer en tus vacaciones?'),
    preguntar_l('¿Qué te gustaria hacer durante tu tiempo libre?'),
    preguntar_l('¿Qué lugares te resultan más atractivos?'),
    preguntar_l('¿Que actividades te gustarian realizar en ese lugar?').


preguntar_l(Pregunta) :-
    repeat,
    write(Pregunta), nl,
    leer(Respuesta),
    ( buscar_y_actualizar_l(Respuesta)), !.


% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar_l(Respuesta) :-
    ( respuesta_lugar(Respuesta, Lugar) ->
        actualizar_contadores_l(Lugar) ; 
        write('Lo siento, no entendi tu respuesta.'), nl, fail).


% Actualiza el contador para el lugar correspondiente
actualizar_contadores_l(Lugar) :-
    retract(contador_lugar(Lugar, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador_lugar(Lugar, NuevoContador)).


% Determinar el Lugar final según el contador mas alto
determinar_lugar(Lugar) :-
    findall(Contador-Lugar, contador_lugar(Lugar, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Lugar|_]).
