% ACTIVIDADES EN CADA DESTINO CON PRECIOS
% ciudad, actividad, precio
% Actividades en Bariloche
actividad(bariloche, esqui, 50).
actividad(bariloche, senderismo, 20).
actividad(bariloche, pesca_deportiva, 30).
actividad(bariloche, mountain_bike, 25).

% Actividades en Ushuaia
actividad(ushuaia, esqui, 60).
actividad(ushuaia, trekking, 30).
actividad(ushuaia, navegacion, 50).

% Actividades en El Calafate
actividad(el_calafate, visita_glaciares, 70).
actividad(el_calafate, trekking, 40).
actividad(el_calafate, navegacion, 60).

% Actividades en Tilcara
actividad(tilcara, trekking, 25).
actividad(tilcara, arqueologia, 15).
actividad(tilcara, cabalgatas, 20).

% Actividades en San Mart�n de los Andes
actividad(san_martin_de_los_andes, senderismo, 30).
actividad(san_martin_de_los_andes, esqui, 70).
actividad(san_martin_de_los_andes, kayak, 40).

% Actividades en Mendoza
actividad(mendoza, visita_bodegas, 50).
actividad(mendoza, trekking, 30).

% Actividades en Cafayate
actividad(cafayate, degustacion_de_vinos, 20).
actividad(cafayate, senderismo, 15).

% Actividades en Salta
actividad(salta, trekking, 25).
actividad(salta, visitas_historicas, 15).
actividad(salta, rafting, 50).

% Actividades en Aconquija
actividad(aconquija, trekking, 25).
actividad(aconquija, visitas_historicas, 12).
actividad(aconquija, senderismo, 10).

% Actividades en San Antonio de Areco
actividad(san_antonio_de_areco, fiesta_de_la_tradicion, 2).
actividad(san_antonio_de_areco, visitas_historicas, 10).
actividad(san_antonio_de_areco, gastronomia, 10).

% Actividades en Tucum�n
actividad(tucuman, visita_historica, 10).
actividad(tucuman, trekking, 20).

% Actividades en C�rdoba
actividad(cordoba, senderismo, 20).
actividad(cordoba, visitas_historicas, 15).

% Actividades en Mar del Plata
actividad(mar_del_plata, surf, 30).
actividad(mar_del_plata, pesca, 25).
actividad(mar_del_plata, paseos_en_bote, 20).

% Actividades en Villa Gesell
actividad(villa_gesell, surf, 35).
actividad(villa_gesell, ciclismo, 20).
actividad(villa_gesell, paseo_por_la_playa, 15).

% Actividades en Pinamar
actividad(pinamar, surf, 30).
actividad(pinamar, paseos_en_bici, 20).
actividad(pinamar, paseos_por_la_playa, 15).

% Actividades en Carro Quevedo
actividad(reta, navegacion, 40).
actividad(reta, pesca_deportiva, 30).
actividad(reta, avistamiento_de_aves, 25).

% Actividades en Claromec�
actividad(claromeco, paseos_por_la_playa, 20).
actividad(claromeco, surf, 30).
actividad(claromeco, pesca, 25).

% Actividades en Necochea
actividad(necochea, navegacion, 30).
actividad(necochea, pesca, 25).
actividad(necochea, paseos_por_la_playa, 20).

% Actividades en Tandil
actividad(tandil, senderismo, 20).
actividad(tandil, paseos, 15).
actividad(tandil, actividades_al_aire_libre, 25).

% Actividades en Luj�n
actividad(lujan, visitas_historicas, 10).
actividad(lujan, actividades_recreativas, 15).

% Actividades en San Pedro
actividad(san_pedro, navegacion, 25).
actividad(san_pedro, pesca_deportiva, 20).

% Actividades en Col�n
actividad(colon, termas, 40).
actividad(colon, paseos_en_bote, 20).

% Actividades en Villa General Belgrano
actividad(villa_general_belgrano, festivales, 30).
actividad(villa_general_belgrano, turismo_rural, 20).
actividad(villa_general_belgrano, senderismo, 15).

% Actividades deportivas
actividad_es(deportiva, esqui).
actividad_es(deportiva, trekking).
actividad_es(deportiva, senderismo).
actividad_es(deportiva, pesca_deportiva).
actividad_es(deportiva, mountain_bike).

% Actividades recreativas 
actividad_es(recreativa, visita_glaciares).
actividad_es(recreativa, visitas_historicas).
actividad_es(recreativa, cabalgatas).
actividad_es(recreativa, arqueologia).
actividad_es(recreativa, avistamiento_de_aves).
actividad_es(recreativa, visita_bodegas).
actividad_es(recreativa,actividades_al_aire_libre).
actividad_es(recreativa, paseos_en_bote).
actividad_es(recreativa, paseos_en_bici).
actividad_es(recreativa, paseos_por_la_playa).

% Actividades extremas 
actividad_es(extremo, surf).
actividad_es(extremo, esqui).
actividad_es(extremo, trekking).
actividad_es(extremo, mountain_bike).


destino_deportivo(Destino):- actividad(Destino, Actividad,_), actividad_es(deportiva, Actividad).
destino_recreativo(Destino):- actividad(Destino, Actividad,_), actividad_es(recreativa, Actividad).
tiene_actividades_extremas(Destino):- actividad(Destino, Actividad,_), actividad_es(extremo, Actividad).

tiene_actividades_baratas(Destino):- actividad(Destino, _, X), X=<20.

% Consultas