% Symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(rash).




% % Diseases
% disease(malaria) :- symptom(fever), symptom(headache), symptom(nausea).
% disease(cold) :- symptom(cough), symptom(headache), symptom(sore_throat).
% disease(measles) :- symptom(fever), symptom(cough), symptom(rash), not(symptom(headache)).


% symptom(tooth_Ache).
% symptom(discomfort).
% symptom(pain_while_chewing).
% symptom(tooth_has_holes).
% symptom(discolored_tooth).
% disease(tooth_decay) :- symptom(tooth_Ache),symptom(discomfort),symptom(pain_while_chewing),symptom(tooth_has_holes),symptom(discolored_tooth).


% symptom(stuffy_nose).
% symptom(chills).
% symptom(fever).
% symptom(cough).
% cough(dry).
% symptom(muscle_aches).
% symptom().

% disease(influenza) :- symptom(cough), symptom(sore_throat).


% symptom().
% disease(diabetes) :- symptom(frequent_urination).




% DONT MIND THIS PART, PART NI ANDRE

% % Diagnosis
% diagnose(Disease) :-
%     disease(Disease), !.

% diagnose(unknown).

% % Backward chaining
% ask_symptom(Symptom) :-
%     write('Do you have '),
%     write(Symptom),
%     write('? (yes/no)'),
%     nl,
%     read(Response),
%     Response = yes.

% backchain(Disease) :-
%     disease(Disease),
%     !.

% backchain(Disease) :-
%     ask_symptom(Symptom),
%     symptom(Symptom),
%     not(asked(Symptom)),
%     assert(asked(Symptom)),
%     backchain(Disease).
