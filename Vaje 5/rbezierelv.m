function [Be,we] = rbezierelv(B,w)
% Opis:
%  rbezierelv izvede višanje stopnje racionalne Bezierjeve krivulje
%
% Definicija:
%  [Be,we] = rbezierelv(B,w)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
%       d-dimenzionalno kontrolno točko racionalne Bezierjeve krivulje
%       stopnje n,
%  w    seznam uteži racionalne Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti n+2 x d, v kateri vsaka vrstica predstavlja
%       d-dimenzionalno kontrolno točko racionalne Bezierjeve krvulje
%       stopnje n+1, ki ustreza dani racionalni Bezierjevi krivulji,
%  we   seznam dolžine n+2, v katerem vsak element predstavlja utež
%       racionalne Bezierjeve krvulje stopnje n+1, ki ustreza dani
%       racionalni Bezierjevi krivulji

n = size(B,1);
m = size(B,2);

Be = zeros(n,m);
ww = repmat(w,1,m);

Ae = bezierelv([B.*ww w],1);

we = Ae(:,m+1);

for i = 1:n+1
    for j = 1:m
        Be(i,j) = Ae(i,j)/we(i);
    end
end

end