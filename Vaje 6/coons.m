function [Bx,By,Bz] = coons(Bx,By,Bz)
% Opis:
%  coons vrne kontrolne točke Coonsove ploskve
%
% Definicija:
%  [Bx,By,Bz] = coons(Bx,By,Bz)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki določajo koordinate
%               robnih kontrolnih točk (v konstrukciji Coonsove
%               ploskve se upoštevajo kontrolne točke, ki jih določa
%               prva in zadnja vrstica ter prvi in zadnji stolpec
%               posamezne matrike)
%
% Izhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki določajo koordinate
%               kontrolnih točk Coonsove ploskve

n = size(Bx,1);
m = size(Bx,2);

bx = zeros(n,m);
by = zeros(n,m);
bz = zeros(n,m);

for i = 1:m
    for j = 1:n
        b1x = (1-((j-1)/(n-1)))*Bx(1,i) + ((j-1)/(n-1))*Bx(n,i);
        b1y = (1-((j-1)/(n-1)))*By(1,i) + ((j-1)/(n-1))*By(n,i);
        b1z = (1-((j-1)/(n-1)))*Bz(1,i) + ((j-1)/(n-1))*Bz(n,i);

        b2x = (1-((i-1)/(m-1)))*Bx(j,1) + ((i-1)/(m-1))*Bx(j,m);
        b2y = (1-((i-1)/(m-1)))*By(j,1) + ((i-1)/(m-1))*By(j,m);
        b2z = (1-((i-1)/(m-1)))*Bz(j,1) + ((i-1)/(m-1))*Bz(j,m);

        b3x = (1-(j-1)/(n-1))*(1-(i-1)/(m-1))*Bx(1,1) + (1-(i-1)/(m-1))*((j-1)/(n-1))*Bx(n,1) + ((i-1)/(m-1))*(1-(j-1)/(n-1))*Bx(1,m) + ((j-1)/(n-1))*((i-1)/(m-1))*Bx(n,m);
        b3y = (1-(j-1)/(n-1))*(1-(i-1)/(m-1))*By(1,1) + (1-(i-1)/(m-1))*((j-1)/(n-1))*By(n,1) + ((i-1)/(m-1))*(1-(j-1)/(n-1))*By(1,m) + ((j-1)/(n-1))*((i-1)/(m-1))*By(n,m);
        b3z = (1-(j-1)/(n-1))*(1-(i-1)/(m-1))*Bz(1,1) + (1-(i-1)/(m-1))*((j-1)/(n-1))*Bz(n,1) + ((i-1)/(m-1))*(1-(j-1)/(n-1))*Bz(1,m) + ((j-1)/(n-1))*((i-1)/(m-1))*Bz(n,m);
        
        bx(j,i) = b1x + b2x - b3x;
        by(j,i) = b1y + b2y - b3y;
        bz(j,i) = b1z + b2z - b3z;
    end
end

end