%% Linear Control Systems Homework 5
% Problem 2
% Arthor: Xinyi Cai

%% Housekeeping
clc; 
clear all; 

%% Given Values
A = [-0.2 -5 10; -0.1 -1 0; 0 1 0]; 
B = [10 8 0]'; Bw = [-0.2 -0.1 0]';
C = [1 0 0]; 
D = 0; 
w = [0 10]; 

%% Part a
[V_mtx, D_mtx] = eig(A);

%% state feedback controller
poles = [-2; sqrt(2)*(-1+j); sqrt(2)*(-1-j)];
K = acker(A, B, poles);
r = -inv(C*inv(A-B*K)*B); 
sys1 = ss(A-B*K, B*r+Bw*w(1), C, D); 
sys2 = ss(A-B*K, B*r+Bw*w(2), C, D); 
figure; 
step(sys1, sys2)
legend('w = 0', 'w = 10')

%% intergral feedback controller
poles = [-2; -2; sqrt(2)*(-1+j); sqrt(2)*(-1-j)];
Abar = [A zeros(3, 1); C 0]; 
Bbar = [B; 0]; 
Bwbar_1 = [Bw*w(1); -1];
Bwbar_2 = [Bw*w(2); -1]; 
Cbar = [C 0]; 
K = acker(Abar, Bbar, poles); 
sys1 = ss(Abar-Bbar*K, Bwbar_1, Cbar, D); 
sys2 = ss(Abar-Bbar*K, Bwbar_2, Cbar, D); 
figure;
step(sys1, sys2)
legend('w = 0', 'w = 10')