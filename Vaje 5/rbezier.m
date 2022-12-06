function b = rbezier(B,w,t)
% Opis:
%  rbezier vrne točke na racionalni Bezierovi krivulji, izračunane z
%  de Casteljaujevim postopkom za racionalne krivulje
%
% Definicija:
%  b = rbezier(B,w,t)
%
% Vhod:
%  B    matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
%       eno kontrolno točko racionalne Bezierjeve krivulje stopnje n
%       v prostoru dimenzije d,
%  w    seznam uteži racionalne Bezierjeve krivulje,
%  t    seznam parametrov dolžine N, za katere se računajo točke na
%       racionalni Bezierjevi krivulji
%
% Izhod:
%  b    matrika velikosti N x d, v kateri i-ta vrstica predstavlja
%       točko na racionalni Bezierjevi krivulji pri i-tem parametru
%       iz seznama t

n = size(B,2);
m = length(t);

b = zeros(m,n);

for i = 1:m
    b(i,:) = rbeziert(B,w,t(i));
end

end

function b = rbeziert(B,w,s)

n = size(B,1);

ww = repmat(w,n,1);

for i = 2:n
    for j = 1:n-1
        ww(i,j) = (1-s)*ww(i-1,j) + s*ww(i-1,j+1);
    end
end

for i = 2:n
    for j = 1:n-1
        B(j,:) = (1-s)*(ww(i-1,j)/ww(i,j))*B(j,:) + s*((ww(i-1,j+1))/ww(i,j))*B(j+1,:);
    end
end

b = B(1,:);

end