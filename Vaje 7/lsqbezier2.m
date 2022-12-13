function B = lsqbezier2(m,n,P)
% Opis:
%  lsqbezier2 vrne koeficiente tenzorskega polinoma, ki po metodi
%  najmanjših kvadratov najbolje aproksimira dane podatke
%
% Definicija:
%  B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
%  m,n      parametra, ki določata stopnjo polinoma,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje parametra z
%           intervala [0,1] ter njima pripadajočo vrednost
%
% Izhodni podatek:
%  B        matrika velikosti n+1 x m+1 s koeficienti polinoma, ki po
%           metodi najmanjših kvadratov najbolje aproksimira podatke

l = size(P,1);

u = zeros(1,m+1);
v = zeros(1,n+1);
A = zeros(1,(m+1)*(n+1));

for i = 1:l
    s = 1;
    for j = 1:m+1
        u(j) = 1;
        for k = 1:n+1
            v(k) = 1;
            A(i,s) = bezier(u',P(i,1))*bezier(v',P(i,2));
            s = s + 1;
            v(k) = 0;
        end
        u(j) = 0;
    end
end

x = A\P(:,3);
B = reshape(x,n+1,m+1);

end