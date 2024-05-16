%1
p1 = figure;
t = -10:0.1:10;
x = sinc(t);
plot(x)

%2
p2 = figure;
N = 2^10+1;
x = zeros(N);
x((N-1)/2) = 1;
plot(abs(fft(x)))

%3
p3= figure;
x = cos(t);
plot(x)

%4
p4 = figure;
N = 2^10+1;
x = zeros(N);
x((N-1)/2) = 3;
plot(abs(fft(x)));