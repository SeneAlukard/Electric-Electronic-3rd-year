num = [3 25 72 80];
den = [1 8 40 96 80];

% Plot the step response
step(num, den);
v = [0 3 0 1.2]; % Set axis limits
axis(v);
%xlim[0 3]
%ylim[0 1.2]
grid on;

% Obtain the partial fraction expansion
num1 = [3 25 72 80];%numerator
den1 = [1 8 40 96 80 0];%denomarator
[r, p, k] = residue(num1, den1)%getting the Partial Expansion Coefficient and poles etc.

partial = cell(length(r), 1); 
symTF = sym(zeros(1, length(r)));
repeated = false; 

syms s

for i = 1:length(r)
    if repeated
        % Handle repeated pole case
        partial{i} = tf(r(i), [1, -2*p(i), p(i)^2]);
        repeated = false; % Reset flag
    else
        % Normal case
        partial{i} = tf(r(i), [1, -p(i)]);
        if i < length(r) && p(i) == p(i+1)
            repeated = true; % if pole is the same change way
        end
    end
    
    [symNum, symDen] = tfdata(partial{i}, 'v');
    symTF(i) = poly2sym(symNum, s) / poly2sym(symDen, s);
end


combinedExpression = sum(symTF);

% Use pretty to display the combined expression
pretty(combinedExpression)
