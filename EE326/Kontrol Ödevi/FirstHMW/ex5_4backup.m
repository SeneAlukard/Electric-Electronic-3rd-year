% ------- Two-dimensional plot and three-dimensional plot of unit-step
% and zeta = 0, 0.2, 0.4, 0.6, 0.8, and 1. -------
t = 0:0.2:10;
kise = 0:0.2:1;
wn = 1; %second-order system with wn = 1
for n = 1:6;
num = [1];
den = [(wn*wn) (wn*2*kise(n)) 1];
[y(1:51,n),x,t] = step(num,den,t);
end
% To plot a two-dimensional diagram, enter the command plot(t,y).
figure
plot(t,y);
grid
title('Plot of Unit-Step Response Curves with \omega_n = 1 and \zeta = 0, 0.2, 0.4, 0.6, 0.8, 1')
xlabel('t (sec)');
ylabel('Response');
stringvalue = {'\zeta = 0', '0.2', '0.4', '0.6', '0.8', '1.0'};
yvalues = [1.86, 1.5, 1.24, 1.08, 0.95, 0.86];
xvalue = [4.1 3.5 3.5 3.5 3.5 3.5];
for i = 1:6
    text(xvalue(i), yvalues(i), stringvalue(i));
end
figure
% To plot a three-dimensional diagram, enter the command mesh(t,zeta,y').
subplot 211
mesh(t,kise,y')
title('Three-Dimensional Plot of Unit-Step Response Curves Using mesh()');
xlabel('t Sec');
ylabel('\zeta');
zlabel('Response');
subplot 212
surf(t,kise,y')
title('Three-Dimensional Plot of Unit-Step Response Curves Using surf()');
xlabel('t Sec');
ylabel('\zeta');
zlabel('Response');
