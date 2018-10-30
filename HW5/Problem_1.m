%% Linear Control Systems Homework 5
% Problem 1
% Arthor: Xinyi Cai

%% Housekeeping
clc; 
clear all; 

%% Given Values
A = [0 1 0; 1 0 0; 0 0 0]; 
B = [0; 1; 1]; 
C = eye(3);
D = zeros(3, 1); 

%% Part a
[V_mtx, D_mtx] = eig(A); 

%% Part b
poles = [-1; -1+1j; -1-1j]; 
K = acker(A, B, poles);

%% Part c
A_bar = A-B*K; 
B_bar = B*K(3); 

sys = ss(A_bar, B_bar, C, D); 
step(sys)
grid on