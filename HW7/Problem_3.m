%% Linear Control Systems Homework 7
% * Problem 3
% * Author: Xinyi Cai

%% Housekeeping
% clear all
% clc

%% Solution
A = [-10 0 -10 0;...
     0 -0.7 9 0;...
     0 -1 -0.7 0;...
     1 0 0 0]; 
B = [20 2.8; 0 -3.13; 0 0; 0 0]; 

Q = diag([0 0 1 1]); 
R = eye(2); 

[K, P, E] = lqr(A, B, Q, R)
