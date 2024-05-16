syms n
X = ((1/2)^(n-1)) * heaviside(n-1);
Y = ztrans(X);
fplot(Y)