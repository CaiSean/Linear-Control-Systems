%% Linear Control Systems
% * Homework 4 
% * Problem 2
% *  Arthor: Xinyi Cai

%% Solution
function xdot = inv_pend(t, x, u)
w = u;

xdot_1 = x(2); 
xdot_2 = -(1+0.5*sin(u*t))*x(1)-0.2*x(2); 
xdot_3 = x(4); 
xdot_4 = -(1+0.5*sin(u*t))*x(3)-0.2*x(4); 

xdot = [xdot_1; xdot_2; xdot_3; xdot_4];