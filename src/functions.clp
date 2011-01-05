;########################################################
;##################### FUNCTIONS ########################
;########################################################

;Esta función recibe por parámetro la pregunta y devuelve el valor que introduce el usuario
(deffunction set-value (?pregunta)
	(printout t "What is your " ?pregunta "?" crlf)
	(bind ?resp (read))
	?resp
)

;Esta función recibe por parámetro la pregunta y el rango de números mediante el mínimo y máximo. Devuelve el valor que introduce el usuario
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
(deffunction set-single-from-list (?pregunta $?list)
	(printout t ?pregunta "?" crlf)
	(printout t ?list "?" crlf)
	(bind ?n (read))
	(while(not(member ?n  ?list)) do
		(printout t "You have selected something which is not shown in the list" crlf)
		(printout t ?pregunta "?" crlf)
		(printout t ?list "?" crlf)
		(bind ?n (read))
	)
	?n
)

;Esta funcion recibe como parámetro la pregunta y la lista, y lo muestra por pantalla hasta que introduce un valor válido, puede introducir mas de un valor
(deffunction set-multi-from-list (?pregunta $?list)
	(bind ?res yes)
	(bind ?l (create$))
	(while(eq ?res yes)
		(printout t ?pregunta "?" crlf)
		(printout t ?list "?" crlf)
		(bind ?n (read))
		(while(not(member ?n  ?list)) do
			(printout t "You have selected something which is not shown in the list" crlf)
			(printout t ?pregunta "?" crlf)
			(printout t ?list "?" crlf)
			(bind ?n (read))
		)
		(if (not(member ?n ?l)) then
			(bind ?l (insert$ ?l 1 ?n))
		)
		(if (or(eq none ?n) (eq balanced ?n)) then
			(bind ?l (create$ ?n))
			(bind ?res no)
		else
			(printout t "Do you wish to add another? (yes/no)" crlf)
			(bind ?res (read))
		)
		(printout t ?l crlf)
	)
	?l
)

;Esta función recibe por parámetro dos listas y devuelve una lista generada con la suma de las dos, sin repeticiones de elementos
(deffunction set-unique-list (?l1 ?l2)
	(bind ?i 1)
	(while (<= ?i (length$ ?l2))
			(bind ?curEl (nth$ ?i ?l2))
			(if (not(member ?curEl ?l1)) then
				(bind ?l1 (insert$ ?l1 1 ?curEl))
			)
			(bind ?i (+ ?i 1))
				
	)
	?l1
)

;Esta función calcula la dificultad o intensidad inicial que puede soportar el usuario a partir de sus hábitos
(deffunction set-difficulty (?usr)
	; Criterios usados:
		; Si hábito = mucho ejercicio, entonces augmenta dificultad
		; Si hábito = indiferente (no afecta a las condiciones físicas), entonces dificultad no se altera
		; Si hábito = malo (afecta negativamente a las condiciones físicas), entonces baja dificultad
		; -------------
		; suma de dificultades en los hábitos = dificultad intensidad inicial
	; Como cuantificar los habitos? --> mirar pseudocódigo report
	(bind ?habits (send ?usr get-habits))
	(bind ?i 1)
	(bind ?j -1)
	(bind ?sum 0)
	(while (<= ?i (length$ ?habits)) do
		(bind ?habit (nth$ ?i ?habits))
		(bind ?dur (send ?habit get-duration))
		(if (>= ?dur 0) then
			(bind ?j 1)
			(if (>= ?dur (nth$ 2 (send ?habit get-indexDuration))) then
				(bind ?j 2)
				(if (>= ?dur (nth$ 3 (send ?habit get-indexDuration))) then
					(bind ?j 3)
					(if (>= ?dur (nth$ 4 (send ?habit get-indexDuration))) then
						(bind ?j 4)
					)
				)
			)
		)
		(bind ?freq (send ?habit get-frequency))
		(switch ?freq
			(case few then
				(bind ?j (* 1 ?j))				
			)
			(case medium then
				(bind ?j (* 2 ?j))
			)
			(case quite then
				(bind ?j (* 3 ?j))
			)
			(case very_high then
				(bind ?j (* 4 ?j))
			)
		)
		(if (send ?habit get-habit_class) then
			(bind ?sum (+ ?sum ?j))
		else then
			(bind ?sum (- ?sum ?j))
		)
		(bind ?i (+ ?i 1))		
	)
	(if (< ?sum -8) then
		(bind ?resp easy)
	else (if (< ?sum 8) then
		(bind ?resp medium)
	     else then
		(bind ?resp hard)
	     )
	)
	?resp
)
;Esta función calcula las pulsaciones por minuto de la persona al realizar los ejercicios de test
(deffunction set-pulsations (?usr)
	(bind ?bpc (send ?usr get-basicPhyCondition))
	(bind ?imc (send ?bpc get-bodyMass))
	(bind ?ppm 100)
	(bind ?var 0)
	(if (> ?imc 0) then
		(bind ?var (random -50 0))
		(if (>= ?imc 20) then
			(bind ?var (random 0 70))
			(if (>= ?imc 25) then
				(bind ?var (random 0 130))
			)
		)
	)		
	(bind ?ppm (+ ?ppm ?var))
	(bind ?age (send ?usr get-age))
	(if (>= ?age 16) then
		(bind ?var (random 0 10))
		(if (>= ?age 35) then
			(bind ?var (random 0 20))
			(if (>= ?age 67) then
				(bind ?var (random 0 30))
			)
		)
	)
	(bind ?ppm (+ ?ppm ?var))
	(bind ?i 1)
	(while (<= ?i (length$ (send ?bpc get-diet))) do
		(bind ?d (nth$ ?i (send ?bpc get-diet)))
		(if (or (eq ?d lack_calcium) (eq ?d lack_vitamines) (eq ?d lack_iron)) then
			(bind ?var (random -5 0))
			(bind ?ppm (+ ?ppm ?var))
		else (if (or (eq ?d excess_greases) (eq ?d excess_sal) (eq ?d snacking)) then
			(bind ?var (random 0 5))
			(bind ?ppm (+ ?ppm ?var))
		     )
		)
		(bind ?i (+ ?i 1))
	)
	?ppm	
)

; Esta funcion calcula el tiempo total de los ejercicios que se entran por parametro
(deffunction calculate-totalTime (?lexs)
	(bind ?sumMins 0)
	(bind ?i 1)
	(while (< ?i (length$ ?lexs)) do
		(bind ?sumMins (+ ?sumMins (send (nth$ ?i ?lexs) get-max_duration)))
		(bind ?i (+ ?i 1))
	)
	?sumMins
)

; Esta funcion comprueba que hay algun ejercicio con tiempo menor que ?hours entrado por parametro
(deffunction enoughTime (?hours ?lexs)
	(bind ?i 1)
	(while (< ?i (length$ ?lexs)) do
		(bind ?elem (nth$ ?i ?lexs))				; Siempre pillara el primero que encuentre
		(if (< (* (send ?elem get-max_duration) (send ?elem get-max_rep)) ?hours) then
			?elem
		)
		(bind ?i (+ ?i 1))
	)
	FALSE
)

; Esta funcion muestra el programa calculado
(deffunction show-program (?schedule)
	(bind ?i 1)
	(while (<= ?i (length$ ?schedule)) do
		(bind ?elem (nth$ ?i ?schedule))
		(if (or(eq ?elem monday) (eq ?elem tuesday) (eq ?elem wednesday) (eq ?elem thursday) (eq ?elem friday)) then
			(printout t "" crlf)
			(printout t "-------------------"?elem"-------------------" crlf)
		else 
			(printout t "		EXERCISE: "(send ?elem get-name_ex) crlf)
		)
		(bind ?i (+ ?i 1))
	)
)

;Genera el programa a partir de la lista de ejercicios y de las preferencias del usuario
(deffunction generate-schedule(?bpc ?lexs)
	;Obtener tiempo de la persona diario
	;obtener suma del tiempo de los ejercicios y compararla con tiempo total (diaria x 5?) de la persona
	;si hay más ejercicios que tiempo total, se pone un boolean a true, sino a false;
	;i=1
	;dias=Arraylista(lunes="" martes="" miercoles="" jueves="" viernes="")
	;mientras i<=5
		;punterolista=dias ?i;
	  ;mientras (tiempo_persona >0)
	  	;tener en cuenta las prioridades sólo los dias impares (que sea/n el/los primero/s a realizar)
	  	; buscar ejercicio... Teniendo en cuenta las prioridades de dolores de musculos (comparar muscular_problems del user con muscular_problems de los ejercicios ), y calorias si quiere perder peso (reduce_weight, buscar primero ejercicios que quemen más calorias))
	    ; Comprobar si se peude asignar (tiempo suficiente))
	  	; eliminar los ejercicios de prioridad de ?lexs
	    ;coger ejercicios aleatorios nth$ random(0 length(?lexe) (- los ya asignados por prioridad)) el resto de dias y el resto del tiempo
	    ;Si se puede: decrementar tiempo de ese dia, y si el boolean esta a true, elimino este ejercicio (podria hacer que ejercicios con prioridad se quitaran y otros que no no se quitaran)
	    ;else: si no se puede asignar, comprobar si hay algun ejercicio que entre en el tiempo restante, y si no se puede hacer un break;
		;i++
	;Mostrar todo el programa.
	(printout t "Lista de ejercicios a asignar:" crlf ?lexs crlf)
	(if (eq (length$ ?lexs) 0) then
		(printout t "Sorry, our gym doesn't have exercises for you" crlf)
	)
	(bind ?hoursday (set-number "How many minutes per day can you dedicate (in minutes) (between 30 and 960)" 30 960))
	(bind ?schedule (create$ monday tuesday wednesday thursday friday))
	(bind ?total_time (calculate-totalTime ?lexs))
	(if (> ?total_time (* ?hoursday 5)) then
		(bind ?remove TRUE)
	else then
		(bind ?remove FALSE)
	)
	(bind ?i 1)
	(bind ?index 2)
	(while (<= ?i 5) do
		(bind ?hours ?hoursday)
		(while (> ?hours 0) do
			;(if (eq (mod ?i 2) 1) then ; hay que añadir algo para que no asigne siempre el mismo ejercicio en caso de que el boolean no permita borrar...
				;(if (not(eq (send ?bpc get-muscular_problems) none)) then
					;(bind ?ex (nth$ (random 1 (length$ ?lexs) ?lexs)))		;funcion para buscar ejercicios buenos...
					;(while (not(eq (send ?bpc get-muscular_problems))) do
					
					;)					
				;)
				;(if (member (send ?usr get-goal) reduce_weight) then
					;funcion para buscar ejercicios que quemen calorias...
				;)
			;)
			(bind ?ex (nth$ (random 1 (length$ ?lexs)) ?lexs))
			(if (< (* (send ?ex get-max_duration) (send ?ex get-max_rep)) ?hours) then
				(bind ?schedule (insert$ ?schedule ?index ?ex))
				(bind ?index (+ ?index 1))
				(bind ?hours (- ?hours (* (send ?ex get-max_duration) (send ?ex get-max_rep))))
				(if ?remove then
					(bind ?lexs (delete-member$ ?lexs ?ex))
				)
			else then
				(bind ?e (enoughTime ?hours ?lexs))
				(if (not ?e) then
					(break)
				else then
					(bind ?schedule (insert$ ?schedule ?index ?e))
					(bind ?index (+ ?index 1))
					(bind ?hours (- ?hours (* (send ?ex get-max_duration) (send ?ex get-max_rep))))
					(if ?remove then
						(bind ?lexs (delete-member$ ?lexs ?e))
					)
				)
			)
		)	
		(bind ?index (+ ?index 1))
		(bind ?i (+ ?i 1))
	)
	(show-program ?schedule)
)