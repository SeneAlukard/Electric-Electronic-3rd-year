A = [0 1 0;
     0 0 1;
    -10 -17 -8];

B = [2;
     1;
     0.5];

C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);%create the fn using ss

x0 = [2; 1; 0.5]; %initial conditions

t = 0:0.01:10;

u = zeros(length(t), size(B, 2));

[y, t_out] = lsim(sys, u, t, x0);

figure;
plot(t_out, y);
title('Response to Initial Conditions (No Input)');
xlabel('Time (seconds)');
ylabel('Output (y)');
grid on;
