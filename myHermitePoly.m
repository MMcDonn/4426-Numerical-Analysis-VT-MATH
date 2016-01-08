function [ yvalues ] = myHermitePoly( xpoints,ypoints,yppoints,xvalues )

xpoints=[0:1:5];
ypoints=sin(xpoints);
yppoints=cos(xpoints);

xvalues=[-1:0.1:6];

n=length(xpoints);
zpoints=zeros(1,2*n);
zpoints(1:2:end) = xpoints;
zpoints(2:2:end) = xpoints;
HermCF = zeros(length(zpoints));
HermCF(1:2:end,1) = ypoints';
HermCF(2:2:end,1) = ypoints';
HermCF(1:2:end,2) = yppoints';
HermCF(2:2:end-2,2) = (HermCF(3:2:end,1)-HermCF(2:2:end-2,1))./...
                        (xpoints(2:n)'-xpoints(1:n-1)');
                    
for i=3:(2*n)
    HermCF(1:end-(i-1),i) = (HermCF(2:end-(i-2),i-1)-HermCF(1:end-(i-1),i-1))./...
        (zpoints(i:end)-zpoints(1:end-(i-1)))';
end

xpoly = ones(1,length(xvalues));
Hpoly = HermCF(1,1)*xpoly;

for k = 2:(2*n)
    xpoly = xpoly.*(xvalues - zpoints(k-1));
    Hpoly = Hpoly + HermCF(1,k)*xpoly;
end
HermCF;
yvalues = Hpoly;
end
