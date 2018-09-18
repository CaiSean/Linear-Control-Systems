%% Linear Control Systems
% * Homework 2 Problem 6
% * Arthor: Sean Cai

%% Part b 
% Housekeeping
clc
clear all

%% Computed by hand
t_1 = [0:999]'*pi/1000; 

for i = 1:1:1000    
    X1_1(i) = (sin(t_1(i))-t_1(i)*cos(t_1(i)))/2; 
    X2_1(i) = (t_1(i)*sin(t_1(i)))/2; 
end

t_2 = t_1 + pi; 
X1_2 = 0.5*pi*cos(t_2-pi); 
X2_2 = -0.5*pi*sin(t_2-pi); 

figure; 
subplot(211)
hold on
plot(t_1, X1_1)
plot(t_2, X1_2)
title('t vs X1')
xlabel('Time (seconds)')
ylabel('Outpout X1')
hold off

subplot(212)
hold on
plot(t_1, X2_1)
plot(t_2, X2_2)
title('t vs X2')
xlabel('Time (seconds)')
ylabel('Outpout X2')
hold off

%% Computed with lsim
A = [0, 1; -1, 0]; 
B = [0; 1]; 
C = eye(2); 
D = zeros(2,1);
sys = ss(A,B,C,D);

% Define Time and Input Vectors
T1=[0:999]'*pi/1000; 
T=[T1;pi+T1];
U=[sin(T1);zeros(1000,1)];
figure; 
lsim(sys, U, T, [0; 0]);


