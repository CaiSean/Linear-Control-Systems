%% Linear Control Systems
% * Homework 4 
% * Problem 2
% *  Arthor: Xinyi Cai
%% Housekeeping
clear all
clc

%% Soluton
tspan = [0:0.1:150]; 
x0 = [pi/2; 0]; 
u = [0:0.1: 10]; % input
options = odeset('RelTol', 1.0E-08, 'AbsTol', 1.0E-08);

for i = 1:length(u)
    [tout, yout{i}] = ode45(@inv_pend, tspan, x0, options, u(i)); 
    RMS(i)=sqrt(sum(yout{i}(:, 1).^2)/length(u));
end

%% Plot the graph
subplot(311)
plot(u, RMS); 
xlabel('\omega')
ylabel('RMS')
title('RMS vs \omega')

subplot(312)
plot(tout, yout{19}); 
ylabel('Amplitude')
xlabel('Time (sec)')
title('X(t) vs t when \omega = 1.9')
legend('$ \theta $', '$\dot{ \theta }$', 'interpreter','latex')

subplot(313)
plot(tout, yout{20}); 
ylabel('Amplitude')
xlabel('Time (sec)')
title('X(t) vs t when \omega = 2.0')
legend('$ \theta $', '$\dot{ \theta }$', 'interpreter','latex')