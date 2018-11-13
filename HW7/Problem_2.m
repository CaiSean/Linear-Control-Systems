%% Linear Control Systems Homework 7
% * Problem 2
% * Author: Xinyi Cai

%% Housekeeping
clear all
clc

%% Solution
syms s
Hs = tf([1 2], [1 2 5]); 
Hs_ = tf([-1 2], [1 -2 5]); 

sys = Hs*Hs_; 
rlocus(sys)