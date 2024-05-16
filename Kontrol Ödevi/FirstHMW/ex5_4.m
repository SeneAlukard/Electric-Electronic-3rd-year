% Range of time and damping ratio
t = 0:0.2:10;
ksi = 0:0.2:1;
wn = 1:2; % Modify wn here to see different responses
figure;
for j = 1:length(wn)
% Pre-allocate for efficiency
y = zeros(length(t), length(ksi));

% Calculate step responses for varying damping ratios
for n = 1:length(ksi)
    num = [1];
    den = [(wn(j)*wn(j)) (wn(j)*2*ksi(n)) 1];
    [y(:,n), ~, ~] = step(num, den, t);
    if j == 1
        y1 = y;
    else 
        if j == 2
            y2 = y;
        end
    end

end

% To plot a two-dimensional diagram
subplot (2,1,j)
plot(t, y);
grid on;
title(['Plot of Unit-Step Response Curves with \omega_n = ' num2str(wn(j)) ' and \zeta = 0, 0.2,..,0.8,1']);
xlabel('t (sec)');
ylabel('Response');
% calculating Yvalues dynamically for xvalues we choose
xvalue = [4.1, 3.5, 3.5, 3.5, 3.5, 3.5];  % Corresponding x values for each zeta
stringvalue = {'\zeta = 0', '0.2', '0.4', '0.6', '0.8', '1.0'};
yvalues = zeros(1, length(ksi));  % Initialize yvalues array


for i = 1:length(ksi)
    yvalues(i) = interp1(t, y(:, i), xvalue(i), 'linear', 'extrap');  % Interpolate y value at specific x value for each zeta
    text(xvalue(i), yvalues(i), stringvalue(i));  % Place the annotation on the plot
end
end
figure
% To plot a three-dimensional diagram, enter the command mesh(t,zeta,y').
subplot 211
mesh(t,kise,y1')
title('Three-Dimensional Plot of Unit-Step Response(\omega_n = 1) Curves Using mesh()');
xlabel('t Sec');
ylabel('\zeta');
zlabel('Response');
subplot 212
surf(t,kise,y2')
title('Three-Dimensional Plot of Unit-Step Response(\omega_n = 2) Curves Using surf()');
xlabel('t Sec');
ylabel('\zeta');
zlabel('Response');
