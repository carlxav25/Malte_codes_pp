rng default % for reproducibility
d = linspace(0,3);
y = exp(-1.3*d) + 0.05*randn(size(d));

x0 =10;

%for i = 1:5

    fun = @(r) (exp(-d*r)-y);
    x = lsqnonlin(fun,x0)



 plot(d,y,'ko',d,exp(-x*d),'bo')
 legend('Data','Best fit')
 xlabel('t')
 ylabel('exp(-tx)')
