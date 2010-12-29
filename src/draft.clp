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



(defglobal ?*user* = null)
(defmodule MAIN (export ?ALL))
(defrule start "Startup rule"
	(declare (salience 9999))
	=>
	;(ppdefinstances Person)
	(printout t crlf)
	(printout t "+-------------------------------------------+" crlf)
	(printout t "|                                           |" crlf)
	(printout t "|         WELCOME TO OUR FITNESS GYM        |" crlf)
	(printout t "|                                           |" crlf)
	(printout t "+-------------------------------------------+" crlf)
	(bind ?opc -1)
	(while (or(< ?opc 1)(> ?opc 3))
		(printout t "Select an option:" crlf)
		(printout t "1. Create a new person" crlf)
		(printout t "2. Select an existing person" crlf)
		(printout t "3. Exit" crlf)
		(bind ?opc (read))
	)
	(switch ?opc
   		(case 1 then
			(printout t "Creando persona" crlf)
			(focus create-person)
		)
		(case 2 then
			(printout t "Seleccionando existente" crlf)
			(bind ?i 1)
			(do-for-all-instances ((?p1 Person))
				(printout t ?i ". - " ?p1:name_ crlf)
				(bind ?i (+ ?i 1))
			)
			(bind ?*user* (read))
			;(find-instance ((?person Person))(eq ?person:name_ "?name"))
			;(printout t ?person crlf)
			(focus existing-person)
		)
		(case 3 then
			(printout t "Have a nice day!" crlf)
			(reset)
			(clear)
		)
	)
			
)







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



;Problema 1: En principio en las clases ya hay asignada un rango para la edad de 16 a 99 años,
;pero cuando llama al print no hace ni caso y si le entras un 3 asigna un 3 a la edad en la instancia
; se puede acceder a eso, poniendo: (slot-range Person age) y (slot-allowed-values Person age) pero no se como usarlo luego....
;Problema 2: he visto la forma de entrar el rango por parametro y de hacer el if retornando un valor o otro. 
;La funcion member es sólo para ver si la variable tiene alguno de los valores del rango (va bien para la goal por ejemplo), 
;pero no se como acceder a un valor del rango o cómo indicar que esté entre medio de ese rango
;yo diría que esto es más para preguntas de respuesta limitada como: si/no, mucho/poco/nada, etc., he creado dos funciones...
(deffunction set-number (?pregunta ?min ?max)
	(printout t  ?pregunta "?" crlf)
	(bind ?n (read))
	(while(or(< ?n  ?min)  (> ?n ?max))
		(printout t ?pregunta "?" crlf)
		(bind ?n (read))
	)
	?n
)


;Esta funcion recibe como parámetro la pregunta y la lista, y lo muestra por pantalla hasta que introduce un valor válido
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

(defmodule create-person (export ?ALL)(import MAIN ?ALL))
(defrule create-person
	(declare (salience 9998))
	=>
	(bind ?new (make-instance User1 of Person))
	(bind ?res (set-value "name"))
        (send ?new put-name_ ?res)
	(bind ?res (set-value "last_name"))
        (send ?new put-last_name ?res)
	(printout t  "Allowed values:"(slot-range Person age) crlf) 
	(bind ?res (set-number "How old are you" 16 130))
	
	;(bind ?res (set-number "How old are you" (slot-range Person age)))
	(send ?new put-age ?res)
	(send ?new print)
	

)
	;(focus modulo_condiciones_generales)
(defmodule existing-person (export ?ALL)(import MAIN ?ALL))
(defrule existing-person
	(declare (salience 9997))
	?pers <- (object (is-a Person)(name_ ?n))
	(test (eq ?n ?*user*))	;No se porque coño no compara bien :S
	=>
	(printout t ?pers get-name_ ?*user* crlf)
	;(send ?user print) 
	
)

