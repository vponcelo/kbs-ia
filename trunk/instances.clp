; Tue Dec 28 17:53:22 CET 2010
; 
;+ (version "3.4.4")
;+ (build "Build 579")

(definstances Person

([Alex] of  Person

	(age 18)
	(basicPhyCondition [pract2_Class4])
	(goal maintenance)
	(name "Alex")
	(test [pract2_Class14]))

([Ana] of  Person

	(age 35)
	(basicPhyCondition [pract2_Class5])
	(goal rehabilitate musculation)
	(name "Anna")
	(test [pract2_Class12]))

([Javi] of  Person

	(age 22)
	(basicPhyCondition [pract2_Class6])
	(goal musculation)
	(name "Javi")
	(test [pract2_Class17]))

([Juan] of  Person

	(age 29)
	(basicPhyCondition [pract2_Class7])
	(goal get_fit)
	(name "Juan")
	(test [pract2_Class19]))

([Kevin] of  Person

	(age 30)
	(basicPhyCondition [pract2_Class8])
	(goal reduce_weight rehabilitate)
	(name "Kevin")
	(test [pract2_Class22]))

([Lucas] of  Person

	(age 53)
	(basicPhyCondition [pract2_Class9])
	(goal reduce_weight rehabilitate)
	(name "Lucas")
	(test [pract2_Class23]))

([Maite] of  Person

	(age 25)
	(basicPhyCondition [pract2_Class10])
	(goal musculation)
	(name "Maite")
	(test [pract2_Class18]))

([Marc] of  Person

	(age 26)
	(basicPhyCondition [pract2_Class11])
	(goal flexibility maintenance)
	(name "Marc")
	(test [pract2_Class20]))

([Pepe] of  Person

	(age 42)
	(basicPhyCondition [pract2_Class10012])
	(goal reduce_weight get_fit rehabilitate)
	(name "Pepe")
	(test [pract2_Class21]))

([Victor] of  Person

	(age 24)
	(basicPhyCondition [pract2_Class10013])
	(goal balance)
	(name "Victor")
	(test [pract2_Class15]))
)

(definstances floor

([abdominals] of  floor

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications column_problems)
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

([dominates] of  floor

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications joins_pain cervical_pain column_problems)
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
([stretching] of  floor

	(blood_max_pressure 140)
	(blood_min_pressure 60)
	(contra_indications joins_pain cervical_pain column_problems)
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

(definstances WithWeights

([back] of  WithWeights

	(blood_max_pressure 140)
	(blood_min_pressure 30)
	(contra_indications column_problems)
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

(definstances bike
([bike_easy] of  bike

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

(definstances BasicPhysicalCondition

([pract2_Class10] of  BasicPhysicalCondition

	(blood_max_pressure 110)
	(blood_min_pressure 70)
	(diet lack_vitamines)
	(height 162)
	(muscular_problems knee_ligaments)
	(weight 52))

([pract2_Class10012] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 83)
	(diet snacking)
	(height 173)
	(muscular_problems neck_pain arm_pain)
	(weight 83))

([pract2_Class10013] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 81)
	(diet balanced)
	(height 178)
	(muscular_problems none)
	(weight 77))

([pract2_Class11] of  BasicPhysicalCondition

	(blood_max_pressure 112)
	(blood_min_pressure 75)
	(diet lack_calcium)
	(height 176)
	(muscular_problems limited_mobility)
	(weight 76))

([pract2_Class4] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(diet balanced)
	(height 170)
	(muscular_problems none)
	(weight 80))

([pract2_Class5] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(diet balanced)
	(height 160)
	(muscular_problems ankle_sprain)
	(weight 59))

([pract2_Class6] of  BasicPhysicalCondition

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(diet lack_iron)
	(height 175)
	(muscular_problems back_pain arm_pain)
	(weight 79))

([pract2_Class7] of  BasicPhysicalCondition

	(blood_max_pressure 125)
	(blood_min_pressure 85)
	(diet excess_sal snacking)
	(height 169)
	(muscular_problems none)
	(weight 62))

([pract2_Class8] of  BasicPhysicalCondition

	(blood_max_pressure 139)
	(blood_min_pressure 89)
	(diet excess_greases excess_sal snacking lack_vitamines)
	(height 180)
	(muscular_problems limited_mobility)
	(weight 102))

([pract2_Class9] of  BasicPhysicalCondition

	(blood_max_pressure 139)
	(blood_min_pressure 85)
	(diet snacking excess_greases)
	(height 170)
	(muscular_problems wrist_sprain)
	(weight 80))
)








(definstances TestPerson

([pract2_Class12] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 115)
	(tiredness_sensation normal))

([pract2_Class14] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 93)
	(tiredness_sensation few))

([pract2_Class15] of  TestPerson

	(dizziness few)
	(muscular_tension quite)
	(pulsations_per_min 110)
	(tiredness_sensation normal))

([pract2_Class17] of  TestPerson

	(dizziness few)
	(muscular_tension normal)
	(pulsations_per_min 122)
	(tiredness_sensation quite))

([pract2_Class18] of  TestPerson

	(dizziness no)
	(muscular_tension high)
	(pulsations_per_min 155)
	(tiredness_sensation normal))

([pract2_Class19] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 142)
	(tiredness_sensation quite))

([pract2_Class20] of  TestPerson

	(dizziness high)
	(muscular_tension normal)
	(pulsations_per_min 183)
	(tiredness_sensation huge))

([pract2_Class21] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 190)
	(tiredness_sensation huge))

([pract2_Class22] of  TestPerson

	(dizziness high)
	(muscular_tension quite)
	(pulsations_per_min 146)
	(tiredness_sensation huge))

([pract2_Class23] of  TestPerson

	(dizziness no)
	(muscular_tension normal)
	(pulsations_per_min 153)
	(tiredness_sensation normal))
)

(definstances run

([run_easy] of  run

	(blood_max_pressure 120)
	(blood_min_pressure 80)
	(contra_indications joins_pain cervical_pain high_pressure column_problems)
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

(definstances InWork

([sitting] of  InWork

	(duration 300)
	(frequency very_high))

([weight_charge] of  InWork

	(duration 10)
	(frequency few))
)

(definstances OutWork

([up_stairs] of  OutWork

	(duration 5)
	(frequency quite))
)

(definstances Movements

([walk] of  Movements

	(duration 30)
	(frequency medium))
)
