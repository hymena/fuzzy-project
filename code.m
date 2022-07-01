mem =  mamfis('Name',"P.O.C");
mem = addInput(mem,[7,16], 'Name', "tem");
mem = addMF(mem,"tem","trimf",[7 7 9],"Name", "VC");
mem = addMF(mem,"tem","trimf",[7 9 11],"Name", "C");
mem = addMF(mem,"tem","trimf",[10 12 14],"Name", "N");
mem = addMF(mem,"tem","trimf",[12 14 16],"Name", "H");
mem = addMF(mem,"tem","trimf",[13 16 16],"Name", "VH");
mem = addInput(mem,[1.75 4.00], "Name", "pre");
mem = addMF(mem,"pre","trimf",[1.75 1.75 2.25],"Name", "VB");
mem = addMF(mem,"pre","trimf",[1.75 2.25 2.50],"Name", "B");
mem = addMF(mem,"pre","trimf",[2.25 2.75 3.25],"Name", "N");
mem = addMF(mem,"pre","trimf",[2.50 3.25 3.50],"Name", "G");
mem = addMF(mem,"pre","trimf",[2.75 4.00 4.0],"Name", "VG");
mem = addOutput(mem, [2.0 6.0], "Name", "per");
mem = addMF(mem, "per", "trimf", [2.0 2.0 3.0], "Name", "VB");
mem = addMF(mem, "per", "trimf", [2.0 3.0 4.0], "Name", "B");
mem = addMF(mem, "per", "trimf", [3.0 4.0 5.0], "Name", "N");
mem = addMF(mem, "per", "trimf", [4.0 5.0 6.0], "Name", "G");
mem = addMF(mem, "per", "trimf", [5.0 6.0 6.0], "Name", "VG");
rule1 = "If tem is VC and pre is VB then per is N";
rule2 = "If tem is C and pre is VB then per is B";
rule3 = "If tem is N and pre is VB then per is B";
rule4 = "If tem is H and pre is VB then per is B";
rule5 = "If tem is VH and pre is VB then per is VB";
rule6 = "If tem is VC and pre is B then per is N";
rule7 = "If tem is C and pre is B then per is G";
rule8 = "If tem is N and pre is B then per is N";
rule9 = "If tem is H and pre is B then per is B";
rule10 = "If tem is VH and pre is B then per is B";
rule11 = "If tem is VC and pre is N then per is G";
rule12 = "If tem is C and pre is N then per is G";
rule13 = "If tem is N and pre is N then per is N";
rule14 = "If tem is H and pre is N then per is N";
rule15 = "If tem is VH and pre is N then per is N";
rule16 = "If tem is VC and pre is G then per is VG";
rule17 = "If tem is C and pre is G then per is G";
rule18 = "If tem is N and pre is G then per is G";
rule19 = "If tem is H and pre is G then per is N";
rule20 = "If tem is VH and pre is G then per is N";
rule21 = "If tem is VC and pre is VG then per is VG";
rule22 = "If tem is C and pre is VG then per is VG";
rule23 = "If tem is N and pre is VG then per is VG";
rule24 = "If tem is H and pre is VG then per is G";
rule25 = "If tem is VH and pre is VG then per is G";
rules = [rule1 rule2 rule3 rule4 rule5 rule6 rule7 rule8 rule9 rule10 rule11 rule12 rule13 rule14 rule15 rule16 rule17 rule18 rule19 rule20 rule21 rule22 rule23 rule24 rule25];
mem = addRule(mem, rules);
mem.DefuzzificationMethod = "mom";
x = 1;
while x
    temperature_input = input("Give a temperature value between 7 and 16 \n ");
    if(temperature_input <= 16 && temperature_input >= 7)
        x=0;
    else
        disp("give a valid input! \n");
    end
end

x= 1;
while x
    pressure_input = input("Give a pressure value between 1.75 and 4.00 \n ");
    if(pressure_input <= 4 && pressure_input >= 1.75)
        x=0;
    else
        disp("give a valid input! \n");
    end
end

out = evalfis(mem,[temperature_input,pressure_input])


