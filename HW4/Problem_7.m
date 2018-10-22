%% Linear Control Systems
% * Homework 4 
% * Problem 7
% *  Arthor: Xinyi Cai
%% Housekeeping
clear all
clc

%% Given
A = [-5 -3 -1 4;...
     1 -5 1 -1;...
     1 -4 -3 2;...
     1 -7 1 1]; 
B = [1 0; 0 1; 1 1; 2 1]; 
C = [0 -1 0 1; 1 0 1 -1]; 

%% Controlability
P = ctrb(A, B); 
rank_P = rank(P); 
disp(['The rank of P matrix = ', num2str(rank_P)])
[V_c, R_c] = qr(P); 
Ah_c = V_c'*A*V_c; 
Bh_c = V_c'*B; 
[Ah_c Bh_c]

%% Observability
Q = obsv(A, C); 
rank_Q = rank(Q); 
disp(['The rank of Q matrix = ', num2str(rank_Q)])
[V_o, R_o] = qr(Q'); 
Ah_o = V_o'*A*V_o; 
Ch_o = C*V_o; 
[Ah_o; Ch_o]