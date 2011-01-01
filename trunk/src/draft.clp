(defglobal ?*user* = null)
(defglobal ?*opc* = null)

;############ ESTO IRA EN FUNCTIONS ##############

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
	(while(or(<= ?n  ?min)  (>= ?n ?max))
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
		(bind ?l (insert$ ?l 1 ?n))
		(printout t ?l crlf)
		(printout t "Do you wish to add another? (yes/no)" crlf)
		(bind ?res (read))
	)
	?l
)

;Esta función calcula la dificultad o intensidad inicial que puede soportar el usuario a partir de sus hábitos
(deffunction set-difficulty ()
	; Criterios usados:
		; Si hábito = mucho ejercicio, entonces augmenta dificultad
		; Si hábito = indiferente (no afecta a las condiciones físicas), entonces dificultad no se altera
		; Si hábito = malo (afecta negativamente a las condiciones físicas), entonces baja dificultad
		; -------------
		; media aproximada de dificultades en los hábitos = dificultad intensidad inicial
	; Cuando habito es mucho o poco ejercicio?
		; Ahora lo pienso, voy a cenar xD
)


;############## ESTO IRA EN MESSAGES ################

(defmessage-handler Person print primary ()
	(printout t crlf crlf)
	(printout t "------------Person Basic Information-------------" crlf crlf) 
	(printout t "    Name: " ?self:name_  crlf) 
	(printout t "    LastName: " ?self:last_name  crlf) 
	(printout t "    age: " ?self:age " years " crlf) 
	(printout t "    goal: " ?self:goal  crlf) 
	(if (not(eq ?self:difficulty_intensity [nil])) then
		(printout t "    Initial difficulty or intensity can be supported: " ?self:difficulty_intensity  crlf) 
	)	
	(if (eq (length$ ?self:habits) 0) then				;aqui miramos la longitud del slot (no es required)
		(printout t "" crlf)
		(printout t " -------------------------------------------------" crlf crlf) 	
	else then
		(printout t crlf)
		(printout t "------------------Person Habits------------------" crlf crlf) 
		(bind ?i 1)
		(while (<= ?i (length$ ?self:habits)) do	;recorre el multislot de habitos de esta persona y los muestra
			(bind ?habit (nth$ ?i ?self:habits))
			(printout t "    "(class ?habit) ": " (send ?habit get-name_habit) " " (send ?habit get-duration) " min with frequency: '" (send ?habit get-frequency) "'" crlf)
			(bind ?i (+ ?i 1))
		)
		(if (eq ?self:basicPhyCondition [nil]) then		;aqui comparamos a null el slot (es required)
			(printout t crlf)
			(printout t "-------------------------------------------------" crlf crlf) 
		else then
			(printout t crlf)
			(printout t "--------Person Basic Physical Information--------" crlf crlf) 
			(printout t "    height: "(send ?self:basicPhyCondition get-height) " cm " crlf) 
			(printout t "    weight:" (send ?self:basicPhyCondition get-weight) " kg " crlf) 
			(printout t "    index of body mass:" (send ?self:basicPhyCondition get-bodyMass)   crlf)
			(printout t "    blood maximum pressure:" (send ?self:basicPhyCondition get-blood_max_pressure) " sistolic " crlf)
			(printout t "    blood minimum pressure:" (send ?self:basicPhyCondition get-blood_min_pressure) " diastolic " crlf)
			(printout t "    diet:" (send ?self:basicPhyCondition get-diet) crlf)
			(printout t "    muscular problems:" (send ?self:basicPhyCondition get-muscular_problems) crlf)
			(printout t "-------------------------------------------------" crlf crlf crlf) 
		)
	)
)


;############# ESTO IRA EN RULES & MODULES ############

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
	(bind ?*opc* -1)
	(while (or(< ?*opc* 1)(> ?*opc* 3)) do
		(printout t "Select an option:" crlf)
		(printout t "1. Create a new person" crlf)
		(printout t "2. Select an existing person" crlf)
		(printout t "3. Exit" crlf)
		(bind ?*opc* (read))
	)
	(switch ?*opc*
   		(case 1 then
			(printout t "Creando persona" crlf)
			(bind ?*user* -1)
			(focus createPerson-module)
		)
		(case 2 then
			(printout t "Seleccionando existente" crlf)
			(bind ?i 1)
			(do-for-all-instances ((?p1 Person))
				(printout t ?i ". - " ?p1:name_ crlf)
				(bind ?i (+ ?i 1))
			)
			(bind ?*user* (read))
			(focus existingPerson-module)
		)
		(case 3 then
			(printout t "Have a nice day!" crlf)
			(reset)
			(clear)
			(halt)
		)
	)			
)

(defmodule createPerson-module (export ?ALL)(import MAIN ?ALL))

(defrule create-person
	(declare (salience 9998))
	?inidata <- (personalData (name_ unknown) (last_name unknown) (age unknown) (goal unknown))
	=>
	(bind ?usr (make-instance User1 of Person))
	(bind ?res (set-value "name"))
	(bind ?res2 (set-value "last_name"))
	(bind ?res3 (set-number "How old are you (between 16-130)" 16 130))
	(bind ?res4 (set-multi-from-list "What is/are your goal/s in the gym (select one firstly)" (slot-allowed-values Person goal)))
        (modify ?inidata (name_ ?res) (last_name ?res2) (age ?res3) (goal ?res4))
	(send ?usr put-name_ ?res)
	(send ?usr put-last_name ?res2)
	(send ?usr put-age ?res3)
	(send ?usr put-goal ?res4)
	(send ?usr print)
	(focus habits-module)
)

(defmodule habits-module (export ?ALL)(import createPerson-module ?ALL))

(defrule set-habits
	(declare (salience 9997))
	?habs <- (habitsPerson (habits unknown))
	=>
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(switch ?*opc*
		(case 1 then
			(bind ?usr (nth$ (length$ ?persons) ?persons))	; En este caso hay que asignarle los habitos existentes
			(bind ?lhabits (create$))	;lista de instancias Habit a añadir a la persona
			(bind ?add yes)
			(while(eq ?add yes) do
				(bind ?l (create$))
				(bind ?subhabit (set-single-from-list "Insert the type of your habit" InWork OutWork Movement))
				(bind ?habits (find-all-instances ((?h ?subhabit)) TRUE))
				(bind ?i 1)
				(while (<= ?i (length$ ?habits)) do	;recorre el multislot de habitos y los muestra
					(bind ?habit (nth$ ?i ?habits))
					(bind ?name (send ?habit get-name_habit))	
					;(printout t ?name crlf)			; esto lo printa sin comillas
					(bind ?l (insert$ ?l 1 ?name))		; aqui lo añade como string (con comillas)
					(printout t "    " (send ?habit get-name_habit)": " (send ?habit get-frequency)  " " (send ?habit get-duration)  crlf)
					(bind ?i (+ ?i 1))
				)
				(bind ?h (set-single-from-list "Insert the name of your habit shown (BETWEEN \"\"!)" ?l))
				(bind ?i 1)
				(while (<= ?i (length$ ?habits)) do	;recorre el multislot de habitos y busca el que tiene de nombre ?h
					(bind ?habit (nth$ ?i ?habits))
					(if (eq (send ?habit get-name_habit) ?h) then
						(bind ?lhabits (insert$ ?lhabits 1 ?habit))
						(break)
					)
					(bind ?i (+ ?i 1))
				)				
				(printout t "Do you want to add another habit? yes/no" crlf)
				(bind ?add (read))
			)
			(modify ?habs (habits ?lhabits))
			(send ?usr put-habits ?lhabits)
		)
		(case 2 then 
			(bind ?usr (nth$ ?*user* ?persons))	;En este caso el usuario introducido ya tiene asignado unos habitos
			; Para la version extendida
		)
	)
	(send ?usr print)
	(focus bpc-module)
)

(defmodule bpc-module (export ?ALL)(import habits-module ?ALL))

(defrule set-bpc
	(declare (salience 9996))
	?bpc <- (basicPhyCond (bodyMass unknown) (height unknown) (blood_max_pressure unknown) (weight unknown) (blood_min_pressure unknown) (diet unknown) (muscular_problems unknown))
	=>
	(bind ?h (set-number "How tall are you (in cm) (between 120-240)" 120 240))
	(bind ?w (set-number "How much you weigh (in kg) (between 25-150)" 25 150))
	(bind ?hmeters (/ ?h 100))
	(bind ?ibm (/ ?w (* ?hmeters ?hmeters)))
	(bind ?maxp (set-number "What is your blood maximum presure (between 30-200)" 30 200))
	(bind ?minp (set-number "What is your blood minimum presure (between 30-200)" 30 200))
	(bind ?diet (set-multi-from-list "What is/are the feature/s or problem/s of your kind of diet (select from this list)" (slot-allowed-values BasicPhysicalCondition diet)))
	(bind ?muscprob (set-multi-from-list "What is/are your muscular problems (select from this list)" (slot-allowed-values BasicPhysicalCondition muscular_problems)))
	(bind ?new (make-instance Bpc of BasicPhysicalCondition))
	(modify ?bpc (bodyMass ?ibm) (height ?h) (blood_max_pressure ?maxp) (weight ?w) (blood_min_pressure ?minp) (diet ?diet) (muscular_problems ?muscprob))
	(send ?new put-bodyMass ?ibm)
 	(send ?new put-height ?h)
 	(send ?new put-blood_max_pressure ?maxp)
 	(send ?new put-weight ?w)
 	(send ?new put-blood_min_pressure ?minp)
 	(send ?new put-diet ?diet)
	(send ?new put-muscular_problems ?muscprob)
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ (length$ ?persons) ?persons)) ; La que estamos tratando es la ultima que se ha creado
	(send ?usr put-basicPhyCondition ?new)
	(send ?usr print)
	(focus difficulty_intensity-module)
)

(defmodule existingPerson-module (export ?ALL)(import MAIN ?ALL))

(defrule existing-person
	(declare (salience 9990))
	=>
	;?pers <- (object (is-a Person)(name_ ?n))
	;(test (eq ?n ?*user*))	;No se porque coño no compara bien :S
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ ?*user* ?persons)) ;Cogemos el index que ha introducido el user...
	=>
	;(printout t ?pers get-name_ ?*user* crlf)
	(send ?usr print) 
)

(defmodule difficulty_intensity-module (export ?ALL)(import bpc-module ?ALL)(import existingPerson-module ?ALL))

(defrule difficulty-intensity
	(declare (salience 9989))
	?dif_intens <- (difficultyIntensity (difficulty_intensity unknown))
	=>
	(bind ?di easy)						; ESTO LLAMARA UNA FUNCION QUE CALCULARA LA DIFICULTAD A PARTIR DE LOS HABITOS
	(modify ?dif_intens (difficulty_intensity ?di))
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ (length$ ?persons) ?persons)) 		; CUIDADO, HAY QUE DIFERENCIAR CASOS EN LA VERSION EXTENDIDA, ESTA NORMA DEPENDE DE LA EXISTING PERSON TAMBIEN
	(send ?usr put-difficulty_intensity ?di)
	(send ?usr print)
)
