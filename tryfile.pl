%sample medical code

% Medical Chatbot in Prologasdasdasd

% Define the symptoms and possible diagnoses
symptom(pain, fever).
symptom(pain, nausea).
symptom(fever, cough).
symptom(fever, headache).
symptom(cough, shortness_of_breath).
symptom(cough, chest_pain).
symptom(headache, dizziness).
symptom(headache, nausea).
diagnosis(fever, flu).
diagnosis(pain, muscle_strain).
diagnosis(cough, bronchitis).
diagnosis(headache, migraine).

% Define the rules for diagnosing a patient
diagnose(Patient, Disease) :-
    symptom(Symptom1, Symptom2),
    write('Do you have '), write(Symptom1), write(' or '), write(Symptom2), write('? '),
    read(Response),
    (Response == yes ->
        (diagnosis(Symptom1, Disease), assert(diagnosed(Patient, Disease)));
        (diagnosis(Symptom2, Disease), assert(diagnosed(Patient, Disease)))).

% Define the rules for responding to a patient's queries
response(Patient) :-
    write('What are your symptoms? '), read(Symptoms),
    (symptom(Symptoms, _) ->
        diagnose(Patient, Disease), write('You may have '), write(Disease), nl;
        write('I am sorry, I do not have information on that symptom.')), response(Patient).

% Define the main function to start the chatbot
chat :-
    write('Welcome to the Medical Chatbot. '), nl,
    write('Please enter your name: '), read(Patient),
    write('Hello, '), write(Patient), write('. How can I help you today? '), nl,
    response(Patient).