t = [0:999]'*pi/1000; 
X1_1 = 0.5*exp(-t)-0.2*exp(-2*t)+0.1*sin(t)-0.3*cos(t); 
X2_1 = 2/5*exp(-2*t)-0.5*exp(-t)+0.3*sin(t)+0.1*cos(t); 

subplot(211)
plot(t, X1_1)

subplot(212)
plot(t, X2_1)

A=[0 1;-2 -3]; B=[0;1];
C=eye(2); D=zeros(2,1);
sys=ss(A,B,C,D);
%Define Time and Input Vectors
T1=[0:999]'*pi/1000; T=[T1;pi+T1]; 
U=[sin(T1);zeros(1000,1)];
figure; 
lsim(sys,U,T);
xlim([0 pi])