xpointsU=[-5:1:5];
ypointsU=1./(1+xpointsU.^2);
% compute the roots of the Chebyshev polynomial
%T_11(x) and map them on the interval [-5,5]
xpointsCb= chebyRootsScaled(size(xpointsU,2),min(xpointsU),max(xpointsU));
ypointsCb=1./(1+xpointsCb.^2);

xvalues=[-6:0.1:6];
yvaluesU=myLagrangePoly(xpointsU,ypointsU,xvalues);
yvaluesCb=myLagrangePoly(xpointsCb,ypointsCb,xvalues);


% The Chebyshev points give a better set for Lagrange interpolation. The
% error is clearly less around the nodes of the outer interval.
syms x;
k = ezplot(1/(1+x^2));
hold on
EP = plot(xvalues,yvaluesU,'r');
CP = plot(xvalues,yvaluesCb,'b');
legend([EP,CP],'Equidistant Points','Chebyshev Points')
set(k,'Color','k');
plot(xpointsU,ypointsU,'ro','Linewidth',1.5)
plot(xpointsCb,ypointsCb,'bo','Linewidth',1.5)
hold off


 