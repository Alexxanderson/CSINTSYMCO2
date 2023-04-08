% Define the symptom predicates
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(rash).
symptom(toothache).
symptom(chest_tightness).
symptom(chest_pain).
symptom(wheezing).
symptom(high_fever).
symptom(dry_cough).


% Define diseases and their symptoms
disease(measles, [high_fever, cough, rash, white_spots_in_mouth]).
disease(influenza, [fever, dry_cough, runny_nose, chills, muscle_aches, vomiting]).
disease(pneumonia, [fever, cough, shortness_of_breath, chest_pain, fatigue]).

% Define rules to diagnose diseases based on symptoms
diagnose(Disease) :-
    symptom(S),
    has_symptom(Disease, S),
    (\+ (disease(DifferentDisease, _), has_symptom(DifferentDisease, S))),
    (\+ diagnosed_with(Disease)).

% Define a predicate to check if a disease has a specific symptom
has_symptom(Disease, Symptom) :-
    disease(Disease, Symptoms),
    member(Symptom, Symptoms).

% Define a predicate to record when a disease has been diagnosed
diagnosed_with(Disease) :-
    assertz(diagnosed(Disease)).

% Define a predicate to reset the system
reset_system :-
    retractall(diagnosed(_)).

% Define the main predicate to diagnose diseases based on user input
diagnose_all(Diseases) :-
    reset_system,
    findall(Disease, diagnose(Disease), Diseases),
    maplist(diagnosed_with, Diseases).