function D = decasteljau(b,t)
% Funkcija decasteljau vrne shemo de Casteljaujevega postopka za dan seznam
% koordinat b pri danem parametru t.

n = length(b);
D = zeros(n);

for i = 1:n
    D(i,1) = b(i);
end

for k = 2:n
    for j = 1:n-k+1
        D(j,k) = (1-t)*D(j,k-1) + t*D(j+1,k-1);
    end
end

for j = 1:n
    for k = n-j+2:n
        D(j,k) = NaN;
    end
end

end

