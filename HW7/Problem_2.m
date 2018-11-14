%% Linear Control Systems Homework 7
% * Problem 2
% * Author: Xinyi Cai

%% Housekeeping
clear all
clc

%% Solution (The easy way)
syms s
Hs = tf([1 2], [1 2 5]); 
Hs_ = tf([-1 2], [1 -2 5]); 

sys = Hs*Hs_; 
rlocus(sys)

%% Solution (The hard way)

[A, B, C, D] = tf2ss([1 2], [1 2 5]); 
Q = [1 0; 0 0]; 
R = 0.0001:0.0001:1; 

for i = 1:length(R)
    [K, P, E] = lqr(A, B, Q, R(i)); 
    roots(i, :) = (eig(A-B*K))'; 
end

real_num = real(roots(:, 1));
img_num_1 = imag(roots(:, 1)); 
img_num_2 = -img_num_1; 


figure; hold on
plot(real_num, img_num_1)
plot(real_num, img_num_2)
plot(-real_num, img_num_1)
plot(-real_num, img_num_2)
xlim([-8 8])
ylim([-2.5 2.5])
grid on
