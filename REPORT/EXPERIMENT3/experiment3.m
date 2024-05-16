DcData = [3.5 0.21; 4.8 0.30];
BrData = [86 2.7 274 0.68 0];
NlData = [380 1.6 243 0.23 1453];
processedDcData = [DcData calculateR1(DcData, 'Y')];
averageR1 = (processedDcData(1,3) + processedDcData(2,3)) / 2;
averageR1 = [averageR1; averageR1];
processedDcData = [processedDcData averageR1];

Names = {'Voltage(V_phase-phase)', 'Current(A_phase)', 'P(W_3phase)', 'cos(phase)', 'rpm'};

DcDataTable = table( processedDcData(:,1), processedDcData(:,2), processedDcData(:,3), processedDcData(:,4), 'VariableNames', {'Voltage(V)', 'Current(A)', 'R1(Ohm)', 'Average R1 (Ohm)'});
BrDataTable = table( BrData(:,1), BrData(:,2), BrData(:,3), BrData(:,4), BrData(:,5),'VariableNames', Names);

[Xtot, Ztot, Rtot] = processBrData(BrData);
[Xm, Rc] = processNlData(NlData);

R1 = averageR1(1,1);
R2 = Rtot - R1;
X1 = Xtot / 2;
X2 = X1;

EqCircuitData = [R1 R2 X1 X2 Xm Rc Rtot Xtot Ztot];
EqCircuitDataTable = table(R1, R2, X1, X2, Xm, Rc, Rtot, Xtot, Ztot);

RatedVolt = 220;
nsyn = 1500; %Pole number taken as 4
slip = 0.01;
wsyn = 2*pi*nsyn / 60;
Vphase = RatedVolt / sqrt(3);
Pout = (3*(Vphase*Vphase)*R2) / (slip * (wsyn * wsyn));
Zin = Ztot;
Iin = Vphase / Zin;%
pf = Rtot / Zin;%
Torkout = Pout / wsyn;%
MotorSpeed = (1 - slip) * nsyn;%

CalculateTable = table(Iin, pf, Torkout, MotorSpeed);

function [Xm, Rc] = processNlData(NlData)
    V_Nl = NlData(1,1);
    I_Nl = NlData(1,2);
    P_Nl = NlData(1,3);
    Xm = V_Nl / (sqrt(3) * I_Nl);
    Rc = (V_Nl * V_Nl) / P_Nl;
end

function [Xtot, Ztot, Rtot] = processBrData(BrData)
   P_3phase = BrData(1,3);
   I_Br = BrData(1,2);
   V_Br = BrData(1,1);
   Rtot = P_3phase / (I_Br * I_Br * 3);
   Ztot = V_Br / (sqrt(3)*I_Br);
   Xtot = sqrt((Ztot * Ztot) - (Rtot * Rtot));
end



function Resistance = calculateR1(Data, ConnectionType)
    Resistance = [0 ; 0];
    if(ConnectionType == 'Y')
        coeff = 1/2;
    else
        coeff = 3/2;
    end
    for i = 1:length(Data)
        Resistance(i,1) = coeff * (Data(i,1) / Data(i,2));
    end
end
