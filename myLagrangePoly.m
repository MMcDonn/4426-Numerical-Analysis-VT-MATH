function yvalues = myLagrangePoly(xpoints,ypoints,xvalues)
%myLagrangePoly will give as output a vector of values which are the
%interpolated y-values for a given vector of x-values.
n = size(xpoints,2);
L = ones(n,size(xvalues,2));
yvalues = zeros(1,size(xvalues,2));

for i = 1:n
    for k = 1:n
        if (k~=i)
            L(i,:) = L(i,:).*(xvalues-xpoints(k))/(xpoints(i)-xpoints(k))         
        end
    end
end
for i=1:n
    yvalues = yvalues + ypoints(i)*L(i,:);
end
end

