clc; 
clear all; 
close all; 
D = 0;
C = [1 0 0 0]; 
B1 = [0 0 0.0033 -0.02]'; 
B2 = [0 0 0 600]'; 
B = [B1 B2]; 
A = [0 0 1 0; 0 0 0 1; -10 10 -2 2; 60 -660 12 -12];
t = 0:0.001:7;
x0 = [0.2 0 0 0]';
s1 = ss(A, B1, C, D); 
figure() 
step(s1)
s2 = ss(A, B1, C, D);
[y, t, x] = initial(s2, x0, t); 
figure(); 
plot(t, x(:,1) , 'b', t, x(:,2), 'g',t, x(:,3), 'r.',t, x(:,4), 'k-.') 
ylabel('Amp') 
xlabel('Time') 
title(' Initial Conditions Response') 
legend('x1', 'x2','x3','x4')
t_2 = 0:0.04:7;
s3 = ss(A, B2, C, D); 
y_R = randn(size(t_2)).*cos(t_2); 
figure(); 
lsim(s3, y_R, t_2)   
