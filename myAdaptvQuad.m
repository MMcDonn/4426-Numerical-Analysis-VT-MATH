function I = myAdaptvQuad(f,a,b,epsilon,depth)
%An adaptive quadrature method to automatically define smaller intervals on
%the function where the error remains to be large after numerical
%quadrature has been calculated. The two methods used to calculate relative
%error are Simpson's and Simpson's with half the step size.
h = (b-a)/2;
S1 = (h/3)*(f(a)+4*f((a+b)/2)+f(b));
S2 = ((h/2)/3)*(f(a) + 4*f((3*a+b)/4)+ 2*f((a+b)/2)+ 4*f((1/4)*(a+3*b))+f(b));
error = (1/15)*abs(S1-S2);
if error < epsilon
    I = S2;
else
    I = myAdaptvQuad(f,a,a+h,epsilon/2,depth) + myAdaptvQuad(f,a+h,b,epsilon/2,depth);          
end
