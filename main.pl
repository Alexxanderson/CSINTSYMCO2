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
symptom(sensitive_eating).
% hpi(hot, sensitive_eating). 
% hpi(cold, sensitive_eating).

% Symptoms of Influenza
symptom(stuffy_nose).
symptom(chills).
% symptom(fever).
% symptom(cough).
symptom(muscle_aches).
% HPI
% hpi(dry, cough).

% Symptoms of Typhoid Fever
% symptom(fever)
% symptom(headache)
symptom(abdominal_pain).
% symptom(diarrhea)
symptom(constipation).
% symptom(loss_of_appetite)
% symptom(vomiting)
symptom(body_aches).
% symptom(rash)
% rash(trunk).
% fever(high).

% Symptoms of Asthma
symptom(shortness_of_breath).
symptom(chest_tightness).
symptom(chest_pain).
symptom(wheezing).
% symptom(cough).
symptom(difficulty_breathing).

% Symptoms of Cholera
symptom(dehydration).
% symptom(nausea)
% symptom(vomiting)
symptom(abdominal_cramps).
symptom(diarrhea).
% diarrhea(watery).
% diarrhea(rice_water).

% Symptoms of Diabetes
symptom(frequent_urination).
symptom(excessive_thrist).
symptom(excessive_hunger).
symptom(weight_loss).
% weight_loss(unexplained).
symptom(fatique).
symptom(blurred_vision).
symptom(slow_healing).

% Symptoms of Pneumonia
% symptom(cough)
% symptom(fever)
symptom(sweating).
symptom(shaking_chills).
% symptom(shortness_of_breath)
% symptom(chest_pain)
symptom(confusion).
% symptom(nausea)
% symptom(vomiting)
% symptom(diarrhea)
% symptom(muscle_aches)
% symptom(fatique)
% symptom(difficulty_breathing)
symptom(loss_of_appetite).
symptom(rapid_breathing).


% Symptoms of Chickenpox
% symptom(fever). 
% symptom(headache).
symptom(papules).
symptom(vesicles).
symptom(scabs).
% symptom(loss_of_appetite).
symptom(tiredness).

% symptoms of Migraine
% symptom(headache).
% symptom(nausea).
% symptom(vomiting).
% symptom(blurred_vision).
symptom(dizziness).
symptom(numbness_on_face).
symptom(tingling_on_face).
symptom(difficulty_speaking).
symptom(fatigue).
symptom(mood_change).
% HPI
% hpi(headache,throbbing_on_one_side).



disease(diabetes) :- symptom(frequent_urination),
                    symptom(excessive_thrist),
                    symptom(excessive_hunger),
                    symptom(weight_loss),
                    %weight_loss(unexplained),
                    symptom(fatique),
                    symptom(blurred_vision),
                    symptom(slow_healing).
disease(thypoid) :- symptom(abdominal_pain),
                    symptom(constipation),
                    symptom(body_aches).
                    % rash(trunk).
                    % fever(high).
disease(measles) :- symptom(fever), 
                    symptom(cough), 
                    symptom(rash), 
                    not(symptom(headache)).
disease(tooth_decay) :- symptom(discomfort), 
                    symptom(pain_while_chewing), 
                    symptom(tooth_has_holes), 
                    symptom(discolored_tooth).

disease(influenza) :- symptom(stuffy_nose), 
                    symptom(chills),
                    symptom(fever),
                    symptom(cough), 
                    symptom(muscle_aches).
                    % hpi(dry,cough).

disease(asthma) :-  symptom(shortness_of_breath), 
                    symptom(chest_tightness), 
                    symptom(chest_pain), 
                    symptom(wheezing).
disease(cholera) :- symptom(dehydration), 
                    symptom(abdominal_cramps), 
                    symptom(diarrhea).
disease(pneumonia) :- symptom(sweating),
                    symptom(shaking_chills),
                    symptom(confusion),
                    symptom(appetite_loss),
                    symptom(rapid_breathing).
 disease(chickenpox) :-  symptom(fever), 
                    symptom(headache), 
                    symptom(papules), 
                    symptom(vesicles), 
                    symptom(scabs), 
                    symptom(loss_of_appetite), 
                    symptom(tiredness).
disease(migraine) :- symptom(headache),
                        symptom(nausea),
                        symptom(vomiting),
                        symptom(blurred_vision),
                        symptom(dizziness),
                        symptom(tingling_on_face),
                        symptom(numbness_on_face),
                        symptom(difficulty_speaking),
                        symptom(fatigue),
                        symptom(moode_change).
                        % hpi(headache,throbbing_on_one_side).

