:- dynamic symptom_list/1.
symptom_list([]).

% Add an item to the global list
add_symptom(Symptom) :-
    retract(symptom_list(List)),
    asserta(symptom_list([Symptom|List])).

% Clear the symptom list
clear_symptom_list :-
    retractall(symptom_list(_)),
    assertz(symptom_list([])).

% diseases mainly with fever
disease(measles, 
    'A viral infection that causes fever, cough, runny nose, and a rash all over the body.' , 
    [fever, rash, high_fever, cough, white_spots_in_mouth, runny_nose], 
    'Treatment involves rest, fluids, and managing symptoms.').
disease(thypoid, 
    'A bacterial infection that causes fever, headache, and abdominal pain.', 
    [fever, rash, high_fever, headache, abdominal_pain, diarrhea, muscle_aches, fatigue],
    'Treatment involves antibiotics and managing symptoms.').
disease(influenza, 
    'A respiratory infection caused by the influenza virus. Symptoms include fever, cough, and body aches.',
    [fever, rash, cough, dry_cough, chills, vomiting, muscle_aches, runny_nose, fatigue, sore_throat],
    'Treatment involves rest, fluids, and antiviral medication.').
disease(pneumonia, 
    'An infection of the lungs that can cause coughing, fever, and difficulty breathing. ',
    [fever, rash, cough, chills, vomiting, muscle_aches, shortness_of_breath, difficulty_breathing, chest_pain, loss_of_appetite, fatigue, nausea],
    'Treatment involves antibiotics, oxygen therapy, and managing symptoms.').
disease(chickenpox, 
    'A viral infection that causes an itchy rash all over the body. It may come with fever.',
    [fever, rash, papules, vesicles, scabs, headache, loss_of_appetite, fatigue],
    'Treatment involves rest, fluids, and managing symptoms.').
% diseases involving difficulty in breathing
disease(asthma, 
    'A chronic lung condition that causes wheezing, coughing, and shortness of breath.',
    [difficulty_breathing, shortness_of_breath, cough, chest_tightness, chest_pain, wheezing],
    'Treatment involves medication to manage symptoms and prevent attacks.').
% diseases with fatigue
disease(migraine, 
    'A type of headache that can cause severe pain, nausea, and sensitivity to light and sound.',
    [fatigue, blurred_vision, headache, throbbing_headache, nausea, vomiting, tingling_on_face, numbness_on_face, mood_change],
    'Treatment involves medication to manage symptoms and prevent attacks.').
disease(diabetes, 
    'A chronic condition in which the body cannot properly regulate blood sugar levels.',
    [fatigue, blurred_vision, frequent_urination, excessive_thirst, excessive_hunger, weight_loss, slow_healing],
    'Treatment involves medication, lifestyle changes, and monitoring blood sugar levels.').
% diseases with abdominal pain
disease(cholera, 
    'A bacterial infection that can cause severe diarrhea and dehydration. ',
    [nausea, vomiting, abdominal_pain, dehydration, diarrhea],
    'Treatment involves rehydration therapy and antibiotics.').
% mouth disease
disease(tooth_decay, 
    'A condition in which bacteria in the mouth cause cavities to form in the teeth.',
    [toothache, discomfort, pain_while_chewing, tooth_has_holes, discolored_tooth, sensitive_teeth],
    'Treatment involves filling the cavities and practicing good oral hygiene.').

ask_chiefc :-
    write('Type in the number that applies: '), read(ChiefC), nl,
    (
        ChiefC = 1 ->
        (   
            write('Chief Complaint: Fever'), nl,
            add_symptom(fever),
            ask_highfever,
            ask_rashes,
            ask_cough,
            ask_runnynose,
            ask_headache,
            ask_shortofbreath,
            ask_appetite,
            ask_fatigue,
            ask_nausea,
            ask_vomiting,
            ask_chills,
            ask_muscleache,
            ask_diarrhea,
            ask_abdopain,
            ask_chestpain,
            ask_sorethroat
        );
        ChiefC = 2 ->
        (   
            write('Chief Complaint: Fatigue'), nl,
            add_symptom(fatigue),
            ask_headache,
            ask_blurryvision,
            ask_nausea,
            ask_vomiting,
            ask_facenumbness,
            ask_facetingles,
            ask_weightloss,
            ask_hunger,
            ask_thirst,
            ask_healing,
            ask_moodchange
        );
        ChiefC = 3 -> 
        (
            write('Chief Complaint: Abdominal Pain'), nl,
            add_symptom(abdominal_pain),
            ask_fever,
            ask_rashes,
            ask_nausea,
            ask_vomiting,
            ask_dehydration,
            ask_diarrhea,
            ask_headache,
            ask_muscleache,
            ask_fatigue
            
        );
        ChiefC = 4 ->
        (
            write('Chief Complaint: Toothache'), nl,
            add_symptom(toothache),
            ask_discomfort,
            ask_painchewing,
            ask_toothholes,
            ask_discoloredteeth,
            ask_sensitiveteeth
        );
        ChiefC = 5 -> 
        (
            write('Chief Complaint: Difficulty Breathing'), nl,
            add_symptom(difficulty_breathing),
            ask_shortofbreath,
            ask_cough,
            ask_chestpain,
            ask_chesttightness,
            ask_wheezing,
            ask_fever,
            ask_rashes,
            ask_chills,
            ask_vomiting,
            ask_nausea,
            ask_muscleache,
            ask_appetite
        );
        ChiefC = 6 ->
        (
            write('Chief Complaint: Rashes'), nl,
            add_symptom(rash),
            ask_fever,
            ask_whitespots,
            ask_papules,
            ask_vesicles,
            ask_scabs,
            ask_cough,
            ask_runnynose,
            ask_headache,
            ask_shortofbreath,
            ask_appetite,
            ask_fatigue,
            ask_nausea,
            ask_vomiting,
            ask_chills,
            ask_muscleache,
            ask_diarrhea,
            ask_abdopain,
            ask_chestpain
        );
        ChiefC = 7 ->
        (
            write('Chief Complaint: Other'), nl,
            write('Please enter the symptoms you are experiencing separated with a space.'),nl,
            write('We will provide you with a diagnosis according to the symptoms.'), nl,
            write('Symptoms: '), nl, read_strings(Strings),
            forall(member(Symptom, Strings), add_symptom(Symptom))

        );
        write('Invalid input. Please try again.\n'), ask_chiefc
    ).

% Define the main function to start the chatbot
chat :-
    write('Welcome to the Medical Chatbot. '), nl,
    write('Please enter your name: '), read(Patient),
    write('Hello, '), write(Patient), write('. What is your chief complaint? '), nl,
    write('(1) Fever\n(2) Fatigue\n(3) Abdominal Pain\n(4) Toothache\n(5) Difficulty Breathing\n(6) Rashes\n(7) Other'), nl,
    ask_chiefc, nl,
    write('Diagnosis: '), nl,
    symptom_list(PatientSymptoms), format('Symptoms = ~w', [PatientSymptoms]), nl,
    diagnose_all(PatientSymptoms, _), clear_symptom_list.
    


% asking symptoms
ask_fever :-
    write('Do you have a fever (y/n)? '), read(Fever), nl,
    (
        Fever = 'y' -> add_symptom(fever);
        Fever = 'n' -> write('No Fever.\n');
        write('Invalid input. Please try again.\n'), ask_fever
    ).
ask_highfever :-
    write('Is your fever over 38 degrees Celsius (y/n)? '), read(Fever), nl,
    (
        Fever = 'y' -> add_symptom(high_fever);
        Fever = 'n' -> write('Normal Fever.\n');
        write('Invalid input. Please try again.\n'), ask_highfever
    ).

ask_whitespots :-
    write('Do you notice white spots in your mouth (y/n)? '), read(WhiteSpots), nl,
    (
        WhiteSpots = 'y' -> add_symptom(white_spots_in_mouth);
        WhiteSpots = 'n' -> (write('No White Spots in Mouth.\n'));
        write('Invalid input. Please try again.\n'), ask_whitespots
    ).
ask_vesicles :-
    write('Are you experiencing tiny fluid-filled blisters (y/n)? '), read(Vesicles), nl,
    (
        Vesicles = 'y' -> add_symptom(vesicles);
        Vesicles = 'n' -> write('No Vesicles.\n');
        write('Invalid input. Please try again.\n'), ask_vesicles
    ).
ask_papules :-
    write('Are you experiencing acne-like bumps on your skin (y/n)? '), read(Papules), nl,
    (
        Papules = 'y' -> add_symptom(papules); 
        Papules = 'n' -> write('No Papules.\n');
        write('Invalid input. Please try again.\n'), ask_papules
    ).
ask_scabs :- 
    write('Are you experiencing scabs (y/n)? '), read(Scabs), nl,
    (
        Scabs = 'y' -> add_symptom(scabs);
        Scabs = 'n' -> write('No Scabs.\n');
        write('Invalid input. Please try again.\n'), ask_scabs
    ).
ask_rashes :-
    write('Are you experiencing rashes (y/n)? '), read(Rashes), nl,
    (
        Rashes = 'y' -> (add_symptom(rash),
            ask_whitespots,
            ask_vesicles,
            ask_papules,
            ask_scabs
        );
        Rashes = 'n' -> write('No Rashes.\n');
        write('Invalid input. Please try again.\n'), ask_rashes
    ).
ask_cough :-
    write('Are you experiencing coughing (y/n)? '), read(Coughing), nl,
    (
        Coughing = 'y' -> (add_symptom(cough), ask_drycough);
        Coughing = 'n' -> write('No Coughing.\n');
        write('Invalid input. Please try again.\n'), ask_cough
    ).
ask_drycough :-
    write('Is the cough dry (y/n)?'), read(Drycough), nl,
    (
        Drycough = 'y' -> add_symptom(dry_cough);
        Drycough = 'n' -> write('Normal Cough.\n');
        write('Invalid input. Please try again.\n'), ask_drycough
    ).
ask_runnynose :-
    write('Do you have a runny nose (y/n)? '), read(RunnyNose), nl,
    (
        RunnyNose = 'y' -> add_symptom(runny_nose);
        RunnyNose = 'n' -> write('No Runny Nose.\n');
        write('Invalid input. Please try again.\n'), ask_runnynose
    ).
ask_headache :-
    write('Are you experiencing headaches (y/n)? '), read(Headache), nl,
    (
        Headache = 'y' -> (add_symptom(headache), ask_throbbingheadache);
        Headache = 'n' -> write('No Headaches.\n');
        write('Invalid input. Please try again.\n'), ask_headache
    ).
ask_shortofbreath :-
    write('Are you short of breath often (y/n)? '), read(ShortOfBreath), nl,
    (
        ShortOfBreath = 'y' -> add_symptom(shortness_of_breath);
        ShortOfBreath = 'n' -> write('No Shortness of Breath.\n');
        write('Invalid input. Please try again.\n'), ask_shortofbreath
    ).
ask_appetite :-
    write('Did you lose your appetite (y/n)? '), read(Appetite), nl,
    (
        Appetite = 'y' -> add_symptom(loss_of_appetite);
        Appetite = 'n' -> write('No Appetite Loss.\n');
        write('Invalid input. Please try again.\n'), ask_appetite
    ).
ask_fatigue :-
    write('Do you feel fatigued (y/n)? '), read(Fatigue), nl,
    (
        Fatigue = 'y' -> add_symptom(fatigue);
        Fatigue = 'n' -> write('No Fatigue.\n');
        write('Invalid input. Please try again.\n'), ask_fatigue
    ).
ask_nausea :-
    write('Do you feel nauseous (y/n)? '), read(Nausea), nl,
    (
        Nausea = 'y' -> add_symptom(nausea);
        Nausea = 'n' -> write('No Nausea.\n');
        write('Invalid input. Please try again.\n'), ask_nausea
    ).
ask_vomiting :-
    write('Are you vomiting (y/n)? '), read(Vomiting), nl,
    (
        Vomiting = 'y' -> add_symptom(vomiting);
        Vomiting = 'n' -> write('No Vomiting.\n');
        write('Invalid input. Please try again.\n'), ask_vomiting
    ).
ask_muscleache :-
    write('Are you experiencing muscle discomfort (y/n)? '), read(MuscleAches), nl,
    (
        MuscleAches = 'y' -> add_symptom(muscle_aches);
        MuscleAches = 'n' -> write('No Muscle Aches.\n');
        write('Invalid input. Please try again.\n'), ask_muscleache
    ).
ask_diarrhea :-
    write('Are you experiencing diarrhea (y/n)? '), read(Diarrhea), nl,
    (
        Diarrhea = 'y' -> add_symptom(diarrhea);
        Diarrhea = 'n' -> write('No Diarrhea.\n');
        write('Invalid input. Please try again.\n'), ask_diarrhea
    ).
ask_abdopain :-
    write('Are you experiencing abdominal pain (y/n)? '), read(AbdominalPain), nl,
    (
        AbdominalPain = 'y' -> add_symptom(abdominal_pain);
        AbdominalPain = 'n' -> write('No Abdominal Pain.\n');
        write('Invalid input. Please try again.\n'), ask_abdopain
    ).
ask_dehydration :-
    write('Are you feeling dehydrated (y/n)? '), read(Dehyrated), nl,
    (
        Dehyrated = 'y' -> add_symptom(dehydrated);
        Dehyrated = 'n' -> write('No Dehydration.\n');
        write('Invalid input. Please try again.\n'), ask_dehydration
    ).
ask_chesttightness :-
    write('Are you feeling any tightness or pressure in your chest (y/n)? '), read(ChestTightness), nl,
    (
        ChestTightness = 'y' -> add_symptom(chest_tightness);
        ChestTightness = 'n' -> write('No Tightness in Chest.\n');
        write('Invalid input. Please try again.\n'), ask_chesttightness
    ).
ask_chestpain :-
    write('Do you feel any discomfort or pain in your chest (y/n)?'), read(ChestPain), nl,
    (
        ChestPain = 'y' -> add_symptom(chest_pain);
        ChestPain = 'n' -> write('No Chest Pain.\n');
        write('Invalid input. Please try again.\n'), ask_chestpain
    ).
ask_wheezing :-
    write('Are you experiencing any high-pitched whistling sounds when you breathe, especially when exhaling (y/n)? '), read(Wheezing), nl,
    (
        Wheezing = 'y' -> add_symptom(wheezing);
        Wheezing = 'n' -> write('No Wheezing.\n');
        write('Invalid input. Please try again.\n'), ask_wheezing
    ).
ask_chills :-
    write('Are you experiencing any chills through your body (y/n)? '), read(Chills), nl,
    (
        Chills = 'y' -> add_symptom(chills);
        Chills = 'n' -> write('No Chills.\n');
        write('Invalid input. Please try again.\n'), ask_chills
    ).
ask_discomfort :-
    write('Are you experiencing discomfort (y/n)? '), read(Discomfort), nl,
    (
        Discomfort = 'y' -> add_symptom(discomfort);
        Discomfort = 'n' -> write('No Discomfort.\n');
        write('Invalid input. Please try again.\n'), ask_discomfort
    ).
ask_painchewing :-
    write('Is it painful to chew (y/n)? '), read(PainChewing), nl,
    (
        PainChewing = 'y' -> add_symptom(pain_while_chewing);
        PainChewing = 'n' -> write('No Pain while Chewing.\n');
        write('Invalid input. Please try again.\n'), ask_painchewing
    ).
ask_toothholes :-
    write('Do your teeth have visible holes (y/n)? '), read(TeethHoles), nl,
    (
        TeethHoles = 'y' -> add_symptom(tooth_has_holes);
        TeethHoles = 'n' -> write('No Holes in Teeth\n');
        write('Invalid input. Please try again.\n'), ask_toothholes
    ).
ask_sensitiveteeth :-
    write('Are your teeth sensitive to the temperature of food (y/n)? '), read(Sensitive), nl,
    (
        Sensitive = 'y' -> add_symptom(sensitive_teeth);
        Sensitive = 'n' -> write('Teeth not sensitive to temperature.\n');
        write('Invalid input. Please try again.\n'), ask_sensitiveteeth
    ).
ask_discoloredteeth :-
    write('Have you noticed any discoloration on your teeth (y/n)? '), read(Discoloration), nl,
    (
        Discoloration = 'y' -> add_symptom(discolored_tooth);
        Discoloration = 'n' -> write('No Discolored Teeth.\n');
        write('Invalid input. Please try again.\n'), ask_discoloredteeth
    ).
ask_blurryvision :-
    write('Are you suffering from blurred vision (y/n)? '), read(Bvision), nl,
    (
        Bvision = 'y' -> add_symptom(blurred_vision);
        Bvision = 'n' -> write('Clear vision.\n');
        write('Invalid input. Please try again.'), ask_blurryvision
    ).
ask_throbbingheadache :-
    write('Does the headache feel like throbbing (y/n)? '), read(Throbbing), nl,
    (
        Throbbing = 'y' -> add_symptom(throbbing_headache);
        Throbbing = 'n' -> write('Normal headache.\n');
        write('Invalid input. Please try again.'), ask_throbbingheadache
    ).
ask_facetingles :-
    write('Does your face feel tingly (y/n)? '), read(Tingles), nl,
    (
        Tingles = 'y' -> add_symptom(tingling_on_face);
        Tingles = 'n' -> write('No tingling.\n');
        write('Invalid input. Please try again.'), ask_facetingles
    ).
ask_facenumbness :-
    write('Does your face feel numb (y/n)? '), read(Numb), nl,
    (
        Numb = 'y' -> add_symptom(numbness_on_face);
        Numb = 'n' -> write('No numbness on face.\n');
        write('Invalid input. Please try again.'), ask_facenumbness
    ).
ask_moodchange :-
    write('Do you feel like your mood has significantly changed the past few days (y/n)? '), read(Mood), nl,
    (
        Mood = 'y' -> add_symptom(mood_change);
        Mood = 'n' -> write('No mood change.\n');
        write('Invalid input. Please try again.'), ask_moodchange
    ).

ask_urination :-
    write('Have you been frequently going to the toilet (y/n)? '), read(Urination), nl,
    (
        Urination = 'y' -> add_symptom(frequent_urination);
        Urination = 'n' -> write('Regularly urinates.\n');
        write('Invalid input. Please try again.'), ask_urination
    ).
ask_thirst :-
    write('Have you been feeling thirsty often (y/n)? '), read(Thirsty), nl,
    (
        Thirsty = 'y' -> add_symptom(excessive_thirst);
        Thirsty = 'n' -> write('No excessive thirst.\n');
        write('Invalid input. Please try again.'), ask_thirst
    ).
ask_hunger :-
    write('Have you been feeling hungry often (y/n)? '), read(Hungry), nl,
    (
        Hungry = 'y' -> add_symptom(excessive_hunger);
        Hungry = 'n' -> write('No excessive hunger.\n');
        write('Invalid input. Please try again.'), ask_hunger
    ).
ask_weightloss :-
    write('Have you lost a lot of weight lately (y/n)? '), read(Weight), nl,
    (
        Weight = 'y' -> add_symptom(weight_loss);
        Weight = 'n' -> write('No significant weight loss.\n');
        write('Invalid input. Please try again.'), ask_weightloss
    ).
ask_healing :-
    write('Is it taking a long time for your wounds to recover (y/n)? '), read(Healing), nl,
    (
        Healing = 'y' -> add_symptom(slow_healing);
        Healing = 'n' -> write('No signs of slow recovery.\n');
        write('Invalid input. Please try again.'), ask_healing
    ).
ask_sorethroat :-
    write('Do you have a sore throat (y/n)? '), read(SoreThroat), nl,
    (
        SoreThroat = 'y' -> add_symptom(sore_throat);
        SoreThroat = 'n' -> write('No sore throat.\n');
        write('Invalid input. Please try again.'), ask_sorethroat
    ).

% Check if disease applies to symptoms and calculate matching percentage
diagnose(Disease, SymptomList, Percentage) :-
    disease(Disease,_, Symptoms,_),
    subset(SymptomList, Symptoms),
    length(SymptomList, L1),
    length(Symptoms, L2),
    Percentage is (L1 / L2) * 100.

% Find all diseases matching the symptom list and calculate matching percentages
diagnose_all(SymptomList, DiseasePercentages) :-
    findall(Disease-Percentage, diagnose(Disease, SymptomList, Percentage), DiseasePercentages),
    (
        DiseasePercentages = [] ->
            % Execute these lines if the list is empty
            writeln('Unable to provide a diagnosis. Please refer to a large medical facility.');
        % Execute these lines if the list is not empty
        sort(2, @>=, DiseasePercentages, SortedDiseases),
        member(MostProbable, SortedDiseases),
        MostProbable = MaxDisease-MaxPercentage,
        disease(MaxDisease, Description, _, Treatment),
        format('All Possible Diseases = ~w', [SortedDiseases]), nl,
        write('Most Probable Disease: '), write(MaxDisease), nl,
        write('Description: '), write(Description), nl,
        write(Treatment), nl,
        write('Matching Percentage: '), format('~2f', MaxPercentage), write('%.'),nl
    ).

% subset check
subset([], _). 
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Read line of strings
read_strings(Strings) :-
    read_line_to_codes(user_input, _), % discard the newline character
    read_line_to_codes(user_input, Codes),
    atom_codes(Atom, Codes),
    atomic_list_concat(List, ' ', Atom),
    maplist(atom_string, Strings, List).
