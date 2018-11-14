%% Housekeeping
clear all; clc

%% System Matrics
A = [0 1; 0 0]; 
B = [0; 1]; 
Q = [1 0; 0 0]; 
R = 1; 

H = [A -B*inv(R)*B'; -Q -A'];
[M D] = eig(H);

V = M(1:2, 1:2); 
W = M(3:4, 1:2); 

P = W*inv(V)

P_alt = care(A, B, Q, R) % Continuous Algebraic Ricatti Equation

[K, P_alt_2, E] = lqr(A, B, Q, R)