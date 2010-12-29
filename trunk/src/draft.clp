;(defmodule MAIN (export ?ALL))
;
;
;(defmodule preguntas-persona
;	(import MAIN ?ALL)
;	(export ?ALL)
;)
;
;(defmodule modulo_condiciones_generales
;	(import preguntas-persona ?ALL)
;	(export ?ALL)
;)
;
;(deffunction pregunta-abierta (?pregunta)
;	(printout t ?pregunta crlf)
;	(bind ?resposta (read))
;	?resposta
;)
;?res pregunta-abierta 












(defmessage-handler Person print primary ()
	(printout t crlf crlf)
	(printout t "------------Person Basic Information-------------" crlf) 
	(printout t "    Name:" ?self:name_  crlf) 
	(printout t "    LastName:" ?self:last_name  crlf) 
	(printout t "    age:" ?self:age  crlf) 
	(printout t "    goal:" ?self:goal  crlf) 
	(printout t "-------------------------------------------------" crlf crlf) 
)


(deffunction set-value (?pregunta)
	(printout t "What is your " ?pregunta "?" crlf)
	(bind ?resp (read))
	?resp
)



;Problema 1: En principio en las clases ya hay asignada un rango para la edad de 16 a 99 a�os,
;pero cuando llama al print no hace ni caso y si le entras un 3 asigna un 3 a la edad en la instancia
; se puede acceder a eso, poniendo: (slot-range Person age) y (slot-allowed-values Person age) pero no se como usarlo luego....
;Problema 2: he visto la forma de entrar el rango por parametro y de hacer el if retornando un valor o otro. 
;La funcion member es s�lo para ver si la variable tiene alguno de los valores del rango (va bien para la goal por ejemplo), 
;pero no se como acceder a un valor del rango o c�mo indicar que est� entre medio de ese rango
;yo dir�a que esto es m�s para preguntas de respuesta limitada como: si/no, mucho/poco/nada, etc., he creado dos funciones...
(deffunction set-number (?pregunta ?min ?max)
	(printout t  ?pregunta "?" crlf)
	(bind ?n (read))
	(while(or(< ?n  ?min)  (> ?n ?max))
		(printout t ?pregunta "?" crlf)
		(bind ?n (read))
	)
	?n
)


;Esta funcion recibe como par�metro la pregunta y la lista, y lo muestra por pantalla hasta que introduce un valor v�lido
;Ej. set-from-list "Con que frecuencia haces deporte" nada poco mucho
(deffunction set-from-list (?pregunta $?list)
	(printout t  ?pregunta "?" crlf)
	(bind ?n (read))
	(while(not(member ?n  ?list))		; & ?a < ?max)
		(printout t ?pregunta "?" crlf)
		(bind ?n (read))
	)
	?n
)


(defrule create-person
	(declare (salience 10000))
	=>
	(make-instance User1 of Person)
	(bind ?res (set-value "name"))
        (send [User1] put-name_ ?res)
	(bind ?res (set-value "last_name"))
        (send [User1] put-last_name ?res)
	(printout t  "Allowed values:"(slot-range Person age) crlf) 
	(bind ?res (set-number "How old are you" 16 130))
	
	;(bind ?res (set-number "How old are you" (slot-range Person age)))
	(send [User1] put-age ?res)
	(send [User1] print)
	

)
	;(focus modulo_condiciones_generales)


(defrule inicio "Regla inicial de presentacio"
	(declare (salience 9999))
	=>
	(printout t crlf)
	(printout t "+------------------------------------------------+" crlf)
	(printout t "|                                                |" crlf)
	(printout t "|                    FITNESS                     |" crlf)
	(printout t "|                                                |" crlf)
	(printout t "+------------------------------------------------+" crlf)
	;(focus preguntas-persona)
)



