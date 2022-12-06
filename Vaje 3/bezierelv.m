function Be = bezierelv(B,k)
% Opis:
%  bezierelv izvede višanje stopnje dane Bezierjeve krivulje
%
% Definicija:
%  Be = bezierelv(B,k)
%
% Vhodna podatka:
%  B    matrika velikosti (n+1) x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno točko Bezierjeve
%       krivulje stopnje n,
%  k    število, ki določa, za koliko želimo zvišati stopnjo
%       dane Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti (n+k+1) x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno točko Bezierjeve
%       krvulje stopnje n+k, ki ustreza dani Bezierjevi krivulji

n = size(B,1);
m = size(B,2);
A = zeros(n+1,m);

for i = 1:m
    A(1,i) = B(1,i);
    A(n+1,i) = B(n,i);
end

for i = 1:m
    for j = 2:n
        A(j,i) = (1-(j-1)/n)*B(j,i) + (j-1)/n*B(j-1,i);
    end
end

if k == 1
    Be = A;

else
    Be = bezierelv(A,k-1);

end