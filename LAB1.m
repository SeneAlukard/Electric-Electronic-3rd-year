A = [2 3 0 0; 3 4 0 0;0 0 7 8; 0 0 8 9];
Ainv = inv(A);
%%
x = 1:0.001:pi;
%hold on
% plot(x,sin(x));
% plot(x,3*sin(2*x));
% plot(x,cos(x));

%%
yc = [1 -2 5 -11 7 -13];
r = roots(yc);

%%
rng shuffle
A = rand(3,8);
B = rand(8,5);
C = rand(5,3);
P = A*B*C;
Pinv = inv(P);
%%
% hold on
% ome = [1 5 10];
% phi = [0 pi/3 pi]
% t = 1:0.0001:pi
% for i = 1:length(ome)
%     for j = 1:length(phi)
%         m = sin(ome(i)*t+phi(i));
%         plot(t,m)
%     end
% end
%%
Cube = [10 20 12];
SurfaceCube = 2*(Cube(1)*Cube(2)+Cube(1)*Cube(3)+Cube(2)*Cube(3));

%%
fx = [5 4 3 2 1; 4 -2 0 0 -7.6;0 1 -1 +7 0; -1 3 7 0 -9; 100 -90 -60 12 7];
fy = [6; 4.2; 1; 9.42; 21];
sln = rref([fx,fy]);

%%
syms l(x)

l(x) = exp(x^2)*cos(2*x)*sin(x/2)
k = inv(l(x));
