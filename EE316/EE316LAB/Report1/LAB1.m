Amax = [3.04; 4.64; 4.8];
Amin = [2.24; 0.04; -0.560];
MessageVoltages = [1.5; 4.5; 10];
mu = zeros(length(Amax),1);
mu = calculate(Amax, Amin);

t = table(MessageVoltages, Amax, Amin, mu , 'VariableNames', {'Voltage(V)', 'A_max', 'A_min', 'Modulation Index'})

function mu = calculate(Amax, Amin)
    for i = 1:length(Amax)
        mu(i,1) = (Amax(i)-Amin(i)) / (Amax(i) + Amin(i));
    end
end