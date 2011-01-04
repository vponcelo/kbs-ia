;########################################################
;##################### INSTANCES ########################
;########################################################


(definstances Persons

([Alex] of  Person

	(age 18)
	(basicPhyCondition [bpc1])
	(goal maintenance)
	(habits
		[up_stairs]
		[walk])
	(name_ "Alex")
	(test [test1]))

([Ana] of  Person

	(age 35)
	(basicPhyCondition [bpc2])
	(goal rehabilitate musculation)
	(habits [sitting])
	(name_ "Anna")
	(test [test2]))

([Javi] of  Person

	(age 22)
	(basicPhyCondition [bpc3])
	(goal musculation rehabilitate)
	(habits
		[bike]
		[walk]
		[up_stairs]
		[homework])
	(name_ "Javi")
	(test [test3]))

([Juan] of  Person

	(age 29)
	(basicPhyCondition [bpc4])
	(goal get_fit)
	(habits [homework])
	(name_ "Juan")
	(test [test4]))

([Kevin] of  Person

	(age 30)
	(basicPhyCondition [bpc5])
	(goal reduce_weight rehabilitate)
	(name_ "Kevin")
	(test [test5]))

([Lucas] of  Person

	(age 53)
	(basicPhyCondition [bpc6])
	(goal reduce_weight rehabilitate)
	(habits [weight_charge])
	(name_ "Lucas")
	(test [test6]))

([Maite] of  Person

	(age 25)
	(basicPhyCondition [bpc7])
	(goal musculation)
	(name_ "Maite")
	(test [test7]))

([Marc] of  Person

	(age 26)
	(basicPhyCondition [bpc8])
	(goal flexibility maintenance rehabilitate)
	(habits [walk])
	(name_ "Marc")
	(test [test8]))

([Pepe] of  Person

	(age 42)
	(basicPhyCondition [bpc9])
	(goal reduce_weight get_fit rehabilitate)
	(name_ "Pepe")
	(test [test9]))

([Victor] of  Person

	(age 24)
	(basicPhyCondition [bpc10])
	(goal balance)
	(habits
		[sitting]
		[bike]
		[homework])
	(name_ "Victor")
	(test [test10]))
)

(definstances BasicPhysicalCondition

([bpc1] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(diet balanced)
	(height 170)
	(muscular_problems none)
	(weight 80))

([bpc2] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(diet balanced)
	(height 160)
	(muscular_problems ankle_sprain)
	(weight 59))

([bpc3] of  BasicPhysicalCondition

	(blood_max_pressure 121)
	(blood_min_pressure 80)
	(diet lack_iron)
	(height 175)
	(muscular_problems back_pain arm_pain)
	(weight 79))

([bpc4] of  BasicPhysicalCondition

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(diet excess_sal snacking)
	(height 169)
	(muscular_problems none)
	(weight 62))

([bpc5] of  BasicPhysicalCondition

	(blood_max_pressure 139)
	(blood_min_pressure 89)
	(diet excess_greases excess_sal snacking lack_vitamines)
	(height 180)
	(muscular_problems limited_mobility)
	(weight 102))

([bpc6] of  BasicPhysicalCondition

	(blood_max_pressure 139)
	(blood_min_pressure 85)
	(diet snacking excess_greases)
	(height 170)
	(muscular_problems wrist_sprain)
	(weight 80))

([bpc7] of  BasicPhysicalCondition

	(blood_max_pressure 110)
	(blood_min_pressure 70)
	(diet lack_vitamines)
	(height 162)
	(muscular_problems knee_ligaments)
	(weight 52))

([bpc8] of  BasicPhysicalCondition

	(blood_max_pressure 112)
	(blood_min_pressure 75)
	(diet lack_calcium)
	(height 176)
	(muscular_problems limited_mobility)
	(weight 76))

([bpc9] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 83)
	(diet snacking)
	(height 173)
	(muscular_problems neck_pain arm_pain)
	(weight 83))

([bpc10] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 81)
	(diet balanced)
	(height 178)
	(muscular_problems none)
	(weight 77))
)

(definstances TestPerson

([test1] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 93)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation few))

([test2] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 115)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation normal))

([test3] of  TestPerson

	(dizziness few)
	(muscular_tension normal)
	(pulsations_per_min 122)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation quite))

([test4] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 142)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation quite))

([test5] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 146)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation huge))

([test6] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 153)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation normal))

([test7] of  TestPerson

	(dizziness no)
	(muscular_tension high)
	(pulsations_per_min 155)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation normal))

([test8] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 183)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation huge))

([test9] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 190)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation huge))
	
([test10] of  TestPerson

	(dizziness few)
	(muscular_tension quite)
	(pulsations_per_min 110)
	(testExercises
		[bike_easy]
		[run_easy])
	(tiredness_sensation normal))
	
)

(definstances Exercises

([abdominals_easy] of  Floor

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit musculation reduce_weight balance)
	(max_duration 10)
	(max_rep 20)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems limited_mobility)
	(name_ex "Abdominals Easy")
	(num_cal_burned 180)
	(series 2)
	(type floor))

([abdominals_hard_level1] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation balance)
	(max_duration 6)
	(max_rep 50)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems limited_mobility)
	(name_ex "Abdominals Hard Level 1 (without Contraindications)")
	(num_cal_burned 230)
	(series 5)
	(type floor))

([abdominals_hard_level2] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications back_pain neck_pain)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation balance)
	(max_duration 3)
	(max_rep 50)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems none)
	(name_ex "Abdominals Hard Level 2")
	(num_cal_burned 250)
	(series 8)
	(type floor))

([abdominals_medium_level1] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation)
	(max_duration 8)
	(max_rep 30)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems limited_mobility)
	(name_ex "Abdominals Medium Level 1 (without Contraindications)")
	(num_cal_burned 200)
	(series 4)
	(type floor))

([abdominals_medium_level2] of  Floor

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications back_pain neck_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation)
	(max_duration 4)
	(max_rep 30)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems none)
	(name_ex "Abdominals Medium Level 2")
	(num_cal_burned 215)
	(series 6)
	(type floor))
	
([back_easy] of  WithWeights

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit rehabilitate balance)
	(max_duration 5)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups lumbar biceps dorsals deltoids)
	(muscular_problems back_pain limited_mobility neck_pain)
	(name_ex "Back Easy")
	(num_cal_burned 220)
	(series 2)
	(type_weight apparatus))

([back_hard_level1] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 2)
	(max_rep 15)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups deltoids biceps lumbar dorsals)
	(muscular_problems none)
	(name_ex "Back Hard Level 1 (without contraindications)")
	(num_cal_burned 300)
	(series 3)
	(type_weight apparatus))

([back_hard_level2] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications back_pain limited_mobility neck_pain)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 1)
	(max_rep 15)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups deltoids biceps lumbar dorsals)
	(muscular_problems none)
	(name_ex "Back Hard Level 2")
	(num_cal_burned 310)
	(series 3)
	(type_weight apparatus))

([back_medium_level1] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 3)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps lumbar dorsals deltoids)
	(muscular_problems back_pain limited_mobility neck_pain)
	(name_ex "Back Medium Level 1 (without contraindications)")
	(num_cal_burned 240)
	(series 3)
	(type_weight apparatus))

([back_medium_level2] of  WithWeights

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications back_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps dorsals lumbar deltoids)
	(muscular_problems none)
	(name_ex "Back Medium Level 2")
	(num_cal_burned 250)
	(series 3)
	(type_weight apparatus))

([biceps_easy] of  WithWeights

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit rehabilitate)
	(max_duration 5)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps)
	(muscular_problems arm_pain limited_mobility)
	(name_ex "Biceps Easy")
	(num_cal_burned 220)
	(series 2)
	(type_weight dumbbells))

([biceps_hard_level1] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups biceps)
	(muscular_problems none)
	(name_ex "Biceps Hard Level 1 (without contraindications)")
	(num_cal_burned 300)
	(series 3)
	(type_weight dumbbells))

([biceps_hard_level2] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications arm_pain wrist_sprain limited_mobility)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 1)
	(max_rep 15)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups biceps)
	(muscular_problems none)
	(name_ex "Biceps Hard Level 2")
	(num_cal_burned 310)
	(series 3)
	(type_weight dumbbells))

([biceps_medium_level1] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 3)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps)
	(muscular_problems none)
	(name_ex "Biceps Medium Level 1  (without contraindications)")
	(num_cal_burned 240)
	(series 3)
	(type_weight dumbbells))

([biceps_medium_level2] of  WithWeights

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications wrist_sprain limited_mobility)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps)
	(muscular_problems arm_pain)
	(name_ex "Biceps Medium Level 2")
	(num_cal_burned 250)
	(series 3)
	(type_weight dumbbells))
	
([bike_easy] of  Bike

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 10)
	(max_rep 1)
	(min_duration 5)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems limited_mobility knee_ligaments)
	(name_ex "Bike Easy 10 Minutes")
	(num_cal_burned 210)
	(series 1)
	(type apparatus))

([bike_hard_level1] of  Bike

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 25)
	(max_rep 1)
	(min_duration 20)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems limited_mobility knee_ligaments)
	(name_ex "Bike Hard Level 1 (without Contraindications)")
	(num_cal_burned 300)
	(series 1)
	(type apparatus))

([bike_hard_level2] of  Bike

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications limited_mobility knee_ligaments)
	(difficulty_intensity hard)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 30)
	(max_rep 1)
	(min_duration 25)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems none)
	(name_ex "Bike Hard Level 2")
	(num_cal_burned 350)
	(series 1)
	(type apparatus))

([bike_medium_level1] of  Bike

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 15)
	(max_rep 1)
	(min_duration 10)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems limited_mobility knee_ligaments)
	(name_ex "Bike Medium Level 1 (without Contraindications)")
	(num_cal_burned 250)
	(series 1)
	(type apparatus))

([bike_medium_level2] of  Bike

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications limited_mobility knee_ligaments)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 20)
	(max_rep 1)
	(min_duration 15)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems none)
	(name_ex "Bike Medium Level 2")
	(num_cal_burned 280)
	(series 1)
	(type apparatus))
	
([dominates_easy] of  Floor

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit musculation balance rehabilitate)
	(max_duration 5)
	(max_rep 15)
	(min_duration 1)
	(min_rep 2)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems back_pain arm_pain)
	(name_ex "Dominates Easy")
	(num_cal_burned 250)
	(series 3)
	(type apparatus))

([dominates_hard_level1] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation balance)
	(max_duration 3)
	(max_rep 20)
	(min_duration 1)
	(min_rep 10)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems none)
	(name_ex "Dominates Hard Level 1 (without Contraindications)")
	(num_cal_burned 350)
	(series 3)
	(type apparatus))

([dominates_hard_level2] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications back_pain wrist_sprain arm_pain)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation balance)
	(max_duration 2)
	(max_rep 25)
	(min_duration 1)
	(min_rep 10)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems none)
	(name_ex "Dominates Hard Level 2")
	(num_cal_burned 375)
	(series 4)
	(type apparatus))

([dominates_medium_level1] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation rehabilitate balance)
	(max_duration 3)
	(max_rep 15)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems back_pain)
	(name_ex "Dominates Medium Level 1 (without Contraindications)")
	(num_cal_burned 300)
	(series 3)
	(type apparatus))

([dominates_medium_level2] of  Floor

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications back_pain arm_pain wrist_sprain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation balance)
	(max_duration 2)
	(max_rep 20)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems none)
	(name_ex "Dominates Medium Level 2")
	(num_cal_burned 330)
	(series 4)
	(type apparatus))
	
([pectorals_easy] of  WithWeights

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit rehabilitate)
	(max_duration 5)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups pectoralis)
	(muscular_problems back_pain limited_mobility)
	(name_ex "Pectorals Easy")
	(num_cal_burned 220)
	(series 2)
	(type_weight apparatus))

([pectorals_hard_level1] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups pectoralis)
	(muscular_problems none)
	(name_ex "Pectoralis Hard Level 1 (without contraindications)")
	(num_cal_burned 300)
	(series 3)
	(type_weight apparatus))

([pectorals_hard_level2] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications arm_pain back_pain)
	(difficulty_intensity hard)
	(goal musculation)
	(max_duration 1)
	(max_rep 15)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups pectoralis)
	(muscular_problems none)
	(name_ex "Pectoralis Hard Level 2")
	(num_cal_burned 310)
	(series 3)
	(type_weight apparatus))

([pectorals_medium_level1] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 3)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups pectoralis)
	(muscular_problems none)
	(name_ex "Pectoralis Medium Level 1  (without contraindications)")
	(num_cal_burned 240)
	(series 3)
	(type_weight apparatus))

([pectorals_medium_level2] of  WithWeights

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications back_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups pectoralis)
	(muscular_problems arm_pain)
	(name_ex "Pectoralis Medium Level 2")
	(num_cal_burned 250)
	(series 3)
	(type_weight apparatus))
	
([quadriceps_easy] of  WithWeights

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit rehabilitate balance)
	(max_duration 5)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups quadriceps)
	(muscular_problems limited_mobility knee_ligaments)
	(name_ex "Quadriceps Easy")
	(num_cal_burned 220)
	(series 2)
	(type_weight apparatus))

([quadriceps_hard_level1] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal musculation balance)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups quadriceps)
	(muscular_problems none)
	(name_ex "Quadriceps Hard Level 1 (without contraindications)")
	(num_cal_burned 300)
	(series 3)
	(type_weight apparatus))

([quadriceps_hard_level2] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications knee_ligaments limited_mobility ankle_sprain)
	(difficulty_intensity hard)
	(goal musculation balance)
	(max_duration 1)
	(max_rep 15)
	(min_duration 1)
	(min_rep 1)
	(muscular_groups quadriceps)
	(muscular_problems none)
	(name_ex "Quadriceps Hard Level 2")
	(num_cal_burned 310)
	(series 3)
	(type_weight apparatus))

([quadriceps_medium_level1] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation balance)
	(max_duration 3)
	(max_rep 16)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups quadriceps)
	(muscular_problems none)
	(name_ex "Quadriceps Medium Level 1 (without contraindications)")
	(num_cal_burned 240)
	(series 3)
	(type_weight apparatus))

([quadriceps_medium_level2] of  WithWeights

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications ankle_sprain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation balance)
	(max_duration 2)
	(max_rep 12)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups quadriceps)
	(muscular_problems knee_ligaments)
	(name_ex "Quadriceps Medium Level 2")
	(num_cal_burned 250)
	(series 3)
	(type_weight apparatus))

([run_easy] of  Run

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 10)
	(max_rep 1)
	(min_duration 5)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility knee_ligaments ankle_sprain)
	(name_ex "Run Easy Level 1")
	(num_cal_burned 270)
	(series 1)
	(type apparatus))

([run_hard_level1] of  Run

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 25)
	(max_rep 1)
	(min_duration 20)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility knee_ligaments)
	(name_ex "Run Hard Level 1 (no Contraindications)")
	(num_cal_burned 400)
	(series 1)
	(type apparatus))

([run_hard_leven2] of  Run

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications knee_ligaments limited_mobility ankle_sprain)
	(difficulty_intensity hard)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 30)
	(max_rep 1)
	(min_duration 25)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems none)
	(name_ex "Run Hard Level 2")
	(num_cal_burned 450)
	(series 1)
	(type apparatus))

([run_medium_level1] of  Run

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 15)
	(max_rep 1)
	(min_duration 10)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility ankle_sprain knee_ligaments)
	(name_ex "Run Medium Level 1 (no Contraindications)")
	(num_cal_burned 300)
	(series 1)
	(type apparatus))

([run_medium_level2] of  Run

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications limited_mobility ankle_sprain knee_ligaments)
	(difficulty_intensity medium)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 20)
	(max_rep 1)
	(min_duration 15)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems none)
	(name_ex "Run Medium Level 2")
	(num_cal_burned 350)
	(series 1)
	(type apparatus))
	
([stretching_easy] of  Floor

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit flexibility balance rehabilitate)
	(max_duration 5)
	(max_rep 1)
	(min_duration 3)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems ankle_sprain wrist_sprain knee_ligaments arm_pain limited_mobility)
	(name_ex "Stretching Easy")
	(num_cal_burned 100)
	(series 1)
	(type floor))

([stretching_hard_level1] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit flexibility balance)
	(max_duration 20)
	(max_rep 1)
	(min_duration 10)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar dorsals twins)
	(muscular_problems limited_mobility)
	(name_ex "Stretching Hard Level 1 (without Contraindications)")
	(num_cal_burned 150)
	(series 1)
	(type floor))

([stretching_hard_level2] of  Floor

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications knee_ligaments wrist_sprain ankle_sprain)
	(difficulty_intensity hard)
	(goal maintenance get_fit flexibility balance)
	(max_duration 20)
	(max_rep 1)
	(min_duration 15)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility)
	(name_ex "Stretching Hard Level 2")
	(num_cal_burned 170)
	(series 1)
	(type floor))

([stretching_medium_level1] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit flexibility balance rehabilitate)
	(max_duration 8)
	(max_rep 1)
	(min_duration 5)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility ankle_sprain wrist_sprain arm_pain knee_ligaments)
	(name_ex "Stretching Medium Level 1 (without Contraindications)")
	(num_cal_burned 120)
	(series 1)
	(type floor))

([stretching_medium_level2] of  Floor

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications wrist_sprain ankle_sprain knee_ligaments arm_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit flexibility rehabilitate)
	(max_duration 14)
	(max_rep 1)
	(min_duration 8)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems none)
	(name_ex "Stretching Medium Level 2")
	(num_cal_burned 140)
	(series 1)
	(type floor))

([triceps_easy] of  WithWeights

	(blood_max_pressure 150)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity easy)
	(goal maintenance get_fit musculation rehabilitate)
	(max_duration 5)
	(max_rep 15)
	(min_duration 1)
	(min_rep 3)
	(muscular_groups triceps)
	(muscular_problems wrist_sprain arm_pain)
	(name_ex "Triceps Easy")
	(num_cal_burned 220)
	(series 3)
	(type_weight dumbbells))

([triceps_hard_level1] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications none)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation)
	(max_duration 5)
	(max_rep 25)
	(min_duration 2)
	(min_rep 10)
	(muscular_groups triceps)
	(muscular_problems none)
	(name_ex "Triceps Hard Level 1 (without Contraindications)")
	(num_cal_burned 300)
	(series 5)
	(type_weight dumbbells))

([triceps_hard_level2] of  WithWeights

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(contra_indications wrist_sprain arm_pain)
	(difficulty_intensity hard)
	(goal maintenance get_fit musculation)
	(max_duration 5)
	(max_rep 30)
	(min_duration 3)
	(min_rep 15)
	(muscular_groups triceps)
	(muscular_problems none)
	(name_ex "Triceps Hard Level 2")
	(num_cal_burned 330)
	(series 8)
	(type_weight dumbbells))

([triceps_medium_level1] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 90)
	(contra_indications none)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation rehabilitate)
	(max_duration 5)
	(max_rep 15)
	(min_duration 2)
	(min_rep 5)
	(muscular_groups triceps)
	(muscular_problems arm_pain wrist_sprain)
	(name_ex "Triceps Medium Level 1 (without Contraindications)")
	(num_cal_burned 250)
	(series 3)
	(type_weight dumbbells))

([triceps_medium_level2] of  WithWeights

	(blood_max_pressure 135)
	(blood_min_pressure 90)
	(contra_indications arm_pain wrist_sprain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation)
	(max_duration 4)
	(max_rep 20)
	(min_duration 2)
	(min_rep 8)
	(muscular_groups triceps)
	(muscular_problems none)
	(name_ex "Triceps Medium Level 2")
	(num_cal_burned 270)
	(series 5)
	(type_weight dumbbells))
)

(definstances InWork

([sitting] of  InWork

	(duration 300)
	(frequency very_high)
	(habit_class FALSE)
	(indexDuration 0 50 100 200)
	(name_habit "sitting")
	(type_hab sitting))

([weight_charge] of  InWork

	(duration 10)
	(frequency few)
	(habit_class TRUE)
	(indexDuration 0 50 100 200)
	(name_habit "weight_charge")
	(type_hab weight_charge))
)

(definstances OutWork

([up_stairs] of  OutWork

	(duration 5)
	(frequency quite)
	(habit_class TRUE)
	(indexDuration 0 5 10 15)
	(name_habit "up_stairs")
	(type_hab stairs))

([homework] of  OutWork

	(duration 5)
	(frequency few)
	(habit_class TRUE)
	(indexDuration 0 7 14 21)
	(name_habit "hung_clothes")
	(type_hab homeworks))
)

(definstances Movements

([walk] of  Movement

	(duration 30)
	(frequency medium)
	(habit_class TRUE)
	(indexDuration 0 30 60 120)
	(name_habit "walk")
	(type_hab walking))

([bike] of  Movement

	(duration 10)
	(frequency medium)
	(habit_class TRUE)
	(indexDuration 0 15 30 60)
	(name_habit "bike")
	(type_hab with_bike))
)
