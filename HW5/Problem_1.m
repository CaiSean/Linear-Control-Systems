%% Linear Control Systems Homework 5
% Problem 1
% Arthor: Xinyi Cai

%% Housekeeping
clc; 
clear all; 

%% Given Values
A = [0 1 0; 1 0 0; 0 0 0]; 
B = [0; 1; 1]; 
C = eye(3)
D = zeros(3, 1); 

%% Part a
[V_mtx, D_mtx] = eig(A); 

%% Part b
P = [B A*B A^2*B]; 
[b, a] = ss2tf(A, B, C, D); 
d = [1 3 4 2]; 
trans_mtx = [1 a(2) a(3);...
             0 1 a(2);...
             0 0 1]; 

K = (d(2:4)-a(2:4))*inv(P*trans_mtx)

%% Part c
A_bar = A-B*K; 
B_bar = B*K(3); 

sys = ss(A_bar, B_bar, C, D); 
step(sys)
grid on