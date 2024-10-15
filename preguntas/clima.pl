:- consult('funciones_basicas.pl').
:- dynamic(contador_clima/2).

respuesta_clima('nieve', frio).
respuesta_clima('nevar', frio).
respuesta_clima('hielo', frio).
respuesta_clima('frio', frio).
respuesta_clima('ventoso', frio).
respuesta_clima('helado', frio).
respuesta_clima('frio extremo', frio).
respuesta_clima('frio moderado', frio).
respuesta_clima('frio intenso', frio).
respuesta_clima('invierno', frio).
respuesta_clima('bajo cero', frio).
respuesta_clima('temperatura fria', frio).
respuesta_clima('bajo cero', frio).
respuesta_clima('gelido', frio).
respuesta_clima('menos de 10 grados', frio).
respuesta_clima('temperatura baja', frio).
respuesta_clima('junio', frio).
respuesta_clima('julio', frio).
respuesta_clima('agosto', frio).
respuesta_clima('baja temperatura', frio).
respuesta_clima('bajas temperatuas', frio).

respuesta_clima('calor', calido).
respuesta_clima('calido', calido).
respuesta_clima('temperatura alta', calido).
respuesta_clima('temperaturas altas', calido).
respuesta_clima('calor extremo', calido).
respuesta_clima('calor moderado', calido).
respuesta_clima('calor intenso', calido).
respuesta_clima('tropical', calido).
respuesta_clima('verano', calido).
respuesta_clima('soleado', calido).
respuesta_clima('calor suave', calido).
respuesta_clima('despejado', calido).
respuesta_clima('alta humedad', calido).
respuesta_clima('calor humedo', calido).
respuesta_clima('calor seco', calido).
respuesta_clima('calido humedo', calido).
respuesta_clima('calido seco', calido).
respuesta_clima('mas de 30 grados', calido).
respuesta_clima('calor moderado', calido).
respuesta_clima('tropical humedo', calido).
respuesta_clima('diciembre', calido).
respuesta_clima('enero', calido).
respuesta_clima('febrero', calido).
respuesta_clima('marzo', calido).

respuesta_clima('templado', templado).
respuesta_clima('temperatura normal', templado).
respuesta_clima('clima templado', templado).
respuesta_clima('fresco', templado).
respuesta_clima('primavera', templado).
respuesta_clima('otoño', templado).
respuesta_clima('clima agradable', templado).
respuesta_clima('sin extremidades', templado).
respuesta_clima('moderado', templado).
respuesta_clima('calido', templado).
respuesta_clima('lluvia', templado).
respuesta_clima('nublado', templado).
respuesta_clima('neblina', templado).
respuesta_clima('humedad', templado).
respuesta_clima('clima seco', templado).
respuesta_clima('lluvioso', templado).
respuesta_clima('suave', templado).
respuesta_clima('septiembre', templado).
respuesta_clima('octubre', templado).
respuesta_clima('abril', templado).
respuesta_clima('mayo', templado).
respuesta_clima('ni frio ni calor', templado).




contador_clima(frio, 0).
contador_clima(templado, 0).
contador_clima(calido, 0).


preguntar_clima(Clima) :-
    realizar_preguntas_clima,
    determinar_clima(Clima),
    write('Buscaremos un lugar con clima '), write(Clima),nl.


realizar_preguntas_clima :-
    preguntar_cl('¿Como es tu clima ideal?'),
    preguntar_cl('¿En que momento del año te gustaría viajar?').


preguntar_cl(Pregunta) :-
    repeat,
    write(Pregunta), nl,
    leer(Respuesta),
    ( buscar_y_actualizar_cl(Respuesta)),!.


% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar_cl(Respuesta) :-
    ( respuesta_clima(Respuesta, Clima) ->
        actualizar_contadores_cl(Clima) ; 
        write('Lo siento, no entendi tu respuesta.'), nl, fail).


% Actualiza el contador para el Clima correspondiente
actualizar_contadores_cl(Clima) :-
    retract(contador_clima(Clima, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador_clima(Clima, NuevoContador)).


% Determinar el Clima final segun el contador mas alto
determinar_clima(Clima) :-
    findall(Contador-Clima, contador_clima(Clima, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Clima|_]).
