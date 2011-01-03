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
	(tiredness_sensation few))

([test2] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 115)
	(tiredness_sensation normal))

([test3] of  TestPerson

	(dizziness few)
	(muscular_tension normal)
	(pulsations_per_min 122)
	(tiredness_sensation quite))

([test4] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 142)
	(tiredness_sensation quite))

([test5] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 146)
	(tiredness_sensation huge))

([test6] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 153)
	(tiredness_sensation normal))

([test7] of  TestPerson

	(dizziness no)
	(muscular_tension high)
	(pulsations_per_min 155)
	(tiredness_sensation normal))

([test8] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 183)
	(tiredness_sensation huge))

([test9] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 190)
	(tiredness_sensation huge))

([test10] of  TestPerson

	(dizziness few)
	(muscular_tension quite)
	(pulsations_per_min 110)
	(tiredness_sensation normal))
)

(definstances WithWeights

([back] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications column_problems)
	(difficulty_intensity hard)
	(goal maintenance get_fit reduce_weight musculation rehabilitate)
	(max_duration 2)
	(max_rep 15)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups lumbar dorsals biceps)
	(muscular_problems back_pain limited_mobility neck_pain)
	(num_cal_burned 260)
	(series 4)
	(type_weight apparatus))

([biceps] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications joins_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation rehabilitate)
	(max_duration 2)
	(max_rep 15)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups biceps)
	(muscular_problems limited_mobility arm_pain)
	(num_cal_burned 220)
	(series 3)
	(type_weight dumbbells))

([pectorals] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications joins_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation rehabilitate)
	(max_duration 2)
	(max_rep 15)
	(min_duration 1)
	(min_rep 6)
	(muscular_groups pectoralis)
	(muscular_problems limited_mobility arm_pain)
	(num_cal_burned 220)
	(series 4)
	(type_weight bar))

([quadriceps] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 60)
	(contra_indications joins_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation balance rehabilitate)
	(max_duration 3)
	(max_rep 25)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups quadriceps)
	(muscular_problems knee_ligaments limited_mobility)
	(num_cal_burned 220)
	(series 4)
	(type_weight apparatus))

([triceps] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications joins_pain)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation rehabilitate)
	(max_duration 2)
	(max_rep 15)
	(min_duration 1)
	(min_rep 3)
	(muscular_groups triceps)
	(muscular_problems arm_pain limited_mobility)
	(num_cal_burned 220)
	(series 3)
	(type_weight dumbbells))

)

(definstances Bike

([bike_easy] of  Bike

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(contra_indications joins_pain high_pressure)
	(difficulty_intensity easy)
	(goal maintenance get_fit reduce_weight musculation balance rehabilitate)
	(max_duration 10)
	(max_rep 1)
	(min_duration 5)
	(min_rep 1)
	(muscular_groups quadriceps twins abdominal)
	(muscular_problems limited_mobility knee_ligaments)
	(num_cal_burned 210)
	(series 1)
	(type apparatus))
)

(definstances Run

([run_easy] of  Run

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(contra_indications joins_pain cervical_pain high_pressure column_problems)
	(difficulty_intensity easy)
	(goal maintenance get_fit reduce_weight musculation balance)
	(max_duration 10)
	(max_rep 1)
	(min_duration 5)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility)
	(num_cal_burned 270)
	(series 1)
	(type apparatus))
)

(definstances Floor

([abdominals] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications column_problems)
	(difficulty_intensity hard)
	(goal get_fit reduce_weight musculation maintenance balance rehabilitate)
	(max_duration 3)
	(max_rep 50)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups abdominal)
	(muscular_problems limited_mobility)
	(num_cal_burned 250)
	(series 5)
	(type floor))

([dominates] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications joins_pain cervical_pain column_problems)
	(difficulty_intensity medium)
	(goal maintenance get_fit musculation balance rehabilitate)
	(max_duration 2)
	(max_rep 25)
	(min_duration 1)
	(min_rep 5)
	(muscular_groups deltoids biceps dorsals)
	(muscular_problems back_pain limited_mobility)
	(num_cal_burned 300)
	(series 3)
	(type apparatus))

([stretching] of  Floor

	(blood_max_pressure 140)
	(blood_min_pressure 60)
	(contra_indications joins_pain cervical_pain column_problems)
	(difficulty_intensity medium)
	(goal maintenance flexibility get_fit balance rehabilitate)
	(max_duration 10)
	(max_rep 1)
	(min_duration 3)
	(min_rep 1)
	(muscular_groups deltoids biceps triceps quadriceps pectoralis abdominal lumbar twins dorsals)
	(muscular_problems limited_mobility)
	(num_cal_burned 110)
	(series 1)
	(type floor))
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
