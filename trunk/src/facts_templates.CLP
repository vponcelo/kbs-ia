;#########################################################
;################## TEMPLATES & FACTS ####################
;#########################################################

; Template con la edad y objetivos
(deftemplate personalData
	(slot age)
	(multislot goal)
)

(deffacts persDat
	(personalData
		(age unknown)
		(goal unknown)
	)
)


; Template con los habitos
(deftemplate habit
	(slot duration)
	(slot frequency)
)

(deffacts hab
	(habit
		(duration unknown)
		(frequency unknown)
	)
)

; Template con las condiciones físicas básicas
(deftemplate BasicPhyCond
	(slot bodyMass)
	(slot height)
	(slot blood_max_pressure)
	(slot weight)
	(slot blood_min_pressure)
)
(deffacts bpc
	(bodyMass unknown) 
	(height unknown) 
	(blood_max_pressure unknown)
	(weight unknown) 
	(blood_min_pressure unknown)
)