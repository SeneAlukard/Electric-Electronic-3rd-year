format long g
%Open Circuit Data
V_oc120 = 240;
P_oc120 = 12;
I_oc120 = 0.09;
cosphi_oc120 = 0.57;

V_oc100 = 220;
P_oc100 = 9.6;
I_oc100 = 0.08;
cosphi_oc100 = 0.68;

V_open = [V_oc100 V_oc120]';
P_open = [P_oc100 P_oc120]';
I_open = [I_oc100 I_oc120]';
cosphi_open = [cosphi_oc100 cosphi_oc120]';

Data_open = [V_open P_open I_open cosphi_open];
%T = table(V_open, P_open, I_open, cosphi_open, 'VariableNames', {'Voltage(V)','Power(W)','Current(A)','Cos(Phi)'});
%disp('Open Circuit Data:')
%disp(T);


%Short Circuit Data
%original data V_sc120 = 34.2;
V_sc120 = 36.6;
P_sc120 = 52;
I_sc120 = 1.52;
cosphi_sc120 = 1;


%original data V_sc100 = 30;
V_sc100 = 31.2;
P_sc100 = 40;
I_sc100 = 1.33;
cosphi_sc100 = 1;

V_sc = [V_sc100 V_sc120]';
P_sc = [P_sc100 P_sc120]';
I_sc = [I_sc100 I_sc120]';
cosphi_sc = [cosphi_sc100 cosphi_sc120]';

Data_sc = [V_sc P_sc I_sc cosphi_sc];
%M = table(V_sc, P_sc, I_sc, cosphi_sc, 'VariableNames', {'Voltage(V)','Power(W)','Current(A)','Cos(Phi)'});
%disp('Short Circuit Data:')
%disp(M);

[Xm Rc] = ProcessOpenCircuitData(Data_open);
ProcessedData_open = [Data_open Rc Xm];
Z = table( ProcessedData_open(:,1), ProcessedData_open(:,2), ProcessedData_open(:,3), ProcessedData_open(:,4), ProcessedData_open(:,5), ProcessedData_open(:,6), 'VariableNames', {'Voltage(V)','Power(W)','Current(A)','Cos(Phi)', 'Rc(ohm)', 'Xm(johm)'});
disp('Open Circuit Prosessed Data:')
disp(Z);

[Xeq Req] = ProcessShortCircuitData(Data_sc);
ProcessedData_sc = [Data_sc Req Xeq];
X = table( ProcessedData_sc(:,1), ProcessedData_sc(:,2), ProcessedData_sc(:,3), ProcessedData_sc(:,4), ProcessedData_sc(:,5), ProcessedData_sc(:,6), 'VariableNames', {'Voltage(V)','Power(W)','Current(A)','Cos(Phi)', 'Req(ohm)', 'Xeq(johm)'});
disp('Short Circuit Prosessed Data:')
disp(X);
%Primary Side Equiavelent
function [Xm, Rc] = ProcessOpenCircuitData(Data)
    for i = 1:2
          Vopen = Data(i,1);
          Iopen = Data(i,3);
          Popen = Data(i,2);
          Sopen = Vopen * Iopen;
          Qopen = sqrt((Sopen^2) - (Popen^2));
          Xm(i,1) = (Vopen^2) / Qopen;
          Rc(i,1) = (Vopen^2) / Popen;
    end
end

%Primary Side equivalent resistances
function [Xeq, Req] = ProcessShortCircuitData(Data)
    Xeq (2, 1) = 0;
    Req (2, 1) = 0;
    for i = 1:2
        Vsc = Data(i,1);
        Psc = Data(i,2);
        Isc = Data(i,3);
        Ssc = Vsc * Isc;
        Qsc = sqrt((Ssc^2) - (Psc^2));
        Req(i, 1) = Psc / (Isc ^ 2);;
        Xeq(i,1) = Qsc / (Isc ^ 2);
        %Xeq(i, 1) = sqrt((Zsc ^ 2) - (Req(i,1) ^ 2));
    end
end