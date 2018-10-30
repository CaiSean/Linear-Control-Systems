%% Linear Control Systems Homework 5
% Problem 3
% Arthor: Xinyi Cai

%% Housekeeping
clc; 
clear all; 

%% Given Values
A = [-10 0 -10 0; 
     0 -1 10 0; 
     0 -1 -1 0; 
     1 0 0 0]; 
B = [20 3; 0 -3; 0 0; 0 0]; 
C = [0 0 1 0; 0 0 0 1]; 
D = zeros(2, 1); 
poles = [-10; -20; 10*(-1+1j); 10*(-1-1j)]; 
yd = [0.1; 0.2]; 

%% State Feedback Controller
K = place(A, B, poles); 
r = -inv(C*inv(A-B*K)*B)*yd; 
sys = ss(A-B*K, B*r, C, D); 

step(sys)