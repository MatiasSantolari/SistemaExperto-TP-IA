% Contiene funciones basicas personalizadas

leer(A):- read_line_to_codes(user_input,Cs), atom_codes(A, Cs).

mostrar_lista([]):-write('.'),nl.
mostrar_lista([Cabeza|Cola]) :-
    write(Cabeza), write(', '),  
    mostrar_lista(Cola).

