mc = 1.5;
mp = 0.5;
L = 1;
d1 = 0.1;
d2 = 0.1;
g = 9.82;
A = [0           0               1                 0;
     0           0               0                 1;
     0       (g*mp)/mc        -d1/mc          -d2/(L*mc);
     0    (g*(mc+mp))/(mc*L)   -d1/(L*mc)    -(d2*(mc+mp))/(L*L*mc*mp)];
C1 = [0 1 0 0]; %output-q1
C2 = [1 0 0 0]; %output-q2
B = [0 0 1/mc 1/(L*mc)]';
D = 0;
sys1 = ss(A,B,C1,D)
sys2 = ss(A,B,C2,D)
