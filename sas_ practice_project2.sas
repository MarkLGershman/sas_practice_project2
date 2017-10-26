/*keep works the same way*/
Data Mark.KeepBed;
set Mark.Bed;
keep Actual and Predict and Country and Product;
run;
/*you want salary range. Below 2000=poor. >2000 and below 3000=medium. >3000 rich.*/
data Mark.PayrollRang;
set Mark.Payroll;
input Identifier $10;
if Salary<20000 then Identifier="Poor";
if Salary>20000 and Salary <30000 then Identifier="Medium";
if Salary>30000 then Identifier="Rich";
run;
/*add 2 more variables using birth. Recorded_Area and gender. Comparison Area = 5, the rest is treatment. Sex = 2 then female*/
data Mark.BBirth;
set Mark.Birth;
length Recorded_Area $ 15 Gender $ 10;
if area=5 then Recorded_Area="Comparison Area";
if area<5 then Recorded_Area="Treatment";
if sex=2 then Gender="Female";
if sex=1 then Gender="Male";
run;
/*procing the frequency of the data*/
proc freq data = Mark.BBirth;
tables Gender Recorded_Area;
run;
proc freq data= Mark.Patientaccounts;
tables Sex Age;
run;
proc means data=Mark.PatientAccounts mean std N Sum;
var Age;
format Age 6.2;
run;
