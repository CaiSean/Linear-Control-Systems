%% Linear Control Systems Homework 7
% * Problem 3
% * Author: Xinyi Cai

%% Housekeeping
clear all
clc

%% Solution
A = [-10 0 -10 0;...
     0 -0.7 9 0;...
     0 -1 -0.7 0;...
     1 0 0 0]; 
B = [20 2.8; 0 -3.13; 0 0; 0 0]; 
C = eye(4); 
D = zeros(4, 2); 

Q = diag([0 0 1 1]); 
R = eye(2); 

sys = ss(A, B, C, D); 

[K, S, e] = lqr(sys, Q, R)
