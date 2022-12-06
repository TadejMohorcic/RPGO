function BS = beziersub(B,t,k)
% Opis:
%  beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija:
%  BS = beziersub(B,t)
%
% Vhodni podatki:
%  B    matrika kontrolnih točk Bezierjeve krivulje, v kateri
%       vsaka vrstica predstavlja eno kontrolno točko,
%  t    parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
%  BS   celica, ki vsebuje kontrolne točke dveh krivulj, ki jih
%       dobimo s subdivizijo prvotne Bezierjeve krivulje

n = size(B,1);
m = size(B,2);
C = zeros(n,m);
D = zeros(n,m);
BS = cell(1,2^k);

for i = 1:m
    M = decasteljau(B(:,i),t);
    for j = 1:n
        C(j,i) = M(1,j);
        D(j,i) = M(j,n-j+1);
    end
end

if k == 1
    BS{1,1} = C;
    BS{1,2} = D;

else
    BS1 = beziersub(C,t,k-1);
    BS2 = beziersub(D,t,k-1);
    BS = [BS1 BS2];
    
end