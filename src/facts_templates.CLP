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