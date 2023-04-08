:- dynamic symptom_list/1.
symptom_list([]).

% Add an item to the global list
add_symptom(Symptom) :-
    retract(symptom_list(List)),
    asserta(symptom_list([Symptom|List])).

% Symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(rash).
symptom(toothache).    

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
symptom(fatigue).
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
% symptom(fatigue)
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
symptom(fatigue).

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
disease(chickenpox, [fever, headache, rash, papules, vesicles, scabs, loss_of_appetite, fatigue]).
% diseases with fatigue
disease(migraine, [fatigue, blurred_vision, headache, nausea, vomiting, dizziness, tingling_on_face, numbness_on_face, difficulty_speaking, mood_change]).
disease(diabetes, [fatigue, blurred_vision, frequent_urination, excessive_thrist, excessive_hunger, weight_loss, slow_healing]).
% diseases with abdominal pain
disease(thypoid, [abdominal_pain, constipation, body_aches]).
disease(cholera, [abdominal_pain, dehydration, diarrhea]).
% mouth disease
disease(tooth_decay, [toothache, discomfort, pain_while_chewing, tooth_has_holes, discolored_tooth]).
% diseases involving difficulty in breathing
disease(asthma, [shortness_of_breath, chest_tightness, chest_pain, wheezing]).
disease(pneumonia, [rapid_breathing, sweating, shaking_chills, confusion, appetite_loss]).

% Define the main function to start the chatbot
chat :-
    write('Welcome to the Medical Chatbot. '), nl,
    write('Please enter your name: '), read(Patient),
    write('Hello, '), write(Patient), write('. What are your chief complaint/s? '), nl,
    write('(1) Fever\n(2) Fatigue\n(3) Abdominal Pain\n(4) Toothache\n(5) Difficulty Breathing'), nl,
    % add_symptom(cough), add_symptom(fever), symptom_list(PatientSymptoms),  write(PatientSymptoms), nl,
    write('Type in the number that applies: '), read(ChiefC), nl,
    (
        ChiefC = 1 ->
            write('Chief Complaint: Fever'), nl,
            add_symptom(fever),
            write('Are you experiencing coughing (y/n)? '), read(Coughing), nl,
            (
                Coughing = 'y' -> (add_symptom(cough), write('Test'));
                Coughing = 'n' -> write('No Coughing.');
                write('Invalid input. Please try again.')
            ),
            write('Are you experiencing headaches (y/n)? '), read(Headache), nl,
            (
                Headache = 'y' -> add_symptom(headache);
                Headache = 'n' -> write('No headaches.');
                write('Invalid input. Please try again.')
            ),
            write('Are you experiencing rashes (y/n)? '), read(Rashes), nl,
            (
                Rashes = 'y' -> (add_symptom(rash), write('Are you experiencing tiny fluid-filled blisters (y/n)? '), read(Vesicles), nl,
                    (
                        Vesicles = 'y' -> (add_symptom(vesicles), write('Are you experiencing acne-like bumps on your skin (y/n)? '), read(Papules), nl,
                            (
                                Papules = 'y' -> (add_symptom(papules), write('Are you experiencing scabs (y/n)? '), read(Scabs), nl,
                                    (
                                        Scabs = 'y' -> add_symptom(scabs);
                                        Scabs = 'n' -> write('No Scabs.');
                                        write('Invalid input. Please try again.')
                                    )
                                ); 
                                Papules = 'n' -> write('No Papules.');
                                write('Invalid input. Please try again.')
                            )
                            
                        );
                        Vesicles = 'n' -> write('No Vesicles.');
                        write('Invalid input. Please try again.')
                    )
                );
                Rashes = 'n' -> write('No Rashes.');
                write('Invalid input. Please try again.')
            ),
            write('Are you experiencing fatigue (y/n)? '), read(Fatigue), nl,
            (
                Fatigue = 'y' -> add_symptom(fatigue);
                Fatigue = 'n' -> write('No Fatigue');
                write('Invalid input. Please try again.')
            ),
            write('Are you losing your appetite (y/n)? '), read(Appetite), nl,
            (
                Appetite = 'y' -> add_symptom(loss_of_appetite);
                Appetite = 'n' -> write('No Appetite');
                write('Invalid input. Please try again.')
            )

            % write('Are you experiencing  (Y/N)? '), read(Response), nl,
            % (
            %     Response = 'Y' -> add_symptom()
            % )
            

    ), nl,
    % read_strings(Strings), nl, format('Symptoms = ~w', [Strings]), nl,
    symptom_list(PatientSymptoms), format('Symptoms = ~w', [PatientSymptoms]), nl,
    diagnose_all(PatientSymptoms, Diseases), format('Diseases = ~w', [Diseases]), nl,
    forall(member(String, Diseases), process_diseases(String)).

    
% has_symptoms([], _).
% has_symptoms([Symptom|Rest], SymptomList) :-
%     member(Symptom, SymptomList),
%     has_symptoms(Rest, SymptomList).

diagnose(Disease, SymptomList) :-
    disease(Disease, Symptoms),
    subset(SymptomList, Symptoms).

% Find all diseases matching the symptom list
diagnose_all(SymptomList, Diseases) :-
    findall(Disease, diagnose(Disease, SymptomList), Diseases).

% subset check
subset([], _). 
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
%                     symptom(fatigue),
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