function S = argyrisspline(tri,f,Df,Hf)
% Opis:
%  argyrisspline izračuna Bezierjeve predstavitve polinomov, ki
%  določajo Argyrisov zlepek nad triangulacijo
%
% Definicija:
%  S = argyrisspline(tri,f,Df,Hf)
%
% Vhodni podatki:
%  tri      objekt razreda triangulation, ki določa triangulacijo
%           domene, nad katero aproksimiramo funkcijo f,
%  f        funkcija, ki jo interpoliramo,
%  Df       gradient funkcije, ki jo interpoliramo,
%  Hf       Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
%  S        celica z dolžino, ki ustreza številu trikotnikov v
%           triangulaciji, v kateri vsak element vsebuje matriko
%           velikosti 6 x 6, ki predstavlja koeficiente Argyrisovega
%           polinoma v Bezierjevi obliki

n = size(tri.ConnectivityList,1);

S = cell(1,n);

for i = 1:n
    a = tri.ConnectivityList(i,:);
    T = [tri.Points(a(1),:); tri.Points(a(2),:); tri.Points(a(3),:)];
    S{1,i} = argyris(T,f,Df,Hf);
end

end