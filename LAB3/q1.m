figure
f = 20;
x = -2*pi:1/f:2*pi;
y = sinc(x);
stem(x,y);
%ztrans
figure
syms t
f = sinc(t);
ztrans(f);
subplot 121
fplot(f)
subplot 122
plot(x,y)