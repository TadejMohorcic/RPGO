function b = bezier(B,t)
% Opis:
%  bezier vrne točke na Bezierjevi krivulji pri danih parametrih
%
% Definicija:
%  b = bezier(B,t)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne točke
%       Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
%  t    seznam parametrov dolžine k, pri katerih računamo vrednost
%       Bezierjeve krivulje
%
% Izhodni podatek:
%  b    matrika velikosti k x d, kjer i-ta vrstica predstavlja točko
%       na Bezierjevi krivulji pri parametru iz t na i-tem mestu

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