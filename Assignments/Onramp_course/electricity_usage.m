load electricity.mat
usage ;
usage(2,3) = 2.74 ; 
res = usage(:,1) ;
comm = usage(:,2) ;
ind = usage(:,3) ;
yrs = (1991:2013)' ;
plot(yrs,res,"b--")
hold on
plot(yrs,comm,"k:")
plot(yrs,ind,"m-.")
hold off
title("July Electricity Usage")
legend("res","comm","ind")
