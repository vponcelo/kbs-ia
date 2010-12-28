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


(deffunction set-valor (?pregunta)
	(printout t "¿Cual es tu " ?pregunta "?" crlf)
	(bind ?a (read))
	?a
)


;(deffunction set-numero (?pregunta ?min ?max)
;	(printout t "¿Cual es tu " ?pregunta "?" crlf)
;	(bind ?a (read))
;	if (> ?a  ?min)		; & ?a < ?max)
;	 then (?a)
;	 else ("-1")
;)


(defrule crea-persona
	(declare (salience 10000))
	=>
	(make-instance User1 of Person)
	(bind ?res (set-valor "nombre"))
        (send [User1] put-name_ ?res)
	(bind ?res (set-valor "apellido"))
        (send [User1] put-last_name ?res)
	;(bind ?res (set-numero "edad" 1 100)
	;(printout t "tu edad es: " ?res crlf)
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



