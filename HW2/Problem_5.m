                    clc; 
clear all

syms t tau

phi_12 = ((2*t-1)*exp(2*(t-tau))-2*tau+1)/4; 
phi_22 = exp(2*(t-tau)); 

phi = [1, phi_12; 
       0, phi_22]; 

B = [0; tau]; 

mtx = phi*B; 

fun = @(tau)mtx(1);

ans1 = integral(fun,0,t) 