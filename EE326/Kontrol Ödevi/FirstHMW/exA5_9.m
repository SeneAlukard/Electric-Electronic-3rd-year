numerator = [10 4];
den = [1 4 4];
t = 0:0.02:10;
u0 = ones(1,length(t));
y = lsim(numerator,den,u0,t);
figure;
plot(t,y);
grid
title('Unit-Step Response');
xlabel('t (sec)');
ylabel('Output');
num1 = [10 4];
den1 = [1 4 4];
sys = tf(num1,den1);
%den1 = [1 4 4 0]; % taking the step of step like we already multiplied with 1/s and step will be multiply again
%y1 = step(sys,t)%step(tf,timearray) calculates the tf in timearray
u = t;
y1 = lsim(sys,u,t);
figure;
plot(t,t,'--',t,y1);
xlim([0 10]);
ylim([0 10]);
grid
title('Unit Ramp Response');
xlabel('t (sec)');
ylabel('Unit-Ramp Input and Output');
text(6.1,5.0,'\leftarrow Unit-Ramp Input');
text(3.5,7.1,'Output \rightarrow ');