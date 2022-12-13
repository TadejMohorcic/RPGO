function S = lsqbezier2spline(M,N,m,n,P)
% Opis:
%  lsqbezier2spline vrne kontrolne točke tenzorskih polinomov, ki
%  določajo zvezno odvedljiv zlepek, ki v smislu metode najmanjših
%  kvadratov najbolje aproksimira dane podatke
%
% Definicija:
%  S = lsqbezier2spline(M,N,m,n,P)
%
% Vhodni podatki:
%  M,N      parametra, ki določata delitev domene parametrizacije,
%  m,n      parametra, ki določata stopnjo polinoma nad pravokotnikom
%           delitve,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje parametra z
%           intervala [0,1] ter njima pripadajočo vrednost
%
% Izhodni podatek:
%  S        celica velikosti N x M, v kateri vsak element vsebuje
%           matriko s koeficienti polinoma, ki določa zlepek nad
%           pravokotnikom delitve domene

S = cell(N,M);

U = linspace(0,1,M+1);
V = linspace(0,1,N+1);

for i = 1:M
    ur = U(i) <= P(:,1) & P(:,1) <= U(i+1);
    for j = 1:N
        vr = V(j) <= P(:,2) & P(:,2) <= V(j+1);
        A = P(ur & vr,:);
        S{j,i} = lsqbezier2(m,n,A);
    end
end

end