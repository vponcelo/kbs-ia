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
;Genera el programa a partir de la lista de ejercicios y de las preferencias del usuario
(deffunction generate-schedule(?bpc ?lexs)
(printout t "Lista de ejercicios a asignar:" crlf ?lexs crlf)
(bind ?dias (create$ lunes martes miercoles jueves viernes)); una para cada dia, o un slot o 5 variables...
;al no ser que hagamos algo así: (a 1 3 4 23 b 5 2 c d e f) donde a seria el día, y 1, 3, 4 serian las instancias de los ejercicios, diria que en clips no hay listas de listas xD)


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



;############## ESTO IRA EN MESSAGES ################

(defmessage-handler Person print primary ()
	(printout t crlf crlf)
	(printout t "------------------------Person Basic Information-------------------------" crlf crlf) 
	(printout t "    Name: " ?self:name_  crlf) 
	(printout t "    LastName: " ?self:last_name  crlf) 
	(printout t "    age: " ?self:age " years " crlf) 
	(printout t "    goal: " ?self:goal  crlf) 
	(if (not(eq ?self:difficulty_intensity [nil])) then
		(printout t "    Initial difficulty or intensity supported " crlf "    (calculated by habits): " ?self:difficulty_intensity  crlf) 
	)	
	(if (eq (length$ ?self:habits) 0) then				;aqui miramos la longitud del slot (no es required)
		(printout t crlf)
		(printout t "------------------------------Person Habits------------------------------" crlf crlf) 
		(printout t "    No habits selected " crlf)
	else then
		(printout t crlf)
		(printout t "------------------------------Person Habits------------------------------" crlf crlf) 
		(bind ?i 1)
		(while (<= ?i (length$ ?self:habits)) do	;recorre el multislot de habitos de esta persona y los muestra
			(bind ?habit (nth$ ?i ?self:habits))
			(printout t "    "(class ?habit) ": " (send ?habit get-name_habit) " " (send ?habit get-duration) " min with frequency: '" (send ?habit get-frequency) "'" crlf)
			(bind ?i (+ ?i 1))
		)
	)
	(if (eq ?self:basicPhyCondition [nil]) then		;aqui comparamos a null el slot (es required)
		(printout t crlf)
		(printout t "-------------------------------------------------------------------------" crlf crlf) 
	else then
		(printout t crlf)
		(printout t "--------------------Person Basic Physical Information--------------------" crlf crlf) 
		(printout t "    height: "(send ?self:basicPhyCondition get-height) " cm " crlf) 
		(printout t "    weight:" (send ?self:basicPhyCondition get-weight) " kg " crlf) 
		(printout t "    index of body mass:" (send ?self:basicPhyCondition get-bodyMass)   crlf)
		(printout t "    blood maximum pressure:" (send ?self:basicPhyCondition get-blood_max_pressure) " sistolic " crlf)
		(printout t "    blood minimum pressure:" (send ?self:basicPhyCondition get-blood_min_pressure) " diastolic " crlf)
		(printout t "    diet:" (send ?self:basicPhyCondition get-diet) crlf)
		(printout t "    muscular problems:" (send ?self:basicPhyCondition get-muscular_problems) crlf)
	)
	(if (eq ?self:test [nil]) then
		(printout t "" crlf)
		(printout t "-------------------------------------------------------------------------" crlf crlf crlf) 
	else then
		(printout t crlf)
		(printout t "-----------------------Results Test Basic Exercises----------------------" crlf crlf) 
		(printout t "    exercises done: " (send ?self:test get-testExercises) crlf)
		(printout t "    pulsations per minute: "(send ?self:test get-pulsations_per_min) crlf) 
		(if (>= (send ?self:test get-pulsations_per_min) 100) then
			(printout t "        Your pulsations per min are normal" crlf)
			(if (>= (send ?self:test get-pulsations_per_min) 180) then
				(printout t "        You have tachycardia" crlf)
			)
		else then 
			(printout t "        You are atheltic or you have bradycardia" crlf)
		)
		(printout t "    muscular tension: " (send ?self:test get-muscular_tension) crlf) 
		(printout t "    tiredness sensation: " (send ?self:test get-tiredness_sensation) crlf)
		(printout t "    dizziness: " (send ?self:test get-dizziness) crlf)
	)
	(printout t "" crlf)
	(printout t "-------------------------------------------------------------------------" crlf crlf crlf) 
	
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
	(send ?usr put-difficulty_intensity [nil])
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
					(bind ?l (insert$ ?l 1 (sym-cat (send ?habit get-name_habit))))		
					(printout t "    " (send ?habit get-name_habit)  crlf)
					;(printout t ?habits crlf)
					(bind ?i (+ ?i 1))
				)
				(bind ?l (insert$ ?l 1 none))
				(bind ?h (set-single-from-list "Insert the name of your habit (if it is shown)" ?l))
				(if (not(eq ?h none)) then
					(bind ?i 1)
					(while (<= ?i (length$ ?habits)) do	;recorre el multislot de habitos y busca el que tiene de nombre ?h
						(bind ?habit (nth$ ?i ?habits))
						(if (eq (sym-cat (send ?habit get-name_habit)) ?h) then
							(bind ?lhabits (insert$ ?lhabits 1 ?habit))
							(bind ?dur (set-number "What is the duration of your habit (between 0-500)" 0 500))
							(bind ?freq (set-single-from-list "What is the frequency of your habit" (slot-allowed-values Habit frequency)))
							(send ?habit put-duration ?dur)		
							(send ?habit put-frequency ?freq)
							(break)
						)
						(bind ?i (+ ?i 1))
					)
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
	;(printout t ?pers get-name_ ?*user* crlf)
	(send ?usr print) 
	;(focus difficulty_intensity-module)
	(focus exercises-module)
)

(defmodule difficulty_intensity-module (export ?ALL)(import habits-module ?ALL)(import existingPerson-module ?ALL))

(defrule difficulty-intensity
	(declare (salience 9989))
	?dif_intens <- (difficultyIntensity (difficulty_intensity unknown))
	=>
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr [nil])
	(switch ?*opc*
		(case 1 then
			(bind ?usr (nth$ (length$ ?persons) ?persons)) 		
		)
		(case 2 then
			(bind ?usr (nth$ ?*user* ?persons))
		)
	)
	(bind ?di (set-difficulty ?usr))
	(modify ?dif_intens (difficulty_intensity ?di))
	(send ?usr put-difficulty_intensity ?di)
	(send ?usr print)
	(switch ?*opc*
		(case 1 then
			(focus bpc-module)
		)
		(case 2 then
			;(focus exercises module)	;aun no existe :O
		)
	)
)

(defmodule bpc-module (export ?ALL)(import difficulty_intensity-module ?ALL))

(defrule set-bpc
	(declare (salience 9988))
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
	(focus test-module)
)

(defmodule test-module (export ?ALL)(import bpc-module ?ALL))

(defrule set-test
	(declare (salience 9987))
	?testPers <- (testPerson (pulsations_per_min unknown) (muscular_tension unknown) (tiredness_sensation unknown) (dizziness unknown) (testExercises unknown))
	=>
	(bind ?test (make-instance test of TestPerson))
	(bind ?lexs (send ?test get-testExercises))
	(printout t "please answer the questions of the exercises done: " crlf ?lexs crlf crlf)
	(bind ?muscTens (set-single-from-list "What is your muscular tension" (slot-allowed-values TestPerson muscular_tension)))
	(bind ?tired (set-single-from-list "What is your tiredness sensation" (slot-allowed-values TestPerson tiredness_sensation)))
	(bind ?dizz (set-single-from-list "Are you dizzy" (slot-allowed-values TestPerson dizziness)))
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ (length$ ?persons) ?persons))
	(bind ?ppm (set-pulsations ?usr))
	(modify ?testPers (pulsations_per_min ?ppm) (muscular_tension ?muscTens) (tiredness_sensation ?tired) (dizziness ?dizz) (testExercises ?lexs))
	(send ?usr put-test ?test)
	(send ?test put-pulsations_per_min ?ppm)
	(send ?test put-muscular_tension ?muscTens)
	(send ?test put-tiredness_sensation ?tired)
	(send ?test put-dizziness ?dizz)
	(send ?test put-testExercises ?lexs)
	(send ?usr print)
	(focus exercises-module)	;aun no existe :O
)

;(defmodule exercises-module (export ?ALL)(import test-module ?ALL)(import difficulty_intensity-module ?ALL))
(defmodule exercises-module (export ?ALL)(import existingPerson-module ?ALL));(import difficulty_intensity-module ?ALL))
(defrule set-exercises
	(declare (salience 9986))
	=>
	(bind ?bpc null)
	(switch ?*opc*
	 (case 1 then
	 	(bind ?persons (find-all-instances ((?p Person)) TRUE))
    (bind ?usr (nth$ (length$ ?persons) ?persons))
    (bind ?bpc (send ?usr get-basicPhyCondition))
	 )
	 (case 2 then
	  (bind ?persons (find-all-instances ((?p Person)) TRUE))
    (bind ?usr (nth$ ?*user* ?persons))
    (bind ?userbpc (str-cat "MAIN::" (send ?usr get-basicPhyCondition)))
    (bind ?bpcs (find-all-instances ((?b BasicPhysicalCondition)) (eq (str-cat ?b) (str-cat ?userbpc))))
    (bind ?bpc (nth$ 1 ?bpcs))
    ;(bind ?bpc (find-all-instances ((?b BasicPhysicalCondition)) TRUE))
    ;(printout t ?userbpc (find-all-instances ((?b BasicPhysicalCondition)) TRUE) crlf)
    ;(instances)
	 )
	)
	;(printout t ?bpc crlf)
	(bind ?i 1)
  (bind ?lexs (create$))
  ;1. Buscamos todos los ejercicios que cumplan los goals del usuario
  (while (<= ?i (length$ (send ?usr get-goal))) do
    (bind ?g (nth$ ?i (send ?usr get-goal)))
    (bind ?lexs (set-unique-list ?lexs (find-all-instances ((?e Exercise)) (member ?g ?e:goal))))      
    (printout t "goal actual: "?g "--> lista ejercicios: "?lexs crlf)  
    (bind ?i (+ ?i 1))
  )
  
  ;2. Eliminamos todos los que no sean de la misma intensidad a la que se puede someter el usuario
  (bind ?i 1)
  (while (<= ?i (length$ ?lexs)) do
    (bind ?e (nth$ ?i ?lexs))
    (if (not(eq (send ?e get-difficulty_intensity) (send ?usr get-difficulty_intensity))) then
      (bind ?lexs (delete-member$ ?lexs ?e))
      (printout t "elemento quitado (dif): "?e crlf)
    else then 
      (bind ?i (+ ?i 1))
    )
  )  
  
  
  ;3. Eliminamos también los que puedan ser perjudiciales para el usuario, teniendo en cuenta los problemas musculares y la presión sanguinea del usuario
  (bind ?i 1)
  (while (<= ?i (length$ ?lexs)) do
    (bind ?j 1)
    (bind ?e (nth$ ?i ?lexs))
    (while (<= ?j (length$ (send ?e get-contra_indications))) do
      (bind ?contra (nth$ ?j (send ?e get-contra_indications)))
      (if (or(member ?contra (send ?bpc get-muscular_problems)) (> (send ?bpc get-blood_max_pressure) (send ?e get-blood_max_pressure)) (> (send ?bpc get-blood_min_pressure) (send ?e get-blood_min_pressure))) then
        (bind ?lexs (delete-member$ ?lexs ?e))
        (printout t "elemento quitado (dif): "?e crlf)
        (bind ?i (- ?i 1))    ; reasignar indices
        (break)
      else then 
        (bind ?j (+ ?j 1))
      )
    )
   (bind ?i (+ ?i 1))
  )
  ;(printout t "Lista de ejercicios a asignar:" crlf ?lexs crlf)
  (generate-schedule ?bpc ?lexs)
)


;(defmodule schedule-module (export ?ALL)(import test-module ?ALL)(import exercises-module ?ALL))

;(defrule set-schedule
	;(declare (salience 9985))
	;=>
	; Obtener persona
	;Obtener tiempo de la persona diario
	;obtener suma del tiempo de los ejercicios y compararla con tiempo total de la persona
	;si hay más ejercicios que tiempo total, se pone un boolean a true, sino a false;
	;i=1
	;dias=Arraylista(lunes="" martes="" miercoles="" jueves="" viernes="")
	;mientras i<=5
	   ;punterolista=dias ?i;
	   ;mientras (tiempo_persona >0)
	     ;tener en cuenta las prioridades sólo los dias impares
	     ;coger ejercicios aleatorios nth$ random(0 length(?lexe)) el resto de dias y el resto del tiempo
	     ; buscar ejercicio... Teniendo en cuenta las prioridades de dolores de musculos (comparar muscular_problems del user con muscular_problems de los ejercicios ), y calorias si quiere perder peso (reduce_weight, buscar primero ejercicios que quemen más calorias))
	     ; Comprobar si se peude asignar (tiempo suficiente))
	     ;Si se puede: decrementar tiempo de ese dia, y si el boolean esta a true, elimino este ejercicio
	     ;else: si no se puede asignar, comprobar si hay algun ejercicio que entre en el tiempo restante, y si no se puede hacer un break;
	;i++
	
;Mostrar todo el programa.
	    
;)
