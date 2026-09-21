% Paprastai skriptas
% Oleksandr Kudlai Edlfu 25/2 14.09.2026

x = 1:32;
y = x.^2;

plot(x, y, 'o-r', x, y/3, 'xb')
title('Dvi funkcijos')
xlabel('X ašis')
ylabel('Y_2 [--]   Y_2 [--]')
%% Complementary task
N = 2; 

v = N+1:0.5:N+4;

A=[2,3,4
    4,5,6]
A = N:N+8;
A = reshape(A, 3, 3)';
a=(A)
a = A(3,2);
b = A(2:3,1:3);  %%b = [A(2,3) A(2,2)];
c = [A(1,1) A(1,3); A(3,1) A(3,3)];

v2 = v(1:3);
v3=v(2:3);

B = [A v2 v3];
