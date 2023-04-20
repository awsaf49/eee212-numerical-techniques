function [sol] = gen_reg( x,y,n )
a = zeros(n+1);
b =zeros(n+1,1);
for ii = 1:n+1
    for jj = 1:n+1
        a(ii,jj) = sum(x.^(ii + jj - 2));
    end
b(ii,1) = sum(y.*(x.^(ii-1)));

end
sol = a\b;
sol = sol';
sol = flip(sol);
end

