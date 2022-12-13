function x = vectorbary(P,T)
% Opis:
%  vectorbary vrne baricentrične koordinate vektorja P - 0 glede na dan
%  trikotnik
%
% Definicija:
%  x = vectorbary(P,T)
%
% Vhodna podatka:
%  P    vrstica, ki predstavlja kartezične koordinate točke v ravnini,
%  T    matrika s tremi vrsticami, v kateri vsaka vrstica predstavlja
%       kartezične koordinate oglišč trikotnika
%
% Izhodni podatek:
%  x    vrstica dolžine 3, ki predstavlja baricentrične koordinate
%       vektorja P - 0, glede na trikotnik, podan s T

u = pointbary(P,T);
v = pointbary([0 0],T);

x = u - v;
end

