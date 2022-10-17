function b = power2bernstein(p)
% funkcija power2bernstein pretvori polinom p = [p_n, ..., p_1, p_0],
% predstavljen v potenčni bazi, v polinom b = [b_0, b_1, ..., b_n],
% predstavljen v Bernsteinovi bazi

n = length(p);
M = zeros(n);
b = zeros(1,n);

for i = 1:n
    for j = i:n
        M(i,j) = nchoosek(j-1, i-1)/nchoosek(n-1, i-1);
    end
end

q = M * p';

for k = 1:n
    b(k) = q(n-k+1);
end

end