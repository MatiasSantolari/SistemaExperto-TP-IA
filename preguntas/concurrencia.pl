:- consult('funciones_basicas.pl').

respuesta_concurrencia('tranquilo', baja_concurrencia).
respuesta_concurrencia('poca gente', baja_concurrencia).
respuesta_concurrencia('poca', baja_concurrencia).
respuesta_concurrencia('ninguna', baja_concurrencia).
respuesta_concurrencia('pueblo', baja_concurrencia).
respuesta_concurrencia('cabaña', baja_concurrencia).
respuesta_concurrencia('naturaleza', baja_concurrencia).
respuesta_concurrencia('retiro', baja_concurrencia).
respuesta_concurrencia('fuera de la ciudad', baja_concurrencia).
respuesta_concurrencia('zona rural', baja_concurrencia).
respuesta_concurrencia('lugar solitario', baja_concurrencia).
respuesta_concurrencia('pueblo pequeño', baja_concurrencia).
respuesta_concurrencia('alojamiento en la montaña', baja_concurrencia).
respuesta_concurrencia('alojamiento rural', baja_concurrencia).
respuesta_concurrencia('festival rural', baja_concurrencia).

respuesta_concurrencia('normal', media_concurrencia).
respuesta_concurrencia('camping', media_concurrencia).
respuesta_concurrencia('hostel', media_concurrencia).
respuesta_concurrencia('cabaña compartida', media_concurrencia).
respuesta_concurrencia('apartamento', media_concurrencia).
respuesta_concurrencia('alojamiento familiar', media_concurrencia).
respuesta_concurrencia('casita', media_concurrencia).
respuesta_concurrencia('campamento', media_concurrencia).

respuesta_concurrencia('turistico', alta_concurrencia).
respuesta_concurrencia('ciudad', alta_concurrencia).
respuesta_concurrencia('mucha gente', alta_concurrencia).
respuesta_concurrencia('mucha', alta_concurrencia).
respuesta_concurrencia('hotel', alta_concurrencia).
respuesta_concurrencia('zona comercial', alta_concurrencia).
respuesta_concurrencia('centro de la ciudad', alta_concurrencia).
respuesta_concurrencia('parque tematico', alta_concurrencia).
respuesta_concurrencia('zona de fiesta', alta_concurrencia).
respuesta_concurrencia('resort', alta_concurrencia).
respuesta_concurrencia('area metropolitana', alta_concurrencia).
respuesta_concurrencia('multitud', alta_concurrencia).



:- dynamic(contador/2).

contador(alta_concurrencia, 0). % alta concurrencia
contador(media_concurrencia, 0). % media concurrencia
contador(baja_concurrencia, 0). % baja concurrencia


preguntar_concurrencia(Concurrencia) :-
    realizar_preguntas,
    determinar_Concurrencia(Concurrencia),
    write('Parece que te gusta viajar a lugares con '), write(Concurrencia),nl.


realizar_preguntas :-
    preguntar('¿Te sentis a gusto en un lugar con mucha o poca gente?'),
    preguntar('¿Que atracciones te gustaria visitar?'),
    preguntar('¿Que tipo de alojamiento te gusta? Hotel, cabaña, camping u otro').


preguntar(Pregunta) :-
    repeat,
    write(Pregunta), nl,
    leer(Respuesta),
    ( buscar_y_actualizar(Respuesta)).


% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar(Respuesta) :-
    ( respuesta_concurrencia(Respuesta, Concurrencia) ->
        actualizar_contadores(Concurrencia) ; 
        write('Lo siento, no entendi tu respuesta.'), nl, fail).


% Actualiza el contador para el Concurrencia correspondiente
actualizar_contadores(Concurrencia) :-
    retract(contador(Concurrencia, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador(Concurrencia, NuevoContador)).


% Determinar el Concurrencia final según el contador mas alto
determinar_Concurrencia(Concurrencia) :-
    findall(Contador-Concurrencia, contador(Concurrencia, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Concurrencia|_]).


