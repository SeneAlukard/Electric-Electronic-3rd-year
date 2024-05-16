f = 1e1;
fc = 1e2;

t = 0:1/(4*fc):20;

y2 = cos(2*pi*f*t);

Ac = 1;
ka = 0.8;
x = Ac*(1+ka*y2).*cos(2*pi*fc*t);

figure;
plot(t,x);
xlim([0 1])