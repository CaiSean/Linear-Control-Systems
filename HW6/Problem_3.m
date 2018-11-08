clear all
clc

A = [0 1 0 0; 30 0 0 20; 0 0 0 1; -2 0 0 -10]; 
B = [0; -25; 0; 10]; 
C = [40 0 0 0; 0 0 10 0; 0 0 0 -5]; 
D = zeros(3, 1);

plant = ss(A, B, C, D);

poles_sys = pole(plant);
poles_c = [-15; -30; poles_sys(3:4)]';
K = place(A, B, poles_c);

poles_o = 2*poles_c; 
L = place(A', C', poles_o)';

A_11 = A-B*K; 
A_12 = -B*K; 
A_21 = zeros(4, 4); 
A_22 = A-L*C; 
A_CL = [A_11, A_12; A_21, A_22];

B_CL = [B; zeros(4, 1)]; 
C_CL = eye(8); 
D_CL = zeros(8, 1);

plant_CL_full = ss(A_CL, B_CL, C_CL, D_CL); 
t = 0:0.01:0.5; 
u = 1+0*t; 
lsim(plant_CL_full, u, t)

% plant_1 = ss(A-B*K, B, C(1, :), 0); 
% plant_2 = ss(A-B*K, B, C(2, :), 0); 
% plant_3 = ss(A-B*K, B, C(3, :), 0); 
% 
% figure; hold on 
% step(plant_1)
% step(plant_2)
% step(plant_3)
% legend('Angular Position', 'Linear Position', 'Linear Velocity')
% hold off

