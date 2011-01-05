;########################################################
;##################### MESSAGES #########################
;########################################################


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
		(printout t "    weight: " (send ?self:basicPhyCondition get-weight) " kg " crlf) 
		(printout t "    index of body mass: " (send ?self:basicPhyCondition get-bodyMass)   crlf)
		(printout t "    blood maximum pressure: " (send ?self:basicPhyCondition get-blood_max_pressure) " sistolic " crlf)
		(printout t "    blood minimum pressure: " (send ?self:basicPhyCondition get-blood_min_pressure) " diastolic " crlf)
		(printout t "    diet: " (send ?self:basicPhyCondition get-diet) crlf)
		(printout t "    muscular problems: " (send ?self:basicPhyCondition get-muscular_problems) crlf)
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