% Your provided data arrays
Rate = [100 80 60 40 0];
PrimeU = [220 220 220 220 228];
PrimeI = [1.34 1.1 0.84 0.70 0.09];
cosphi = [1 1 1 1 0.69];
PrimeP = PrimeU .* PrimeI;
SecondaryU = [67.2 69.7 71.1 71.9 73.1];
SecondaryI = [3.4 2.8 2.1 1.7 0];
SecondaryPhi = [1 1 1 1 0];
SecondaryP = SecondaryU .* SecondaryI;
Load = SecondaryU ./ SecondaryI; Load(1,length(Load)) = 0;
eff = (SecondaryP ./ PrimeP) * 100;
Loss = PrimeP - SecondaryP;
VoltageRegulation = (PrimeU(1, length(PrimeU)) - PrimeU(1,1)) / PrimeU(1,1) * 100;

TotalLoss = 0
for i = 1:length(Loss)
    TotalLoss = TotalLoss + Loss(i);
end


% Creating the table T
T = table(Rate', PrimeU', PrimeI', cosphi', PrimeP', SecondaryU', SecondaryI', SecondaryPhi', SecondaryP', Load', eff', Loss', 'VariableNames', {'RatedPower(%)', 'PrimaryU(V)', 'PrimaryI(A)', 'cos(phi)', 'PrimaryPower(W)', 'SecondaryU(V)', 'SecondaryI(A)', 'Secondarycos(phi)', 'SecondaryPower(W)', 'Load(Ohm)', 'Efficiency(%)', 'Loss(W)'});
T1 = table(Rate', PrimeU', PrimeI', cosphi', PrimeP', 'VariableNames', {'RatedPower(%)', 'PrimaryU(V)', 'PrimaryI(A)', 'cos(phi)', 'PrimaryPower(W)'});
T2 = table(Rate',SecondaryU', SecondaryI', SecondaryPhi', SecondaryP', 'VariableNames', {'RatedPower(%)','SecondaryU(V)', 'SecondaryI(A)', 'Secondarycos(phi)', 'SecondaryPower(W)'});
T3 = table(Rate', Load', eff', Loss','VariableNames', {'RatedPower(%)','Load(Ohm)', 'Efficiency(%)', 'Loss',});

disp(T1);
disp(T2);
disp(T3);

plot(Rate,eff)
title('Rated Power(%) - Efficiency(%)')
xlabel('Rated Power(%)');
ylabel("Efficiency(%)")
grid on


% Since uitable isn't an option, consider alternatives like writing to Excel
 %filename = 'data.xlsx';
 %writetable(T, filename, 'Sheet', 1);

% Assuming T is already created and properly populated as per your previous message

% Create a figure for displaying the table
f = figure('Name', 'Data Display', 'Position', [100 100 720 520]);

% Create a uitable from table T in the figure window
uitable(f, 'Data', T{:,:}, 'ColumnName', T.Properties.VariableNames, 'Units', 'Normalized', 'Position', [0 0 1 1]);


% Display the table in command window
disp(T);
