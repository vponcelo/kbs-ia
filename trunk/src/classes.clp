;########################################################
;##################### CLASSES ##########################
;########################################################


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot bodyMass
;+		(comment "Index of body mass. Calculated by weight and height.")
		(type FLOAT)
		(range 10.0 35.0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(cardinality 1 7)
		(create-accessor read-write))
	(single-slot max_duration
;+		(comment "Maximum duration of exercise")
		(type INTEGER)
		(range 1 120)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot contra_indications
;+		(comment "Benefits of the exercise")
		(type SYMBOL)
		(allowed-values joins_pain cervical_pain high_pressure column_problems)
		(cardinality 0 4)
		(create-accessor read-write))
	(single-slot last_name
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot exercises
;+		(comment "Exercises of person")
		(type INSTANCE)
;+		(allowed-classes Exercise)
		(create-accessor read-write))
	(single-slot weight
;+		(comment "weight in kg")
		(type INTEGER)
		(range 25 150)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot min_rep
;+		(comment "Minimum number of repetitions")
		(type INTEGER)
		(range 1 100)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot series
;+		(comment "Series of exercises")
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot frequency
;+		(comment "Frequency of activities")
		(type SYMBOL)
		(allowed-values few medium quite very_high)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default none)
		(cardinality 0 8)
		(create-accessor read-write))
	(multislot diet
;+		(comment "Diet of the person")
		(type SYMBOL)
		(allowed-values balanced lack_calcium lack_vitamines lack_iron excess_greases excess_sal snacking)
		(default balanced)
		(cardinality 1 7)
		(create-accessor read-write))
	(single-slot test
		(type INSTANCE)
;+		(allowed-classes TestPerson)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot min_duration
;+		(comment "Minimum duration of exercise")
		(type INTEGER)
		(range 1 60)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dizziness
;+		(comment "Dizzines sensation.")
		(type SYMBOL)
		(allowed-values no few quite high)
		(default no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pulsations_per_min
;+		(comment "Pulsations per minute. Between 100-180: Normal with the test done. More: Tachycardia. Less: Athletic or bradycardia")
		(type INTEGER)
		(range 40 250)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot muscular_tension
		(type SYMBOL)
		(allowed-values normal quite high)
		(default normal)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tiredness_sensation
;+		(comment "Tiredness sensation.")
		(type SYMBOL)
		(allowed-values few normal quite huge)
		(default normal)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot habits
;+		(comment "Habits of person")
		(type INSTANCE)
;+		(allowed-classes Habit)
		(create-accessor read-write))
	(single-slot num_cal_burned
;+		(comment "Number of calories burned")
		(type INTEGER)
		(range 1 5000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot type
;+		(comment "Type of exercises without weights")
		(type SYMBOL)
		(allowed-values apparatus floor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot testExercises
		(type INSTANCE)
;+		(allowed-classes WithoutWeights)
		(cardinality 1 3)
		(create-accessor read-write))
	(single-slot duration
;+		(comment "Duration of activity in minutes")
		(type INTEGER)
		(range 1 1440)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot blood_min_pressure
;+		(comment "Minimun blood pressure (diastolic pressure).  Normal: 65-80. Sports: 45-80. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 30 100)
		(default 80)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot age
;+		(comment "Age of the person.")
		(type INTEGER)
		(range 16 99)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot height
;+		(comment "height of person in cm")
		(type INTEGER)
		(range 120 240)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot basicPhyCondition
;+		(comment "Basic Physical conditions for person")
		(type INSTANCE)
;+		(allowed-classes BasicPhysicalCondition)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot difficulty_intensity
;+		(comment "Difficulty/intensity of the exercise and person (calculated by person and exercises features)")
		(type SYMBOL)
		(allowed-values easy medium hard)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot name_
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot max_rep
;+		(comment "Maximum number of repetitions")
		(type INTEGER)
		(range 1 200)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot muscular_groups
;+		(comment "Muscular groups trained by the exercise")
		(type SYMBOL)
		(allowed-values deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
		(cardinality 1 9)
		(create-accessor read-write))
	(single-slot blood_max_pressure
;+		(comment "Maximun pressure in mm Hg (sistolic pressure). Normal: 90-120. Sports: 75-120. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 70 150)
		(default 120)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot type_weight
;+		(comment "Type of weight of exercises with weights")
		(type SYMBOL)
		(allowed-values bar dumbbells apparatus)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Person
	(is-a USER)
	(role concrete)
	(single-slot last_name
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot exercises
;+		(comment "Exercises of person")
		(type INSTANCE)
;+		(allowed-classes Exercise)
		(create-accessor read-write))
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(cardinality 1 7)
		(create-accessor read-write))
	(single-slot basicPhyCondition
;+		(comment "Basic Physical conditions for person")
		(type INSTANCE)
;+		(allowed-classes BasicPhysicalCondition)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot habits
;+		(comment "Habits of person")
		(type INSTANCE)
;+		(allowed-classes Habit)
		(create-accessor read-write))
	(single-slot difficulty_intensity
;+		(comment "Difficulty/intensity of the exercise and person (calculated by person and exercises features)")
		(type SYMBOL)
		(allowed-values easy medium hard)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot test
		(type INSTANCE)
;+		(allowed-classes TestPerson)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot name_
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot age
;+		(comment "Age of the person.")
		(type INTEGER)
		(range 16 99)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Exercise
	(is-a USER)
	(role abstract)
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(cardinality 1 7)
		(create-accessor read-write))
	(single-slot max_duration
;+		(comment "Maximum duration of exercise")
		(type INTEGER)
		(range 1 120)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot contra_indications
;+		(comment "Benefits of the exercise")
		(type SYMBOL)
		(allowed-values joins_pain cervical_pain high_pressure column_problems)
		(cardinality 0 4)
		(create-accessor read-write))
	(single-slot difficulty_intensity
;+		(comment "Difficulty/intensity of the exercise and person (calculated by person and exercises features)")
		(type SYMBOL)
		(allowed-values easy medium hard)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot min_duration
;+		(comment "Minimum duration of exercise")
		(type INTEGER)
		(range 1 60)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot max_rep
;+		(comment "Maximum number of repetitions")
		(type INTEGER)
		(range 1 200)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot muscular_groups
;+		(comment "Muscular groups trained by the exercise")
		(type SYMBOL)
		(allowed-values deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
		(cardinality 1 9)
		(create-accessor read-write))
	(single-slot blood_max_pressure
;+		(comment "Maximun pressure in mm Hg (sistolic pressure). Normal: 90-120. Sports: 75-120. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 70 150)
		(default 120)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot num_cal_burned
;+		(comment "Number of calories burned")
		(type INTEGER)
		(range 1 5000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot min_rep
;+		(comment "Minimum number of repetitions")
		(type INTEGER)
		(range 1 100)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot series
;+		(comment "Series of exercises")
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot blood_min_pressure
;+		(comment "Minimun blood pressure (diastolic pressure).  Normal: 65-80. Sports: 45-80. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 30 100)
		(default 80)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default none)
		(cardinality 0 8)
		(create-accessor read-write)))

(defclass WithoutWeights
	(is-a Exercise)
	(role abstract)
	(single-slot type
;+		(comment "Type of exercises without weights")
		(type SYMBOL)
		(allowed-values apparatus floor)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Bike
	(is-a WithoutWeights)
	(role concrete)
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(default maintenance get_fit reduce_weight musculation balance rehabilitate)
		(cardinality 1 7)
		(create-accessor read-write))
	(multislot muscular_groups
;+		(comment "Muscular groups trained by the exercise")
		(type SYMBOL)
		(allowed-values deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
		(default quadriceps twins abdominal)
		(cardinality 1 9)
		(create-accessor read-write))
	(multislot contra_indications
;+		(comment "Benefits of the exercise")
		(type SYMBOL)
		(allowed-values joins_pain cervical_pain high_pressure column_problems)
		(default joins_pain high_pressure)
		(cardinality 0 4)
		(create-accessor read-write))
	(single-slot type
;+		(comment "Type of exercises without weights")
		(type SYMBOL)
		(allowed-values apparatus floor)
		(default apparatus)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default limited_mobility knee_ligaments)
		(cardinality 0 8)
		(create-accessor read-write)))

(defclass Run
	(is-a WithoutWeights)
	(role concrete)
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(default maintenance get_fit reduce_weight musculation balance)
		(cardinality 1 7)
		(create-accessor read-write))
	(multislot muscular_groups
;+		(comment "Muscular groups trained by the exercise")
		(type SYMBOL)
		(allowed-values deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
		(default deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
		(cardinality 1 9)
		(create-accessor read-write))
	(multislot contra_indications
;+		(comment "Benefits of the exercise")
		(type SYMBOL)
		(allowed-values joins_pain cervical_pain high_pressure column_problems)
		(default joins_pain cervical_pain high_pressure column_problems)
		(cardinality 0 4)
		(create-accessor read-write))
	(single-slot type
;+		(comment "Type of exercises without weights")
		(type SYMBOL)
		(allowed-values apparatus floor)
		(default apparatus)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default limited_mobility)
		(cardinality 0 8)
		(create-accessor read-write)))

(defclass Floor
	(is-a WithoutWeights)
	(role concrete)
	(multislot goal
;+		(comment "Goal of the exercise")
		(type SYMBOL)
		(allowed-values maintenance get_fit reduce_weight musculation flexibility balance rehabilitate)
		(default maintenance get_fit)
		(cardinality 1 7)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default limited_mobility)
		(cardinality 0 8)
		(create-accessor read-write)))

(defclass WithWeights
	(is-a Exercise)
	(role concrete)
	(single-slot type_weight
;+		(comment "Type of weight of exercises with weights")
		(type SYMBOL)
		(allowed-values bar dumbbells apparatus)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Habit
	(is-a USER)
	(role abstract)
	(single-slot duration
;+		(comment "Duration of activity in minutes")
		(type INTEGER)
		(range 1 1440)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot frequency
;+		(comment "Frequency of activities")
		(type SYMBOL)
		(allowed-values few medium quite very_high)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass InWork
	(is-a Habit)
	(role concrete))

(defclass OutWork
	(is-a Habit)
	(role concrete))

(defclass Movements
	(is-a Habit)
	(role concrete))

(defclass TestPerson
	(is-a USER)
	(role concrete)
	(single-slot pulsations_per_min
;+		(comment "Pulsations per minute. Between 100-180: Normal with the test done. More: Tachycardia. Less: Athletic or bradycardia")
		(type INTEGER)
		(range 40 250)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot muscular_tension
		(type SYMBOL)
		(allowed-values normal quite high)
		(default normal)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot testExercises
		(type INSTANCE)
;+		(allowed-classes WithoutWeights)
		(cardinality 1 3)
		(create-accessor read-write))
	(single-slot tiredness_sensation
;+		(comment "Tiredness sensation.")
		(type SYMBOL)
		(allowed-values few normal quite huge)
		(default normal)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dizziness
;+		(comment "Dizzines sensation.")
		(type SYMBOL)
		(allowed-values no few quite high)
		(default no)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass BasicPhysicalCondition
	(is-a USER)
	(role concrete)
	(single-slot bodyMass
;+		(comment "Index of body mass. Calculated by weight and height.")
		(type FLOAT)
		(range 10.0 35.0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot height
;+		(comment "height of person in cm")
		(type INTEGER)
		(range 120 240)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot blood_max_pressure
;+		(comment "Maximun pressure in mm Hg (sistolic pressure). Normal: 90-120. Sports: 75-120. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 70 150)
		(default 120)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot weight
;+		(comment "weight in kg")
		(type INTEGER)
		(range 25 150)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot blood_min_pressure
;+		(comment "Minimun blood pressure (diastolic pressure).  Normal: 65-80. Sports: 45-80. : lower: Hypotension. Higher: Hypertension")
		(type INTEGER)
		(range 30 100)
		(default 80)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot diet
;+		(comment "Diet of the person")
		(type SYMBOL)
		(allowed-values balanced lack_calcium lack_vitamines lack_iron excess_greases excess_sal snacking)
		(default balanced)
		(cardinality 1 7)
		(create-accessor read-write))
	(multislot muscular_problems
;+		(comment "Muscular problems of a person")
		(type SYMBOL)
		(allowed-values none back_pain limited_mobility ankle_sprain wrist_sprain neck_pain arm_pain knee_ligaments)
		(default none)
		(cardinality 0 8)
		(create-accessor read-write)))