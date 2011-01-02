;#########################################################
;################## TEMPLATES & FACTS ####################
;#########################################################

; Template con la edad y objetivos
(deftemplate personalData
	(slot name_)
	(slot last_name)
	(slot age)
	(multislot goal)
)

(deffacts persDat
	(personalData
		(name_ unknown)
		(last_name unknown)
		(age unknown)
		(goal unknown)
	)
)


; Template con los habitos
(deftemplate habitsPerson
	(multislot habits)
)

(deffacts habs
	(habitsPerson
		(habits unknown)
	)
)

; Template con las condiciones físicas básicas
(deftemplate basicPhyCond
	(slot bodyMass)
	(slot height)
	(slot blood_max_pressure)
	(slot weight)
	(slot blood_min_pressure)
	(multislot diet)
	(multislot muscular_problems)
)
(deffacts bpc
	(basicPhyCond
		(bodyMass unknown) 
		(height unknown) 
		(blood_max_pressure unknown)
		(weight unknown) 
		(blood_min_pressure unknown)
		(diet unknown)
		(muscular_problems unknown)
	)
)

; Template con la dificultad/intensidad inicial que puede soportar el usuario calculada a partir de sus habitos
(deftemplate difficultyIntensity
	(slot difficulty_intensity)
)

(deffacts dif_intens
	(difficultyIntensity
		(difficulty_intensity unknown)
	)
)

; Template con la dificultad/intensidad inicial que puede soportar el usuario calculada a partir de sus habitos
(deftemplate testPerson
	(slot pulsations_per_min)	
	(slot muscular_tension)
	(slot tiredness_sensation)
	(slot dizziness)
	(multislot testExercises)
)

(deffacts testPers
	(testPerson
		(pulsations_per_min unknown)	
		(muscular_tension unknown)
		(tiredness_sensation unknown)
		(dizziness unknown)
		(testExercises unknown)
	)
)