function [yvalues] = myNewtonPoly(xpoints,ypoints,xvalues)
%myNewtonPoly computes Newton interpolation
%xpoints and ypoints are the interpolation nodes, should have the same
%size
%xvalues are the values where you want to compute the intepolation
%yvalues is the array of computed interpolation values

n=length(xpoints);
NCf = zeros(n);
NCf(:,1) = ypoints';
for i=1:n-1
    NCf(1:n-i,i+1) = (NCf(2:n+1-i,i)-NCf(1:n-i,i))./(xpoints(i+1:n)-xpoints(1:n-i))';
end

yvalues = NCf(1,1)*ones(1,length(xvalues));
for k = 2:n
    prod = 1; j=1;
    while j<k
        prod = prod.*(xvalues-xpoints(j));
        j=j+1;
    end
    yvalues = yvalues + NCf(1,k).*prod;
end

end
