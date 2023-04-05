% Symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(rash).

% Diseases
disease(malaria) :- symptom(fever), symptom(headache), symptom(nausea).
disease(cold) :- symptom(cough), symptom(headache), symptom(sore_throat).
disease(measles) :- symptom(fever), symptom(cough), symptom(rash), not(symptom(headache)).

% Diagnosis
diagnose(Disease) :-
    disease(Disease), !.

diagnose(unknown).

% Backward chaining
ask_symptom(Symptom) :-
    write('Do you have '),
    write(Symptom),
    write('? (yes/no)'),
    nl,
    read(Response),
    Response = yes.

backchain(Disease) :-
    disease(Disease),
    !.

backchain(Disease) :-
    ask_symptom(Symptom),
    symptom(Symptom),
    not(asked(Symptom)),
    assert(asked(Symptom)),
    backchain(Disease).
