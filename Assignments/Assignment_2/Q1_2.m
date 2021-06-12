mc = 1.5;
mp = 0.5;
g = 9.82;
L = 1;
d1 = 0.1;
d2 = 0.1;
A = [0           0               1                 0;
     0           0               0                 1;
     0       (g*mp)/mc        -d1/mc          -d2/(L*mc);
     0    (g*(mc+mp))/(mc*L)   -d1/(L*mc)    -(d2*(mc+mp))/(L*L*mc*mp)];
C1 = [0 1 0 0]; %q2-output
C2 = [1 0 0 0]; %q1-output
B = [0 0 1/mc 1/(L*mc)]';
D = 0;
sys1 = ss(A,B,C1,D);
sys2 = ss(A,B,C2,D);
eigs = eig(A)
p1 = pole(sys1);
p2 = pole(sys2);
z1 = zero(sys1);
z2 = zero(sys2);
pzmap(sys1)
pzmap(sys2)
grid on
Q = ctrb(sys1);
i = rank(Q) %If rank(Q) is 4 then the system is controllable.
R = obsv(sys1);
j = rank(R) %If rank(R) is 4 then system is observable.

%for both q1 and  q2, system is unstable because we have poles in right
%half plane
