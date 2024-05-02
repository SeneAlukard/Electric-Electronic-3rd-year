syms a b x t y z

x(t) = sin(2*pi*5*t);

a = 5*z;
b = 3*z;

y = diff_eqn(b,a, x);




function y = diff_eqn(b, a, x)
    y = filter(b, a, x);
end
