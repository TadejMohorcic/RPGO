function p = bernstein2power(b)
% funkcija bernstein2power pretvori polinom b = [b_0, b_1, ..., b_n],
% predstavljen v Bernsteinovi bazi, v polinom p = [p_n, ..., p_1, p_0],
% predstavljen v potenčni bazi

n = length(b);
M = zeros(n);
p = zeros(1,n);

for i = 1:n
    for j = i:n
        M(i,j) = (-1)^(i+j)*nchoosek(n-1,j-1)*nchoosek(j-1,i-1);
    end
end

q = M' * b';

for k = 1:n
    p(k) = q(n-k+1);
end

end