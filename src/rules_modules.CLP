;########################################################
;################## RULES & MODULES #####################
;########################################################

(defglobal ?*user* = null)
(defglobal ?*opc* = null)

(defmodule MAIN (export ?ALL))

; Starting rule
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

; Rule for initial prototype (*opc* = 1)
(defrule create-person
	(declare (salience 9998))
	?persDat <- (personalData (name_ unknown) (last_name unknown) (age unknown) (goal unknown))
	=>
	(bind ?usr (make-instance User1 of Person))
	(send ?usr put-difficulty_intensity [nil])
	(bind ?res (set-value "name"))
	(bind ?res2 (set-value "last_name"))
	(bind ?res3 (set-number "How old are you (between 16-130)" 16 130))
	(bind ?res4 (set-multi-from-list "What is/are your goal/s in the gym (select one firstly)" (slot-allowed-values Person goal)))
	(modify ?persDat (name_ ?res) (last_name ?res2) (age ?res3) (goal ?res4))
	(send ?usr put-name_ ?res)
	(send ?usr put-last_name ?res2)
	(send ?usr put-age ?res3)
	(send ?usr put-goal ?res4)
	(send ?usr print)
	(focus habits-module)
)

(defmodule habits-module (export ?ALL)(import createPerson-module ?ALL))

; Rule for initial prototype (*opc* = 1)
(defrule set-habits
	(declare (salience 9997))
	?habs <- (habitsPerson (habits unknown))
	=>
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
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
		(modify ?habs (habits ?lhabits))
		(send ?usr put-habits ?lhabits)
	)
	(focus difficulty_intensity-module)
)

(defmodule existingPerson-module (export ?ALL)(import MAIN ?ALL))

; Rule for both prototypes (*opc* = 1 or 2)
(defrule existing-person
	(declare (salience 9990))
	?persDat <- (personalData (name_ unknown) (last_name unknown) (age unknown) (goal unknown))
	?habs <- (habitsPerson (habits unknown))
	?bpc <- (basicPhyCond (bodyMass unknown) (height unknown) (blood_max_pressure unknown) (weight unknown) (blood_min_pressure unknown) (diet unknown) (muscular_problems unknown))
	?exsPerson <- (exercisesPerson (exercises unknown))
	=>
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ ?*user* ?persons)) ;Cogemos el index que ha introducido el user...
	(modify ?persDat (name_ (send ?usr get-name_)) (last_name (send ?usr get-last_name)) (age (send ?usr get-age)) (goal (send ?usr get-goal)))
	(modify ?habs (habits (send ?usr get-habits)))
	(bind ?userbpc (str-cat "MAIN::" (send ?usr get-basicPhyCondition)))
  (bind ?bpcs (find-all-instances ((?b BasicPhysicalCondition)) (eq (str-cat ?b) (str-cat ?userbpc))))
	(bind ?b_p_c (nth$ 1 ?bpcs))
	(bind ?h (send ?b_p_c get-height))
	(bind ?w (send ?b_p_c get-weight))
	(bind ?hmeters (/ ?h 100))
	(bind ?ibm (/ ?w (* ?hmeters ?hmeters)))
	(send ?b_p_c put-bodyMass ?ibm)
	(send ?usr put-basicPhyCondition ?b_p_c)
	(modify ?bpc (bodyMass ?ibm) (height ?h) (blood_max_pressure (send ?b_p_c get-blood_max_pressure)) (weight ?w) (blood_min_pressure (send ?b_p_c get-blood_min_pressure)) (diet (send ?b_p_c get-diet)) (muscular_problems (send ?b_p_c get-muscular_problems)))
	(modify ?exsPerson (exercises (send ?usr get-exercises)))
	(send ?usr print) 
	(focus difficulty_intensity-module)
)

(defmodule difficulty_intensity-module (export ?ALL)(import habits-module ?ALL)(import existingPerson-module ?ALL))

; Rule for both prototypes (*opc* = 1 or 2)
(defrule difficulty-intensity
	(declare (salience 9989))
	=>
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(switch ?*opc*
		(case 1 then
			(bind ?usr (nth$ (length$ ?persons) ?persons)) 		
			(bind ?di (set-difficulty ?usr))		; se calcula la dificultad a partir de sus habitos
		)
		(case 2 then
			(bind ?usr (nth$ ?*user* ?persons))
			(bind ?bpc (send ?usr get-basicPhyCondition))
			(if (or(> (send ?bpc get-bodyMass) 27) (< (send ?bpc get-bodyMass) 18)) then			
				(bind ?di easy)										; se asigna dificultad o intensidad easy a las personas con indice de masa corporal muy por debajo o encima de lo normal
			)
		)
	)	
	(send ?usr put-difficulty_intensity ?di)
	(send ?usr print)
	(switch ?*opc*
		(case 1 then
			(focus bpc-module)
		)
		(case 2 then
			(focus exercises-module)	
		)
	)
)

(defmodule bpc-module (export ?ALL)(import difficulty_intensity-module ?ALL))

; Rule for initial prototype (*opc* 1)
(defrule set-bpc
	(declare (salience 9988))
	?bpc <- (basicPhyCond (bodyMass unknown) (height unknown) (blood_max_pressure unknown) (weight unknown) (blood_min_pressure unknown) (diet unknown) (muscular_problems unknown))
	?basicPC <- (basicPhysicalCond (basicPhyCondition unknown))
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
	(modify ?basicPC (basicPhyCondition ?new))
	(if (or(> ?ibm 27) (< ?ibm 18)) then
		(send ?usr put-difficulty_intensity easy)
	)
	(send ?usr print)
	(focus test-module)
)

(defmodule test-module (export ?ALL)(import bpc-module ?ALL))

; Rule for initial prototype (*opc* 1)
(defrule set-test
	(declare (salience 9987))
	?testPers <- (testPerson (pulsations_per_min unknown) (muscular_tension unknown) (tiredness_sensation unknown) (dizziness unknown) (testExercises unknown))
	?exsPerson <- (exercisesPerson (exercises unknown))
	=>
	(bind ?test (make-instance test of TestPerson))
	(bind ?ltotalexs (find-all-instances ((?e Exercise)) TRUE))
	(bind ?lexs (create$))
	(bind ?i 1)
	(while (<= ?i (length$ ?ltotalexs)) do
		(bind ?e (nth$ ?i ?ltotalexs))
		(if (or(eq ?e [MAIN::bike_easy]) (eq ?e [MAIN::run_easy])) then
			(bind ?lexs (insert$ ?lexs 1 ?e))
		)
		(bind ?i (+ ?i 1))
	)
	(printout t "please answer the questions of the exercises done: " crlf ?lexs crlf crlf)
	(bind ?muscTens (set-single-from-list "What is your muscular tension" (slot-allowed-values TestPerson muscular_tension)))
	(bind ?tired (set-single-from-list "What is your tiredness sensation" (slot-allowed-values TestPerson tiredness_sensation)))
	(bind ?dizz (set-single-from-list "Are you dizzy" (slot-allowed-values TestPerson dizziness)))
	(bind ?persons (find-all-instances ((?p Person)) TRUE))
	(bind ?usr (nth$ (length$ ?persons) ?persons))
	(bind ?ppm (set-pulsations ?usr))
	(if (or(eq ?muscTens high) (eq ?dizz high) (eq ?tired huge) (> ?ppm 180)) then
		(send ?usr put-difficulty_intensity easy)				; personas con taquicardia o tension muscular, mareos o cansancio muy elevados asignar dificultad easy
	)
	(modify ?testPers (pulsations_per_min ?ppm) (muscular_tension ?muscTens) (tiredness_sensation ?tired) (dizziness ?dizz) (testExercises ?lexs))
	(send ?usr put-test ?test)
	(send ?test put-pulsations_per_min ?ppm)
	(send ?test put-muscular_tension ?muscTens)
	(send ?test put-tiredness_sensation ?tired)
	(send ?test put-dizziness ?dizz)
	(send ?test put-testExercises ?lexs)
	(send ?usr print)
	(focus exercises-module)
)

(defmodule exercises-module (export ?ALL)(import existingPerson-module ?ALL)(import difficulty_intensity-module ?ALL))

; Rule for both prototypes (*opc* = 1 or 2)
(defrule set-exercises
	(declare (salience 9986))
	?dif_intens <- (difficultyIntensity (difficulty_intensity unknown))
	?exsPerson <- (exercisesPerson (exercises unknown))
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
    (bind ?bpc (send ?usr get-basicPhyCondition))
	 )
	)
	(modify ?dif_intens (difficulty_intensity (send ?usr get-difficulty_intensity)))
	(bind ?i 1)
  (bind ?lexs (create$))
  ;1. Buscamos todos los ejercicios que cumplan los goals del usuario
  (while (<= ?i (length$ (send ?usr get-goal))) do
    (bind ?g (nth$ ?i (send ?usr get-goal)))
    (bind ?lexs (set-unique-list ?lexs (find-all-instances ((?e Exercise)) (member ?g ?e:goal))))      
    ;(printout t "goal actual: "?g "--> lista ejercicios: "?lexs crlf)  
    (bind ?i (+ ?i 1))
  )
  
  ;2. Eliminamos todos los los ejercicios de la lista creada que no sean de la misma intensidad a la que se puede someter el usuario
  (bind ?i 1)
  (while (<= ?i (length$ ?lexs)) do
    (bind ?e (nth$ ?i ?lexs))
    (if (not(eq (send ?e get-difficulty_intensity) (send ?usr get-difficulty_intensity))) then
      (bind ?lexs (delete-member$ ?lexs ?e))
      (printout t "Exercise deleted because of intensity: "?e crlf)
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
      (if (or(and(member ?contra (send ?bpc get-muscular_problems)) (not(eq ?contra none))) (> (send ?bpc get-blood_max_pressure) (send ?e get-blood_max_pressure)) (> (send ?bpc get-blood_min_pressure) (send ?e get-blood_min_pressure))) then
        (bind ?lexs (delete-member$ ?lexs ?e))
       	(printout t "Exercise deleted because of muscular problems or pressure: "?e crlf)
        (bind ?i (- ?i 1))    ; reasignar indices
        (break)
      else then 
        (bind ?j (+ ?j 1))
      )
    )
   (bind ?i (+ ?i 1))
  )
  (modify ?exsPerson (exercises ?lexs))
  (generate-schedule ?bpc ?lexs)
)