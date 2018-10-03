clear all
clc

A = [0 0 1 0;...
     0 0 0 1;...
     -100 100 -10 0;...
     100 -100 0 0]; 
 
[V D] = eig(A); 

eig_val1 = D(1, 1); 
eig_val2 = D(2, 2); 
eig_val3 = D(3, 3); 
eig_val4 = D(4, 4); 

mtx1 = rref(A-diag([eig_val1 eig_val1 eig_val1 eig_val1]));
mtx2 = rref(A-diag([eig_val2 eig_val2 eig_val2 eig_val2]));
mtx3 = rref(A-diag([eig_val3 eig_val3 eig_val3 eig_val3]));
mtx4 = rref(A-diag([eig_val4 eig_val4 eig_val4 eig_val4]));

% REAL MODAL MATRIX
M = [-0.0338 0.0562 0.7071 -0.2325;...
     -0.0123 -0.0745 0.7071 -0.1755;...
     -0.6624 -0.5623 0 1.3247;...
     1 1 0 1];
J = inv(M)*A*M