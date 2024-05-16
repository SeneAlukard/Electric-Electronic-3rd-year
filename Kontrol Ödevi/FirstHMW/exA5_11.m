ksi = [0.3 0.5 0.7 0.8];
wn = [1 2 4 6];
maxValue = zeros(1,4);
maxTime = maxValue;
a = zeros(1,length(wn));
b = a;
for i = 1:length(b)
    a(i) = (wn(i) * wn(i));
    b(i) = (2 * ksi(i) * wn(i));
end
t = 0:0.1:8;
y = zeros(length(t),length(a));
for i = 1:length(a)
num = [a(i)];
den = [1 b(i) a(i)];
u = ones(1,length(t));
y(:,i) = lsim(num,den,u,t);
siginfo = lsiminfo(y(:,i),t);
maxValue(i) = siginfo.Max;
maxTime(i) = siginfo.MaxTime;
end
plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4));
grid
title('Unit-Step Response Curves for Four Cases');
xlabel('t Sec');
ylabel('Outputs');
for i = 1 : length(maxValue)
    text(maxTime(i)-0.3,maxValue(i),['\zeta = ', num2str(ksi(i))]);
end

