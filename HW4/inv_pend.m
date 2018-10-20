function xdot = inv_pend(t, x, w)

w_n = 1; 
zeta = 0.1; 

A = [0 1;...
    -w_n.^2*(1+0.5*sin(w*t)) -2*zeta*w_n]; 
x = [x(1); x(2)];

xdot = A*x;