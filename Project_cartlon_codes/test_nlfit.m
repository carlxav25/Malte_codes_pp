% Create an anonymous function that describes the expected relationship
% between X and Y
 fun = @(b,X) b(1)*X(:,1) + b(2)*X(:,2) + b(3) * exp(b(4)*X(:,3));

ox = 2;

% Create a data set to use for our example
% Specify beta
% [2;5;10;50;100];
 b = [100; 200; 3; 4;]
% Create some X variables
% X = rand(100,3);
X = [0.0027e3 ; 0.0054e3; 0.0270e3; 0.2703e3;0.5405e03; 1.081e3];
% Y = fun(X) 
%Y = fun(b,X) %+ randn(100,1);
Y = [0.0163;0.0169;0.0187;0.0457;0.0923;1.1569];

for ii = 1:length(X)
    
fun = @(a) exp(-log(X(ii).*ox) + log(a))-Y(ii);
fun1= @(a) a./(X.*ox);
a0= 0.1;
% Specify a vector of starting conditions for the solvers
%b0 = [0; 0.01; 0.01; 0.01;0.01;0.01]
% Perform a nonlinear regression
% beta = nlinfit(X,Y, fun, b0)

options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective');
%options.Algorithm = 'levenberg-marquardt';
b(ii) = lsqnonlin(fun,a0,[],[],options)
j(ii) = lsqnonlin(fun1,a0,[],[],options)

end
fun_val1=j./(X.*ox);
fun_val= exp(-log(X.*ox)+ log(b)');

scatter(X,Y,'ko');hold on;
plot(X,fun_val,'b',X,fun_val1,'r')
set(gca,'xscale','log')
grid on