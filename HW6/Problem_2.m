%% Linear Control Systems Homework 6
% * Problem 2
% * Author: Xinyi Cai

%% Housekeeping
clear all
clc

%% Given parameters
syms w
K = 0.5*w^2;
A = [0 0 -K; 0 0 K; 1 -1 0]; 
B = [0; 1; 0]; 
C = [1 0 0]; 
D = 0; 

%% Part a
K = [3*w 3*w^2 2*w^3]*inv([B, A*B, A^2*B]*[1 0 w^2; 0 1 0; 0 0 1]); 

syms s
CLTF = C*inv(s*eye(3)-(A-B*K))*B

%% Part b
syms t
yd = 1-cos(w*t); 
Yd = laplace(yd);

R = 2*(s^3+3*w*s^2+4*w^2*s+2*w^3)/(s^3+w^2*s);

r = ilaplace(R, s)

%% Part c
Q = [C; C*A; C*A^2]; 
L = inv([1 0 0; 0 1 0; w^2 0 1]*Q)*[30*w; 399*w^2; 2000*w^3]

%% Part e
syms w
Ar = [0 200*w^2; -1 -20*w]; 
Bu = [1; 0]; 
By = [-8000*w; 402]; 
Lr = [399; -40/w]; 
K1 = w; 
K2 = [3*w -3*w^2]; 

syms s
F1 = inv(1+K2*inv(s*eye(2)-Ar)*Bu);
F1 = simplify(F1)

F2 = K2*inv(s*eye(2)-Ar)*By+K1+K2*Lr;
F2 = simplify(F2)