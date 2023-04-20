function [ x,n ] = newt( f,g,x_guess,tol )
iter = 0;
while abs(-f(x_guess)/g(x_guess))>tol
    iter = iter + 1;
    xk = x_guess - f(x_guess)/g(x_guess);
    x_guess = xk;   
end
x = xk;
n = iter;


end

