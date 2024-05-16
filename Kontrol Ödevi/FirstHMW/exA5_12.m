num = [1 10];
den = [1 6 9 10 0];%Added 0 to end because step only has 1/s in its laplace ramp has 1/s^2 so if i add 1/s early it will be equal (1/s multiplied by 1/s = 1/s^2)
t = 0:0.1:10;
r = t;
y = step(num,den,t);
figure
plot(t,r,t,y);
grid
title('Unit-Ramp Response');
xlabel('t(seconds)');
ylabel('Y(t)');
text(3,6.5,' Unit-Ramp Input R(t) = t');
text(5.5,3.1,' Output');
num = [0 0 1 10];
den = [1 6 9 10];
t = 0:0.1:12;
input = exp(-0.5*t);%define input
y1 = lsim(num,den,input,t);%Since we have our input different than ramp or step we have to use this function
figure
plot(t,input,t,y1);
grid
title('input R(t) = exp(-0.5t))');
xlabel('t(seconds)');
ylabel('Input and Output');
text(1,0.75,'\leftarrow Input r1 = exp(-0.5t)');
text(4.5,0.34,'\leftarrow Output');