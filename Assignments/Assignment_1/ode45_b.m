c1=100;
c2=1000;
k1=10000;
k2=100000;
m1=10;
m2=100;
fun=@(t,y)[y(3);y(4);(5+k1*y(2)+c1*y(4)-k1*y(1)-c1*y(3))/m1;(k1*y(1)+c1*y(3)-(k1+k2)*y(2)-(c1+c2)*y(4))/m2]
tspan=[0 10];
[T,Y]=ode45(fun,tspan,[0;0;0;0]);
figure(1)
plot(T,Y(:,1));
xlabel('Time(s)');ylabel('x1(m)');
grid on;
figure(2)
plot(T,Y(:,2));
xlabel('Time(s)');ylabel('x2(m)');
grid on;