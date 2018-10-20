%% Linear Control System
% 
% * Homework 4 
% * Arthur: Xinyi Cai
% 
%% Problem 3
clear all
clc

A = [-2 1; 1 -2]; 
B = [1; 0]; 
C = [1 0; 0 1]; 
D = 0; 

sys = ss(A, B, C, D); 

t = 0:0.1:5;
u = 12*exp(3*t-15)-4*exp(t-5);
figure; 
lsim(sys,u,t)
