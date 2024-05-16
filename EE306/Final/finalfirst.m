%question 1
x = [1 -2 4 -2 0 1 8 0 0];
h = [2 0 1 2 -3 3 -2 0 1];
subplot 311
stem(x)
subplot 312
stem(h)
subplot 313
stem(conv(h,x))