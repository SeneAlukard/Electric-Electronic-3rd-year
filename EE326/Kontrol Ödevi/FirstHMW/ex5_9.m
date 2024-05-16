t = 0:0.05:3;
A = [0 1;-10 -5];
B = [0;0];
C = [0 0];
D = [0];
x0 = [2;1];
[y,x] = initial(A,B,C,D,x0,t);
x1 = [1 0]*x';
x2 = [0 1]*x';
plot(t,x1,'-',t,x1,t,x2,'-',t,x2)
grid
title('Response to Initial Condition')
xlabel('t Sec')
ylabel('State Variables x1 and x2')
text(0.6,1.1,'x1');
text(0.9,-1.4,'x2')