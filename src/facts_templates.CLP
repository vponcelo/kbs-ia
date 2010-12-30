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