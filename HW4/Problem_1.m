clear all
clc 

A = [-2 0 0; 0 1 1; 0 0 -1]; 
B = [1; 0; -1]; 
C = [1 1 0]; 
D  = 1; 

SS = ss(A, B, C, D);
% [b, a] = ss2tf(A, B, C, D)
% TF = tf(b, a); 
% pole(TF)
% pole(minreal(SS))
syms s 
TF = C*inv(s*eye(3)-A)*B+D

%% Example
clear all 
clc

A = [0 1; 2 -1]; 
B = [0; 1]; 
C = [-1 1]; 
D = 0; 

SS = ss(A, B, C, D); 
pole(SS)