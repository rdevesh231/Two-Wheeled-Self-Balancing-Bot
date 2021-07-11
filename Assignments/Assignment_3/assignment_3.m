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
sys1 = ss(A,B,C1,D);
sys2 = ss(A,B,C2,D);
%Part 1
Q = ctrb(sys1); % Returns matrix Q
i = rank(Q) %If rank(i) is 4 then the system is controllable.
R = obsv(sys1);
j = rank(R) %If rank(j) is 4 then system is observable.
k = rank(obsv(sys2))
l = rank(ctrb(sys2));
des_pole=[-2 -3 -1  -4];
k=place(A,B,des_pole);
Anew=A-B*k;
%closed loop system using state feedback control K and system matrices.
sys3=ss(Anew,B,C1,D);
[r s]=ss2tf(Anew,B,C1,D);
h=tf(r,s)
zero(h)
des_eig = [-1.5; -2.5; -4.0; -10.5];
k = place(A,B,des_eig)
%all poles are placed correctly.
pole(sys3);
%%CONTROLLER USING LQR-
C=[C2;C1]
Q = eye(4);
R = 1;
K = lqr(A,B,Q,R)
Ac = [(A-B*K)];
Bc = [B];
Cc = [C];
Dc = [D];
sys4=ss(Ac,Bc,C1,D);
pole(sys4)
[num den]=ss2tf(Ac,Bc,C1,D)
g=tf(num,den);

