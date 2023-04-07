symptom(fever).
symptom(cough).
symptom(rash). 
symptom(headache).
disease(measles, [fever, cough, rash]).

has_symptoms([], _).
has_symptoms([Symptom|Rest], SymptomList) :-
    member(Symptom, SymptomList),
    has_symptoms(Rest, SymptomList).

diagnose(Disease, SymptomList) :-
    disease(Disease, Symptoms),
    has_symptoms(Symptoms, SymptomList).