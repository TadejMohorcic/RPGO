function b = bezier(B,t)
% funkcija bezier vrne točke na Bezierjevi krivulji pri danih parametrih

m = length(t);
n = size(B,2);
o = size(B,1);
b = zeros(m,n);

for i = 1:m
    for j = 1:n
        M = decasteljau(B(:,j),t(i));
        b(i,j) = M(1,o);
    end
end

end