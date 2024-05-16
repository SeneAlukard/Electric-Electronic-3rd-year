
Rate = [100 80 60 40 20 0];
PrimeU = [220 220 220 220 220 220];
PrimeI = [1.34 1.1 0.84  0.57 0.50 0.09];
cosphi = [1 1 1 1 1 0.69];
PrimeP = PrimeU .* PrimeI;
SecondaryU = [67.2 69.7 71.1 71.9 72.5 73.1];
SecondaryI = [3.4 2.8 2.1 1.7 1.3 0];
SecondaryPhi = [1 1 1 1 1 0];
SecondaryP = SecondaryU .* SecondaryI;
Load = SecondaryU ./ SecondaryI; Load(1,length(Load)) = 0;
eff = (SecondaryP ./ PrimeP) * 100;
Loss = PrimeP - SecondaryP;


Array3 = [Rate.' PrimeU.' PrimeI.' cosphi.' PrimeP.' SecondaryU.' SecondaryI.' SecondaryPhi.' SecondaryP.' Load.' eff.'];

VariableNames = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];


T = table(Array3(:,1), Array3(:,2), Array3(:,3), Array3(:,4), Array3(:,5), Array3(:,6), Array3(:,7), Array3(:,8), Array3(:,9), Array3(:,10), Array3(:,11),'VariableNames', {'RatedPower(%5)', 'PrimaryU(V)', 'PrimaryI(A)', 'cos(phi)', 'PrimaryPower(W)', 'SecondaryU(V)', 'SecondaryI(A)', 'Secondarycos(phi)', 'SecondaryPower(W)', 'Load(Ohm)', 'Efficiency(%)'});
uitable('Data', T, 'Position', [20 20 720 200], 'ColumnName', T.Properties.VariableNames);




figure;
plot(Rate, eff);
title('Load Rate vs Efficiency Graph')
xlabel('Load Rate (%)')
ylabel('Efficiency Rate (%)')
grid on;
