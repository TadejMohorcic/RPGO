function D = decasteljau(b,t)
% Opis:
%  decasteljau vrne shemo de Casteljaujevega postopka za dan seznam
%  koordinat b pri danem parametru t
%
% Definicija:
%  D = decasteljau(b,t)
%
% Vhodna podatka:
%  b    seznam koordinat kontrolnih točk Bezierjeve krivulje
%       stopnje n,
%  t    parameter, pri katerem računamo koordinato Bezierjeve
%       krivulje
%
% Izhodni podatek:
%  D    tabela velikosti n+1 x n+1, ki predstavlja de Casteljaujevo
%       shemo za koordinate b pri parametru t (element na mestu
%       (1,n+1) je koordinata Bezierjeve krivulje pri parametru t,
%       elementi na mestih (i,j) za i > n-j+2 so NaN)

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