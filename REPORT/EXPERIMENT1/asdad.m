PrimeVoltages = [20.6; 60.7; 100; 140; 180; 220];
SecondaryVoltages = [0 3.1 4.9 6.8 8.6 10.6; 2.4 6.7 17 19.4 19.9 24.3; 3.5 10.1 16.6 23.3 29.8 36.3].';
A1B1 = SecondaryVoltages(:,1);
A2B2 = SecondaryVoltages(:,2);
A3B3 = SecondaryVoltages(:,3);

m = length(PrimeVoltages);

a1 = TurnRatioCalc(PrimeVoltages, A1B1);
a2 = TurnRatioCalc(PrimeVoltages, A2B2);
a3 = TurnRatioCalc(PrimeVoltages, A3B3);


Array = [PrimeVoltages SecondaryVoltages];
Array2 = [Array(:,1) Array(:,2) a1.' Array(:,3) a2.' Array(:,4) a3.' ];
Array3 = [Array2; AverageCalc(Array2)];

disp(['  PrimeVolt |  A1-B1 |    a1   |   A2-B2  |    a2   | A3-B3   |   a3  |'])
disp(Array3)

figure;
hold on;
plot(PrimeVoltages, A1B1);
plot(PrimeVoltages, A2B2);
plot(PrimeVoltages, A3B3);
legend('A1-B1', 'A2-B2', 'A3-B3')
title('Secondary to Primary Voltages')
xlabel('Primary Voltages -V-')
ylabel('Secondary Voltages -V-')

figure;
hold on;
plot(PrimeVoltages, a1);
plot(PrimeVoltages, a2);
plot(PrimeVoltages, a3);
legend('a1', 'a2', 'a3');
title('Variation of Secondary to Primary Voltages');
xlabel('Primary Voltages -V-');
ylabel('Variation -Ratio-');

VariableNames = ['x'; 'y'; 'z'; 'd'; 'e'; 'f'];


% Assuming Array3 is a 5x7 matrix
numRows = size(Array3, 1);
numCols = size(Array3, 2);
modifiedColumns = cell(1, numCols);

% Convert each column to strings with 'V' and store in cell array
for col = 1:numCols
    if(col ~= 1 && rem(col,2) == 1)
        modifiedColumns{col} = cellstr(num2str(Array3(:,col)));
    else
    modifiedColumns{col} = cellstr(num2str(Array3(:,col))) + "V";
    end
end

% Create the table from the modified columns
T = table(modifiedColumns{1}, modifiedColumns{2}, modifiedColumns{3}, modifiedColumns{4}, modifiedColumns{5}, modifiedColumns{6}, modifiedColumns{7}, ...
    'VariableNames', {'PrimeVolt', 'A1-B1', 'a1', 'A2-B2', 'a2', 'A3-B3', 'a3'});

disp(T);

function y = AverageCalc(Array)
    n = size(Array, 1);
    m = length(Array);
    y(1,m) = 0;
    for j = 1:3
        for i = 1:n
            y(1+2*j) = y(1+2*j) + Array(i,1+2*j) 
        end
        y(1+2*j) = y(1+2*j) / n;
    end
    
    y(1) = 0;
    y(2) = 0;
    y(4) = 0;
    y(6) = 0;
end


function y = TurnRatioCalc(Parray, Sarray)
    m = length(Parray);
    for i = 1:m
        if(Sarray(i) == 0)
            y(i) = 0;
        else
            y(i) = Parray(i)/Sarray(i);
        end
    end
end
