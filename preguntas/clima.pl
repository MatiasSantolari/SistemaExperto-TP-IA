:- consult('funciones_basicas.pl').


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
respuesta_clima('mayo', frio).
respuesta_clima('junio', frio).
respuesta_clima('julio', frio).
respuesta_clima('agosto', frio).

respuesta_clima('calor', calor).
respuesta_clima('temperatura alta', calor).
respuesta_clima('calor extremo', calor).
respuesta_clima('calor moderado', calor).
respuesta_clima('calor intenso', calor).
respuesta_clima('tropical', calor).
respuesta_clima('verano', calor).
respuesta_clima('soleado', calor).
respuesta_clima('calor suave', calor).
respuesta_clima('despejado', calor).
respuesta_clima('alta humedad', calor).
respuesta_clima('calido humedo', calor).
respuesta_clima('calido seco', calor).
respuesta_clima('mas de 30 grados', calor).
respuesta_clima('calido moderado', calor).
respuesta_clima('tropical humedo', calor).
respuesta_clima('diciembre', calor).
respuesta_clima('enero', calor).
respuesta_clima('febrero', calor).
respuesta_clima('marzo', calor).

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




:- dynamic(contador/2).

contador(frio, 0).
contador(templado, 0).
contador(calor, 0).


preguntar_clima(Clima) :-
    realizar_preguntas,
    determinar_clima(Clima),
    write('Buscaremos un lugar con clima '), write(Clima),nl.


realizar_preguntas :-
    preguntar('¿Como es tu clima ideal?'),
    preguntar('¿En que momento del año te gustaría viajar?').


% Preguntar y manejar la respuesta
preguntar(Pregunta) :-
    repeat,
    write(Pregunta), nl,
    leer(Respuesta),
    ( buscar_y_actualizar(Respuesta)).


% Buscar la respuesta del usuario y actualizar el contador
buscar_y_actualizar(Respuesta) :-
    ( respuesta_clima(Respuesta, Clima) ->
        actualizar_contadores(Clima) ; 
        write('Lo siento, no entendi tu respuesta.'), nl, fail).


% Actualiza el contador para el Clima correspondiente
actualizar_contadores(Clima) :-
    retract(contador(Clima, ContadorActual)),
    NuevoContador is ContadorActual + 1,
    assert(contador(Clima, NuevoContador)).


% Determinar el Clima final segun el contador mas alto
determinar_clima(Clima) :-
    findall(Contador-Clima, contador(Clima, Contador), Lista),
    sort(Lista, Ordenada),
    reverse(Ordenada, [_-Clima|_]).
