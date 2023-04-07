
patient_symptoms([]).

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

% diseases mainly with fever
disease(measles, [fever, cough, rash]).
disease(influenza, [fever, cough, stuffy_nose, chills, muscle_aches]).
disease(chickenpox, [fever, headache, papules, vesicles, scabs, loss_of_appetite, tiredness]).

% diseases with fatigue
disease(migraine, [fatigue, blurred_vision, headache, nausea, vomiting, dizziness, tingling_on_face, numbness_on_face, difficulty_speaking, mood_change]).
disease(diabetes, [fatigue, blurred_vision, frequent_urination, excessive_thrist, excessive_hunger, weight_loss, slow_healing]).

% diseases with abdominal pain
disease(thypoid, [abdominal_pain, constipation, body_aches]).
disease(cholera, [abdominal_pain, dehydration, diarrhea]).

% mouth disease
disease(tooth_decay, [discomfort, pain_while_chewing, tooth_has_holes, discolored_tooth]).

% respiratory disease
disease(asthma, [shortness_of_breath, chest_tightness, chest_pain, wheezing]).
disease(pneumonia, [rapid_breathing, sweating, shaking_chills, confusion, appetite_loss]).


% disease(measles) :- symptom(fever), 
%                     symptom(cough), 
%                     symptom(rash), 
%                     not(symptom(headache)).

% disease(influenza) :- symptom(fever),
%                 symptom(cough), 
%                 symptom(stuffy_nose), 
%                 symptom(chills),
%                 symptom(muscle_aches).
%                 % hpi(dry,cough).

% disease(chickenpox) :-  symptom(fever), 
%                 symptom(headache), 
%                 symptom(papules), 
%                 symptom(vesicles), 
%                 symptom(scabs), 
%                 symptom(loss_of_appetite), 
%                 symptom(tiredness).

% disease(migraine) :- symptom(headache),
%             symptom(nausea),
%             symptom(vomiting),
%             symptom(blurred_vision),
%             symptom(dizziness),
%             symptom(tingling_on_face),
%             symptom(numbness_on_face),
%             symptom(difficulty_speaking),
%             symptom(fatigue),
%             symptom(moode_change).
%             % hpi(headache,throbbing_on_one_side).

% disease(diabetes) :- symptom(frequent_urination),
%                     symptom(excessive_thrist),
%                     symptom(excessive_hunger),
%                     symptom(weight_loss),
%                     %weight_loss(unexplained),
%                     symptom(fatique),
%                     symptom(blurred_vision),
%                     symptom(slow_healing).

% disease(thypoid) :- symptom(abdominal_pain),
%                     symptom(constipation),
%                     symptom(body_aches).
%                     % rash(trunk).
%                     % fever(high).

% disease(tooth_decay) :- symptom(discomfort), 
%                     symptom(pain_while_chewing), 
%                     symptom(tooth_has_holes), 
%                     symptom(discolored_tooth).

% disease(asthma) :-  symptom(shortness_of_breath), 
%                     symptom(chest_tightness), 
%                     symptom(chest_pain), 
%                     symptom(wheezing).

% disease(cholera) :- symptom(dehydration), 
%                     symptom(abdominal_cramps), 
%                     symptom(diarrhea).

% disease(pneumonia) :- symptom(sweating),
%                     symptom(shaking_chills),
%                     symptom(confusion),
%                     symptom(appetite_loss),
%                     symptom(rapid_breathing).

% Define the main function to start the chatbot
chat :-
    write('Welcome to the Medical Chatbot. '), nl,
    write('Please enter your name: '), read_line_to_string(user_input, Patient),
    write('Hello, '), write(Patient), write('. What is your chief complaint? '), nl,
    % write('(1) Fever\n(2) Fatigue\n(3) Abdominal Pain\n(4) Toothache\n(5) Difficulty Breathing'), nl,
    read_strings(Strings), nl, format('Symptoms = ~w', [Strings]), nl,
    diagnose_all(Strings, Diseases), format('Diseases = ~w', [Diseases]), nl,
    forall(member(String, Diseases), process_diseases(String)).

has_symptoms([], _).
has_symptoms([Symptom|Rest], SymptomList) :-
    member(Symptom, SymptomList),
    has_symptoms(Rest, SymptomList).

diagnose(Disease, SymptomList) :-
    disease(Disease, Symptoms),
    subset(SymptomList, Symptoms).

% Find all diseases matching the symptom list
diagnose_all(SymptomList, Diseases) :-
    findall(Disease, diagnose(Disease, SymptomList), Diseases).

% subset check
subset([], _). % An empty list is always a subset of any list.
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Define a predicate to process each element in the list
process_diseases(Disease) :-
    write(Disease), nl.

% Read line of strings
read_strings(Strings) :-
    read_line_to_codes(user_input, Codes),
    atom_codes(Atom, Codes),
    atomic_list_concat(Strings, ' ', Atom).
