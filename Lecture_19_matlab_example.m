%% Housekeeping
clear all; clc

%% System Matrics
A = [0 1; 0 0]; 
B = [0; 1]; 
tf = 10; 

%% Performance Index Matrices
P = [5 0; 0 0]; 
Q = [1 0; 0 0]; 
R = 1; 

%% Call ode45 to solve for Pb
T = [0:0.1:tf]'; 
XP0 = P(:); 
[T, XPb] = ode45(@ricfun, T, XP0, [], A, B, Q, R); 
XP = flipud(XPb); 

figure; 
subplot(211)
hold on; grid on
plot(T, XP(:, 1))
plot(T, XP(:, 2))
plot(T, XP(:, 3))
plot(T, XP(:, 4))
legend('P11', 'P12', 'P21', 'P22', 'Location', 'northwest')
xlabel('Time (sec)')
ylabel('Elements of P')
hold off

%% Calculate for K
for k = 1:length(T)
    Pk = reshape(XP(k, :)', 2, 2); 
    K(k, :) = inv(R)*B'*Pk; 
end

subplot(212)
hold on; grid on
plot(T, K(:, 1))
plot(T, K(:, 2))
legend('K1', 'K2', 'Location', 'northwest')
xlabel('Time (sec)')
ylabel('Elements of K')
hold off


%% Call ode45 to simulate the system response
[T, X] = ode45(@sysfun, T, [1; 0], [], A, B, K, T); 
figure
subplot(2, 1, 1)
plot(T, X(:, 1))
xlabel('Time (sec)')
ylabel('Position')

subplot(2, 1, 2)
grid on
plot(T, X(:, 2))
xlabel('Time (sec)')
ylabel('Input')


%% Supporting functions
function dx = ricfun(t, x, A, B, Q, R)
Pb = reshape(x, 2, 2); 
dPb = Pb*A+A'*Pb+Q-Pb*B*inv(R)*B'*Pb; 
dx = dPb(:); 
end

function dx = sysfun(t, x, A, B, K, T)
k = max(find(t>=T)); 
Kk = K(k, :); 
dx = (A-B*Kk)*x;
end
