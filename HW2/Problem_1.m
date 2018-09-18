%% Linear Control Systems
% Homework 2 Problem 1
% Arthor: Sean Cai

%% Part a

% Housekeeping
clc; 
clear all; 

% Solution
A = [-3, 2, 1; 
     1, -4, -1; 
     -1, -2, -5]; 
B = [1, 0; 
     0, 2; 
     1, 1]; 

T = [1, 1, 0; 
     1, 0, 1; 
     0, 1, 1]; 

A_hat = T*A*inv(T)
B_hat = T*B