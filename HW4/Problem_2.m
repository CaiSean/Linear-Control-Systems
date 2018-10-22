%% Linear Control Systems
% * Homework 4 
% * Problem 2
% *  Arthor: Xinyi Cai
%% Housekeeping
clear all
clc

%% Soluton
tspan = [0:0.1:150]; 
x0 = eye(2); 
u = [0:0.1:10]; % input
options = odeset('RelTol', 1.0E-08, 'AbsTol', 1.0E-08);

for i = 1:length(u)
    [tout, yout{i}] = ode45(@inv_pend, tspan, x0(:), options, u(i)); 
end

%% Plot the graph

omega_1 = [19 21 23];
figure
for i = 1:3
    subplot(3, 1, i)
    plot(tout, yout{omega_1(i)});
    ylabel('Amplitude')
    xlabel('Time (sec)')
    title(['X(t) vs t when \omega = ', num2str(omega_1(i)/10-0.1)])
end