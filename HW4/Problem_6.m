A = [-3 1 0; 1 -3 1; 0 1 -3]; 
syms b1 b3
% B = [b1; 0; b3]; 
B = [1; 0; 1];

P = [B A*B A^2*B]; 
det_P = det(P); 

orth(P);

syms c1 c2
% C = [c1 0 c2]; 
C = [1 0 -1];

Q = [C; C*A; C*A^2]
orth(Q)