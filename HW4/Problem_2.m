%% Linear Control Systems
% * Homework 4 
% * Problem 2
% *  Arthor: Xinyi Cai
%% Housekeeping
clear all
clc

%% Soluton
tspan = [0:0.1:150]; 
x0 = [1 0]; 
%u = [0:0.1: 10]; % input
options = odeset('RelTol', 1.0E-08, 'AbsTol', 1.0E-08);
u = [0:0.1:10]; % input

for i = 1:length(u)
    [tout, yout{i}] = ode45(@inv_pend, tspan, x0, options, u(i)); 
    
end


%% Plot the graph
subplot(131)
plot(tout, yout{18}); 

subplot(132)
plot(tout, yout{19}); 

subplot(133)
plot(tout, yout{20}); 