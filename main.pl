% Symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(rash).
symptom(tooth_ache).    

% Symptoms of Tooth Decay
symptom(discomfort).
symptom(pain_while_chewing).
symptom(tooth_has_holes).
symptom(discolored_tooth).

% Symptoms of Influenza
symptom(stuffy_nose).
symptom(chills).
% symptom(fever).
% symptom(cough).
cough(dry).
symptom(muscle_aches).

% Symptoms of Asthma
symptom(shortness_of_breath).
symptom(chest_tightness).
symptom(chest_pain).
symptom(wheezing).
% symptom(cough).
symptom(difficulty_breathing).

% Symptoms of -






% Diseases
disease(malaria) :- symptom(fever), symptom(headache), symptom(nausea).
disease(cold) :- symptom(cough), symptom(headache), symptom(sore_throat).
disease(measles) :- symptom(fever), symptom(cough), symptom(rash), not(symptom(headache)).
disease(tooth_decay) :- symptom(discomfort), symptom(pain_while_chewing), symptom(tooth_has_holes), symptom(discolored_tooth).
disease(influenza) :- symptom(stuffy_nose), symptom(chills), symptom(muscle_aches).
