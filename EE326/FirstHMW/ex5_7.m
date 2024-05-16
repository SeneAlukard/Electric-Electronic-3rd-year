t = 0:0.1:12;
A = [-1 0.5;-1 0];
B = [0;1];
C = [1 0];
D = [0];
% For the unit-step input u = 1(t), use the command "y = step(A,B,C,D,1,t)".
[num, dem] = ss2tf(A,B,C,D);
y = step(num,dem,t);
subplot 211
plot(t,y)
grid
title('Unit-Step Response S(t)')
xlabel('t Sec')
ylabel('Output')
% "out = lsim(sys,u,t)". 
u = exp(-t);
sys = ss(A,B,C,D);%using ss function to create space state system of our values
subplot 212
out = lsim(sys,u,t);
hold on;
plot(t,u,'-',t,out,'-')
grid
title('Exponential Input u = exp(-t)')
xlabel('t Sec')
ylabel('Exponential Input and System Output')
text(1.2,0.5,'\leftarrow Exponential Input')
text(4,0.25,'\leftarrow Output')